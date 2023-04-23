{{
  config(
    materialized='table'
  )
}}

WITH stg_users AS (
  SELECT
    *
  FROM {{ ref('stg_postgres__users') }}
), stg_addresses AS (
  SELECT
    *
  FROM {{ ref('stg_postgres__addresses') }}
)

SELECT stg_users.USER_ID
    , stg_users.FIRST_NAME
    , stg_users.LAST_NAME
    , stg_users.FIRST_NAME || ' ' || stg_users.LAST_NAME AS FULL_NAME
    , stg_users.EMAIL
    , stg_users.PHONE_NUMBER
    , stg_users.CREATED_AT AS ACCOUNT_FIRST_CREATED_TIME
    , stg_users.UPDATED_AT AS ACCOUNT_LAST_UPDATED_TIME
    , stg_addresses.ADDRESS
    , stg_addresses.ZIPCODE
    , stg_addresses.STATE
    , stg_addresses.COUNTRY
FROM stg_users 
LEFT JOIN stg_addresses ON stg_users.ADDRESS_ID = stg_addresses.ADDRESS_ID