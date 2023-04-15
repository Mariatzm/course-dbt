
### SQL QUESTIONS 

## How many users do we have?

```
SELECT COUNT (DISTINCT USER_ID) FROM DEV_DB.DBT_MARIATZIMOPOULOUSONYCOM.STG_POSTGRES__USERS;
```

ANSWER: 130 

## On average, how many orders do we receive per hour?

```
SELECT AVG(num_orders) avg_orders_per_hours -- not taking into account hours without orders 
FROM(
    SELECT DATE_TRUNC('hour',CREATED_AT) hour_of_order_creation
        , COUNT(DISTINCT ORDER_ID) num_orders 
    FROM DEV_DB.DBT_MARIATZIMOPOULOUSONYCOM.STG_POSTGRES__ORDERS
    GROUP BY 1
);

```

ANSWER: 7.520833


## On average, how long does an order take from being placed to being delivered?

```
SELECT AVG(time_to_deliver) avg_time_to_delivery
FROM(
    SELECT ORDER_ID
        , TIMESTAMPDIFF(HOUR, CREATED_AT,DELIVERED_AT) AS time_to_deliver
    FROM DEV_DB.DBT_MARIATZIMOPOULOUSONYCOM.STG_POSTGRES__ORDERS
);

```

ANSWER: 93.403279

## How many users have only made one purchase? Two purchases? Three+ purchases?


```
SELECT num_orders,
    COUNT(DISTINCT USER_ID) num_users
FROM(
    SELECT USER_ID
     , COUNT(DISTINCT ORDER_ID) num_orders
    FROM DEV_DB.DBT_MARIATZIMOPOULOUSONYCOM.STG_POSTGRES__ORDERS
    GROUP BY 1
)
GROUP BY 1 
ORDER BY 1 ;

```

ANSWER: 

| NUM_ORDERS	| NUM_USERS |
| :------------ |:---------------:|
| 1	| 25 |
| 2	| 28 | 
| 3	| 34 | 
| 4	| 20 |
| 5	| 10 |
| 6	| 2 |
| 7	| 4 |
| 8	| 1 |


## On average, how many unique sessions do we have per hour?

```
SELECT AVG(num_sessions) avg_hourly_sessions -- not taking into account hours without sessions 
FROM(
    SELECT DATE_TRUNC('hour',CREATED_AT) hour_of_event
        , COUNT(DISTINCT SESSION_ID) num_sessions
    FROM DEV_DB.DBT_MARIATZIMOPOULOUSONYCOM.STG_POSTGRES__EVENTS
    GROUP BY 1
);


```

ANSWER: 16.327586


### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
