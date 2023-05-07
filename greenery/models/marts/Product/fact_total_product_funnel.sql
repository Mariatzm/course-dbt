{{
  config(
    materialized='table'
  )
}}

WITH total_product_funnel AS (
  SELECT 
    *
    , total_sessions_with_page_views/total_sessions*100 AS total_page_views_rate
    , total_sessions_with_add_to_carts/total_sessions*100 AS total_add_to_carts_rate
    , total_sessions_with_checkouts/total_sessions*100 AS total_conversion_rate
    , total_sessions_with_add_to_carts/total_sessions_with_page_views*100 AS total_views_to_cart_rate
    , total_sessions_with_checkouts/total_sessions_with_add_to_carts*100 AS total_cart_to_checkout_rate
  FROM {{ ref('int__total_product_funnel') }}
)

SELECT *
FROM total_product_funnel


