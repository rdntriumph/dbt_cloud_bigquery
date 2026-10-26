{{ config(materialized='table') }}

SELECT
    order_id,
    customer_id,
    order_date,
    product_name,
    quantity,
    unit_price,
    order_status,
    payment_method,
    quantity * unit_price AS total_amount
FROM `project-c65854a4-202a-4b6f-be0.staging.orders`
