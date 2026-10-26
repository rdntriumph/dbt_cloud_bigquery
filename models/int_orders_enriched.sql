{{ config(materialized='view') }}

SELECT
    order_id,
    customer_id,
    order_date,
    amount,
    status,

    CASE
        WHEN status = 'completed' THEN amount
        ELSE NUMERIC '0'
    END AS completed_amount,

    CASE
        WHEN amount < 0 THEN 'invalid'
        WHEN amount >= 2000 THEN 'high_value'
        ELSE 'standard'
    END AS order_category

FROM {{ ref('stg_orders') }}