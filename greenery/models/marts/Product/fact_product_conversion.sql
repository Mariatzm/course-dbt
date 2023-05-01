{{
  config(
    materialized='table'
  )
}}

WITH product_views AS (
  SELECT 
    product_id
    , COUNT( DISTINCT SESSION_ID) total_views
  FROM {{ ref('int__events_page_views') }}
  GROUP BY 1
)

, product_orders AS (
  SELECT 
    product_id
    , count_product_order_sessions
  FROM {{ ref('int__product_ordered_sessions') }}
)

, products AS (
  SELECT DISTINCT 
   product_id 
   , NAME as product_name
  FROM {{ ref('stg_postgres__products') }}
)


SELECT product_name
 , count_product_order_sessions/total_views*100 as product_conversion_rate
FROM product_views
JOIN products USING (product_id)
LEFT JOIN product_orders USING (product_id)


