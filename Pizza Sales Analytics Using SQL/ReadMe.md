# Slice Delight Pizzeria Sales Analysis
## Overview
Slice Delight Pizzeria, established in 2010, has become a beloved staple in the heart of downtown Springfield. Renowned for its authentic Italian recipes and commitment to quality, Slice Delight offers a wide variety of pizzas that cater to both traditional tastes and contemporary preferences. However, in recent years, Slice Delight has faced challenges in maintaining steady sales revenue. Despite a loyal customer base, fluctuations in sales patterns and increasing competition from new eateries in the area have impacted their financial performance. In response to these challenges, the pizzeria's management decided to hire a data analyst to gain deeper insights into their sales data. The objective was to answer critical questions about menu item popularity, pizza size popularity, peak business hour, revenue over time, ultimately aiming to develop strategies to boost revenue and streamline operations.

![](https://cdn.dribbble.com/userupload/11076074/file/original-e2d24af777a1779a4428d99f2b18e509.png)

## Data
### Order_details
+ order_details_id - Serial Number for this table
+ Order_id 
+ Pizza_id
+ Quantity

### Orders
+ Order_id
+ Order_date
+ Order_time

### pizza_types
+ pizza_type_id
+ Name
+ Category
+ Ingredients

### Pizzas
+ pizza_id
+ Pizza_type_id
+ size
+ Price

## Questions 
+ Calculate the total revenue generated from pizza sales
  + USD 817860 $
+ Identify the highest-priced pizza.
  + The Italian Vegetables Pizza - 21
+ Identify the most common pizza size ordered.
  + L	18526
  + M	15385
  + S	14137
  + XL	544
  + XXL	28
+ List the top 5 most ordered pizza types along with their quantities.
  + The Classic Deluxe Pizza	2453
  + The Barbecue Chicken Pizza	2432
  + The Hawaiian Pizza	2422
  + The Pepperoni Pizza	2418
  + The Thai Chicken Pizza	2371
+ Join the necessary tables to find the total quantity of each pizza category ordered
  + Classic	14888
  + Supreme	11987
  + Veggie	11649
  + Chicken	11050
+ Determine the distribution of orders by hour of the day - Refer SQl File
+ Join relevant tables to find the category-wise distribution of pizzas.
  + Supreme	9
  + Veggie	9
  + Classic	8
  + Chicken	6
+ Group the orders by date and calculate the average number of pizzas ordered per day.
  + 138
+ Determine the top 3 most ordered pizza types based on revenue.
  + The Thai Chicken Pizza	43434.25
  + The Barbecue Chicken Pizza	42768
  + The California Chicken Pizza	41409.5
+ Calculate the percentage contribution of each pizza type to total revenue - Refer SQL file
+ Analyze the cumulative revenue generated over time - Refer SQL file
+ Determine the top 3 most ordered pizza types based on revenue for each pizza category - Refer SQL file
