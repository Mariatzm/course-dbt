{{
  config(
    materialized='table'
  )
}}

WITH total_product_funnel AS (
  SELECT 
      SUM(daily_sessions) AS total_sessions
    , SUM(daily_sessions_with_page_views) AS total_sessions_with_page_views 
    , SUM(daily_sessions_with_add_to_carts) AS total_sessions_with_add_to_carts
    , SUM(daily_sessions_with_checkouts) AS total_sessions_with_checkouts
  FROM {{ ref('int__daily_product_funnel') }}
)

SELECT *
FROM total_product_funnel


