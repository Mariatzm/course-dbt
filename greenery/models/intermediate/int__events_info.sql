{{
  config(
    materialized='table'
  )
}}

WITH stg_events AS (
  SELECT
    *
  FROM {{ ref('stg_postgres__events') }}
)

, users AS (
  SELECT
    *
  FROM {{ ref('stg_postgres__users') }}
)

, products AS (
  SELECT
    *
  FROM {{ ref('stg_postgres__products') }}
)

SELECT stg_events.EVENT_ID
    , stg_events.SESSION_ID
    , stg_events.USER_ID
    , users.FIRST_NAME AS USER_FIRST_NAME
    , users.LAST_NAME AS USER_LAST_NAME
    , stg_events.PAGE_URL
    , stg_events.CREATED_AT
    , stg_events.EVENT_TYPE
    , stg_events.ORDER_ID
    , stg_events.PRODUCT_ID
    , products.NAME AS PRODUCT_NAME
    , products.PRICE AS PRODUCT_PRICE
FROM stg_events
LEFT JOIN users on stg_events.USER_ID = users.USER_ID
LEFT JOIN products on stg_events.PRODUCT_ID = products.PRODUCT_ID
