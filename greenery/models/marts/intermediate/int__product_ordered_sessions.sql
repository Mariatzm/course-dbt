{{

    config(
        MATERIALIZED = 'table'
    )
}}

WITH events AS (
    SELECT session_id
        , order_id 
    FROM {{ ref('stg_postgres__events') }}
    WHERE order_id is not null 
)

, items_ordered AS ( 
    SELECT order_id
        , product_id 
    FROM {{ ref('stg_postgres__order_items')}}
)


SELECT items_ordered.product_id
    , COUNT(DISTINCT events.session_id) count_product_order_sessions
FROM events
JOIN items_ordered on events.order_id = items_ordered.order_id
GROUP BY items_ordered.product_id
