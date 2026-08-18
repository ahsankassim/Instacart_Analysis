SELECT
    S.USER_ID,
    B.ORDER_COUNT,
    B.TENURE,
    B.AVG_INTERVAL,
    S.AVG_ITEMS_PER_ORDER,
    S.UNIQUE_PRODUCTS,
    S.REORDER_RATE,
    S.WEIGHTED_REORDER_RATE
FROM 
    {{ ref('int_user_reorder_metrics')}} S
JOIN 
    {{ ref('int_user_order_cadence')}} B
ON  
    S.USER_ID = B.USER_ID
