{{ config(materialized = 'ephemeral') }}

SELECT
    P.PRODUCT_ID, 
    P.PRODUCT_NAME, 
    A.AISLE_NAME, 
    D.DEPARTMENT_NAME
FROM
    {{ ref('stg_products') }} P 
LEFT JOIN 
    {{ ref('stg_aisles') }} A 
ON 
    P.AISLE_ID = A.AISLE_ID
LEFT JOIN 
    {{ ref('stg_departments') }} D 
ON 
    P.DEPARTMENT_ID = D.DEPARTMENT_ID