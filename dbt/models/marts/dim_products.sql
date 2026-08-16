SELECT
    N.PRODUCT_ID,
    N.PRODUCT_NAME,
    N.AISLE_NAME,
    N.DEPARTMENT_NAME,
    S.ORDER_COUNT,
    S.AVG_CART_POSITION,
    S.REORDER_RATE    
FROM 
    {{ ref('product_names') }} N 
JOIN
    {{ ref('product_summary') }} S 
ON
    N.PRODUCT_ID = S.PRODUCT_ID