{{
  config(
    materialized='table'
  )
}}

WITH product_views AS (
  SELECT
    *
  FROM {{ ref('int__events_info') }}
  WHERE EVENT_TYPE = 'page_view'
)

SELECT EVENT_ID as VIEW_ID
    , SESSION_ID
    , USER_ID
    , USER_FIRST_NAME
    , USER_LAST_NAME
    , PAGE_URL
    , CREATED_AT
    , PRODUCT_ID
    , PRODUCT_NAME
    , PRODUCT_PRICE
FROM product_views