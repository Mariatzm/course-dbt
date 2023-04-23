
### Week 2 questions

## What is our user repeat rate? Repeat Rate = Users who purchased 2 or more times / users who purchased

```
SELECT 
  DIV0(COUNT(DISTINCT CASE WHEN count_orders >1 THEN USER_ID else null end ), COUNT(DISTINCT USER_ID))*100 user_repeat_rate
FROM(
    SELECT USER_ID
     , COUNT(DISTINCT ORDER_ID) count_orders
    FROM DEV_DB.DBT_MARIATZIMOPOULOUSONYCOM.STG_POSTGRES__ORDERS
    GROUP BY 1
)
;

```

ANSWER: 79.8387 or 79.8% 


## What are good indicators of a user who will likely purchase again? What about indicators of users who are likely NOT to purchase again? If you had more data, what features would you want to look into to answer this question?

ANSWER: 

Some indicators of purchasing again :

- If they visit the site often 
- If they come back and browser specific products 
- If they have added items to their basket
- If they are engaging with emails they receive from the company
- If they have left positive reviews 

Some indicators of not purchasing again

- If they have churned. Meaning that they haven't made a purchase for a long time or they haven't engaged with the site 
- If they have left negative reviews or if they had reached out to customer service for issues with their past orders  

To answer the above questions (If I had more data) I would focus on : 

- The user's past experience with the service 
- The users engagement with the emails received and the site


## More stakeholders are coming to us for data, which is great! But we need to get some more models created before we can help. 

I created a marts folder with the following subfolders : 

- Core
- Marketing
- Product

## [REQUIRED] The product mart could contain a model like fact_page_views which contains all page view events from greenery’s events data

This was completed 

## Explain the product mart models you added.

- Created dim__users:
This model contains all info per user (including their address and a full name field)

- Created int__session_summary:
This model contains all info per session (including total number of PAGE_VIEWS, ADD_TO_CARTS, CHECKOUTS ,PACKAGE_SHIPPEDS, MAX_CHECKOUT_TIME, MAX_SHIPPED_TIME, FIRST_SESSION_EVENT_TIME, LAST_SESSION_EVENT_TIME, SESSION_DURATION_MINUTES

- Created int__events_info:
This model contains all info per event. I'm prejoining to the products and user staging models


- Created fact_page_views:
This model contains all info per page view event. I used the in__events_info model to create this one and I focused only on "page view" event types


## Tests 

I added a few standard tests: 
I added the "unique" test to make sure that columns that should only appear once in the models don't appear more times.
I added the "not null" test to make sure that columns that are not null don't have any null values. 
I created a generic test ( "is_greater_than_zero") and made sure we don't have any orders with 0 products ordered. 

## Snapshots

I run the dbt snapshot command and I noticed that some data have changed. For example the inventory for the "Pothos" product changed from 40 to 20. 

