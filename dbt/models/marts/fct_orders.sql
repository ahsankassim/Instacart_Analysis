WITH BASKET_SIZE AS (
    
    SELECT 
        O.ORDER_ID, COUNT(OP.PRODUCT_ID) AS BASKET_SIZE
    FROM 
        {{ ref('stg_orders')}} O
    LEFT JOIN 
        {{ ref('stg_order_products')}} OP
    ON 
        O.ORDER_ID = OP.ORDER_ID
    GROUP BY 
        O.ORDER_ID
)



SELECT 
    O.*, BASKET_SIZE
FROM 
    {{ ref('stg_orders') }} O
JOIN 
    BASKET_SIZE B
ON 
    O.ORDER_ID = B.ORDER_ID
