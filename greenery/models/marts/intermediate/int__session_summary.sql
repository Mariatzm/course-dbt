{{
  config(
    materialized='table'
  )
}}

{%- set event_types = dbt_utils.get_column_values(
    table=ref('stg_postgres__events'),
    column='event_type'
) -%}

WITH stg_events AS (
  SELECT
    *
  FROM {{ ref('stg_postgres__events') }}
)

SELECT
  SESSION_ID
  , USER_ID
  {%- for event_type in event_types %}
  , {{sum_per_event_type(event_type)}} as {{event_type}}s
  {%- endfor %}
  , MAX(CASE WHEN EVENT_TYPE = 'checkout' THEN CREATED_AT ELSE NULL END) AS MAX_CHECKOUT_TIME
  , MAX(CASE WHEN EVENT_TYPE = 'package_shipped' THEN CREATED_AT ELSE NULL END) AS MAX_SHIPPED_TIME
  , MIN(CREATED_AT) AS FIRST_SESSION_EVENT_TIME
  , MAX(CREATED_AT) AS LAST_SESSION_EVENT_TIME
  , DATEDIFF(MINUTES, FIRST_SESSION_EVENT_TIME, LAST_SESSION_EVENT_TIME) AS SESSION_DURATION_MINUTES
FROM stg_events
GROUP BY 1,2