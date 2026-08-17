{{ config(materialized = 'table') }}

-- Joining the orders and order products tables to get per row per user_id, product_id, order_id combination.
WITH TEMP_USER AS (
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

-- Now calculating the required column by aggregating on user_id

SELECT
    USER_ID, 
    ROUND(COUNT(PRODUCT_ID)/COUNT(DISTINCT ORDER_ID),2) AS AVG_ITEMS_PER_ORDER,
    COUNT(DISTINCT PRODUCT_ID) AS UNIQUE_PRODUCTS,
    ROUND(AVG(IS_REORDERED),2) AS REORDER_RATE 
FROM 
    TEMP_USER
GROUP BY   
    1