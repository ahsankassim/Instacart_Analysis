{{ config( materialized = 'table') }}

 
WITH TEMP_VIEW AS (
    SELECT 
        MEDIAN(ORDER_COUNT) AS M,
        AVG(REORDER_RATE) AS C
    FROM 
        {{ ref('user_order_summary_1') }}
)

SELECT 
    USER_ID,
    ORDER_COUNT,
    AVG_ITEMS_PER_ORDER,
    UNIQUE_PRODUCTS,
    ROUND(REORDER_RATE, 2) AS REORDER_RATE,
    ROUND(
        (ORDER_COUNT/(ORDER_COUNT + M)) * REORDER_RATE +
        (M/(M+ORDER_COUNT)) * C,
        2 
    ) AS WEIGHTED_REORDER_RATE
FROM    
    {{ ref('user_order_summary_1') }}
CROSS JOIN 
    TEMP_VIEW