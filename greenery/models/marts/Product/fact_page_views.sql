{{
  config(
    materialized='table'
  )
}}

SELECT *
FROM {{ ref('int__events_page_views') }}