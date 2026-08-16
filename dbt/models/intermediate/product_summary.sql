{{ config( materialized = 'view') }}

SELECT
       PRODUCT_ID, 
       COUNT(PRODUCT_ID) AS ORDER_COUNT,
    ROUND(AVG(ADD_TO_CART_ORDER),2) AS AVG_CART_POSITION,
    ROUND(AVG(IS_REORDERED),2) AS REORDER_RATE
  FROM 
      {{ ref('stg_order_products')}}
  GROUP BY 1