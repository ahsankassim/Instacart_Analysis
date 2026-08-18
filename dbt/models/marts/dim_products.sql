SELECT
    N.PRODUCT_ID,
    N.PRODUCT_NAME,
    N.AISLE_NAME,
    N.DEPARTMENT_NAME,
    S.ORDER_COUNT,
    S.AVG_CART_POSITION,
    S.REORDER_RATE,
    S.WEIGHTED_REORDER_RATE    
FROM 
    {{ ref('int_product_details') }} N
LEFT JOIN
    {{ ref('int_product_order_metrics') }} S
ON
    N.PRODUCT_ID = S.PRODUCT_ID
