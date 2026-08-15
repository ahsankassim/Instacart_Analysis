SELECT
    O1.order_id,
    O1.user_id,
    O1.order_number,
    O2.day_name AS order_day,
    O1.order_hour_of_day AS order_hour,
    O1.days_since_prior_order
FROM
    {{ source('source', 'orders') }} O1
LEFT JOIN
    {{ ref('order_dow_mapping') }} O2
ON
    O1.order_dow = O2.order_dow
WHERE
    O1.eval_set != 'test'

