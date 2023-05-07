
### Week 4 questions

## Part 1. dbt Snapshots

# Which products had their inventory change from week 3 to week 4?

Bamboo , Philodendron, String of pearls, Pothos, ZZ Plant, Monstera

# Now that we have 3 weeks of snapshot data, can you use the inventory changes to determine which products had the most fluctuations in inventory? 

Most fluctuations: Philodendron, Pothos, Monstera, String of pearls

# Did we have any items go out of stock in the last 3 weeks?

Pothos and String of pearls

## Part 2. Modeling challenge

# How are our users moving through the product funnel?

I prepared the fact_total_product_funnel and fact_daily_product_funnel tables to check how users are moving through the product funnel 

fact_total_product_funnel: 

|TOTAL_SESSIONS|TOTAL_SESSIONS_WITH_PAGE_VIEWS|TOTAL_SESSIONS_WITH_ADD_TO_CARTS|TOTAL_SESSIONS_WITH_CHECKOUTS|TOTAL_PAGE_VIEWS_RATE|TOTAL_ADD_TO_CARTS_RATE|TOTAL_CONVERSION_RATE|TOTAL_VIEWS_TO_CART_RATE|TOTAL_CART_TO_CHECKOUT_RATE|
|:----|:----|:----|:----|:----|:----|:----|:----|:----|
|578|578|467|361|100|80.7958|62.4567|80.7958|77.3019|

fact_daily_product_funnel: 

|DATE_OF_SESSION|DAILY_SESSIONS|DAILY_SESSIONS_WITH_PAGE_VIEWS|DAILY_SESSIONS_WITH_ADD_TO_CARTS|DAILY_SESSIONS_WITH_CHECKOUTS|DAILY_PAGE_VIEWS_RATE|DAILY_ADD_TO_CARTS_RATE|DAILY_CONVERSION_RATE|DAILY_VIEWS_TO_CART_RATE|DAILY_CART_TO_CHECKOUT_RATE|
|:----|:----|:----|:----|:----|:----|:----|:----|:----|:----|
|2021-02-11|401|401|290|184|100|72.3192|45.8853|72.3192|63.4483|
|2021-02-10|175|175|175|175|100|100|100|100|100|
|2021-02-09|2|2|2|2|100|100|100|100|100|

### Part 3: Reflection questions -- please answer 3A or 3B, or both!

# 3A if your organization is thinking about using dbt, how would you pitch the value of dbt/analytics engineering to a decision maker at your organization?

Overall, dbt can provide significant value to your organization by improving data quality, standardization, collaboration, and agility while reducing the time it takes to deliver insights to stakeholders.

The biggest seeling point would be that dbt provides a standardized way of defining, testing, and documenting data transformations. This ensures consistency in the way data is transformed and makes it easier for everyone in the organization to understand and trust the data.