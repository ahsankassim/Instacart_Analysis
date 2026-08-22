SELECT 
    ORDER_ID,
    PRODUCT_ID,
    ADD_TO_CART_ORDER,
    IS_REORDERED
FROM 
    {{ ref('stg_order_products') }}
    