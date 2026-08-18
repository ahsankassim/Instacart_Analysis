{{ config(materialized = 'ephemeral') }}

SELECT
    P.PRODUCT_ID, 
    P.PRODUCT_NAME, 
    A.AISLE_NAME, 
    DEPARTMENTS.DEPARTMENT_NAME
FROM
    {{ ref('stg_products') }} AS P
LEFT JOIN 
    {{ ref('stg_aisles') }} AS A
ON 
    P.AISLE_ID = A.AISLE_ID
LEFT JOIN 
    {{ ref('stg_departments') }} AS DEPARTMENTS
ON 
    P.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
