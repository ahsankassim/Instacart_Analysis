{{ config(materialized = 'view') }}

-- One row per order line, enriched with the ordering user.
WITH USER_ORDER_LINES AS (
    SELECT 
        O.ORDER_ID,
        P.PRODUCT_ID,
        O.USER_ID,
        IS_REORDERED
    FROM 
        {{ ref('stg_orders') }}  O
   INNER JOIN 
        {{ ref('stg_order_products') }} P
    ON 
        O.ORDER_ID = P.ORDER_ID
)

-- Aggregate order-line activity to one row per user.

SELECT
    USER_ID, 
    ROUND(COUNT(PRODUCT_ID)/COUNT(DISTINCT ORDER_ID),2) AS AVG_ITEMS_PER_ORDER,
    COUNT(DISTINCT PRODUCT_ID) AS UNIQUE_PRODUCTS,
    COUNT(DISTINCT ORDER_ID) AS ORDER_COUNT,
    AVG(IS_REORDERED) AS REORDER_RATE 
FROM 
    USER_ORDER_LINES
GROUP BY   
    1
