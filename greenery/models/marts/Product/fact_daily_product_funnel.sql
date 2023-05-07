{{
  config(
    materialized='table'
  )
}}

WITH daily_product_funnel AS (
  SELECT 
      *
    , daily_sessions_with_page_views/daily_sessions*100 AS daily_page_views_rate
    , daily_sessions_with_add_to_carts/daily_sessions*100 AS daily_add_to_carts_rate
    , daily_sessions_with_checkouts/daily_sessions*100 AS daily_conversion_rate
    , daily_sessions_with_add_to_carts/daily_sessions_with_page_views*100 AS daily_views_to_cart_rate
    , daily_sessions_with_checkouts/daily_sessions_with_add_to_carts*100 AS daily_cart_to_checkout_rate
  FROM {{ ref('int__daily_product_funnel') }}
)

SELECT *
FROM daily_product_funnel


