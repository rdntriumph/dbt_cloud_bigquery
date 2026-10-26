{{ config(materialized='table') }}

SELECT
    order_id,
    customer_id,
    order_date,
    amount,
    status,
    completed_amount,
    order_category,

    status = 'completed' AS is_completed

FROM {{ ref('int_orders_enriched') }}