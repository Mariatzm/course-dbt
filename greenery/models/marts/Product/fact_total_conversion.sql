{{
  config(
    materialized='table'
  )
}}

WITH event_sessions AS (
  SELECT
    COUNT( DISTINCT SESSION_ID) total_sessions 
  FROM {{ ref('int__events_info') }}
)

, checkouts AS (
  SELECT
    COUNT( DISTINCT SESSION_ID) total_checkouts
  FROM {{ ref('int__events_checkouts') }}
)

SELECT total_checkouts/total_sessions*100 as total_conversion
FROM event_sessions
JOIN checkouts on 1=1

