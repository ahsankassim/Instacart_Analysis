SELECT
    order_id,
    product_id,
    add_to_cart_order,
    reordered AS is_reordered
FROM 
    {{ source('source', 'order_products_prior') }}

UNION ALL 

SELECT
    order_id,
    product_id,
    add_to_cart_order,
    reordered AS is_reordered
FROM 
    {{ source('source', 'order_products_train') }}