
### Week 3 questions

## What is our overall conversion rate?

ANSWER : 62.45 or 62.45% 
To answer the question I create the fact_total_conversion model 

## What is our conversion rate by product?


ANSWER: 

|PRODUCT_NAME|PRODUCT_CONVERSION_RATE|
|:----|:----|
|Pothos|34.4262|
|Angel Wings Begonia|39.3443|
|Snake Plant|39.726|
|Ponytail Palm|40|
|Peace Lily|40.9091|
|Alocasia Polly|41.1765|
|Boston Fern|41.2698|
|Pink Anthurium|41.8919|
|Birds Nest Fern|42.3077|
|Ficus|42.6471|
|Bird of Paradise|45|
|Orchid|45.3333|
|Money Tree|46.4286|
|Dragon Tree|46.7742|
|Spider Plant|47.4576|
|Pilea Peperomioides|47.4576|
|Jade Plant|47.8261|
|Philodendron|48.3871|
|Devil's Ivy|48.8889|
|Aloe Vera|49.2308|
|Majesty Palm|49.2537|
|Fiddle Leaf Fig|50|
|Calathea Makoyana|50.9434|
|Monstera|51.0204|
|Rubber Plant|51.8519|
|Bamboo|53.7313|
|ZZ Plant|53.9683|
|Cactus|54.5455|
|Arrow Head|55.5556|
|String of pearls|60.9375|


To answer the question I created the fact_product_conversion model 


## Why might certain products be converting at higher/lower rates than others? We don't actually have data to properly dig into this, but we can make some hypotheses.

ANSWER: 

Reasons why certain porducts are being converting at higher rates might be : 
- Price of the product 
- Type of the product (maybe plants that needs less care are converting at higher rates)
- Sale (where users can purchase certain products on sale)
- Negative reviews 

##  Create a macro to simplify part of a model(s)

Macro has been created (sum_per_event_type.sql) 
The macro was used in the int__session_summary.sql model 

## Add a post hook to your project to apply grants to the role “reporting”. 

Post hook has been added and I was able to find prood that it run in the query history.

## Install a package (i.e. dbt-utils, dbt-expectations) and apply one or more of the macros to your project

Packages have been installed and the dbt-utils one was used in the int__session_summary.sql model


## Snapshots

I run the dbt snapshot command and I noticed that Pothos, Bamboo, Philodendron, Monstera, String of pearls, ZZ Plant have been updated

