{{
  config(
    materialized='table'
  )
}}

WITH daily_product_funnel AS (
  SELECT 
      DATE(FIRST_SESSION_EVENT_TIME) DATE_OF_SESSION
    , COUNT(DISTINCT session_id) daily_sessions
    , COUNT(DISTINCT CASE WHEN PAGE_VIEWS>0 THEN SESSION_ID ELSE NULL END) daily_sessions_with_page_views 
    , COUNT(DISTINCT CASE WHEN ADD_TO_CARTS>0 THEN SESSION_ID ELSE NULL END) daily_sessions_with_add_to_carts
    , COUNT(DISTINCT CASE WHEN CHECKOUTS>0 THEN SESSION_ID ELSE NULL END) daily_sessions_with_checkouts
  FROM {{ ref('int__session_summary') }}
  GROUP BY 1 
)

SELECT *
FROM daily_product_funnel


