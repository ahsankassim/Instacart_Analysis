SELECT
    S.USER_ID,
    B.ORDER_COUNT,
    B.TENURE,
    B.AVG_INTERVAL,
    S.AVG_ITEMS_PER_ORDER,
    S.UNIQUE_PRODUCTS,
    S.REORDER_RATE
FROM 
    {{ ref('user_order_summary')}} S 
JOIN 
    {{ ref('user_base')}} B  
ON  
    S.USER_ID = B.USER_ID