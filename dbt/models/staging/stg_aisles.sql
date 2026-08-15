SELECT
    aisle_id,
    aisle AS aisle_name
FROM
    {{ source('source', 'aisles') }}