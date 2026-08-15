SELECT
    order_id,
    user_id,
    order_number,
    day_name AS order_day,
    order_hour_of_day AS order_hour,
    days_since_prior_order
FROM
    {{ source('source', 'orders') }} O1
LEFT JOIN
    {{ ref('order_dow_mapping') }} O2
ON
    O1.order_dow = O2.order_dow

