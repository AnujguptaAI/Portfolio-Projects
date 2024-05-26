-- Que:- Retrieve the total number of orders placed.
select count(distinct order_id) as total_orders from orders;



-- Calculate the total revenue generated from pizza sales 
SELECT 
    ROUND(SUM(order_details.quantity * pizzas.price),
            2) AS total_sales
FROM
    order_details
        JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id;



-- Identify the highest-priced pizza.
select pizza_types.name,
pizzas.price
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
where pizzas.size = 'L'
order by pizzas.price desc limit 1;



-- Identify the most common pizza size ordered.
select pizzas.size, count(pizzas.size)
from pizzas join order_details
on pizzas.pizza_id = order_details.pizza_id
group by pizzas.size
order by count(pizzas.size) desc;




 -- List the top 5 most ordered pizza types along with their quantities.
select pizza_types.name, sum(order_details.quantity) as quantity
from pizza_types join pizzas 
on pizzas.pizza_type_id = pizza_types.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.name
order by quantity desc limit 5;




-- Join the necessary tables to find the total quantity of each pizza category ordered
select pizza_types.category, sum(order_details.quantity) as quantity
from pizzas join pizza_types 
on pizzas.pizza_type_id = pizza_types.pizza_type_id
join order_details 
on pizzas.pizza_id = order_details.pizza_id
group by pizza_types.category
order by quantity desc;



-- Determine the distribution of orders by hour of the day.
select hour(order_time) as hours, count(order_id) as orders
from orders group by hours;




-- Join relevant tables to find the category-wise distribution of pizzas.
select pizza_types.category as category, count(pizza_types.name) as names 
from pizza_types
group by category
order by names desc;



-- Group the orders by date and calculate the average number of pizzas ordered per day.
select round(avg(no_pizza), 0) as avg_pizza_order_per_day from 
(select date(orders.order_date) as date, sum(order_details.quantity) as no_pizza
from orders join order_details
on orders.order_id = order_details.order_id
group by orders.ORDER_DATE) as pizza_quantity ;



-- Determine the top 3 most ordered pizza types based on revenue.
select pizza_types.name as pizza_name, sum(pizzas.price * order_details.quantity) as revenue
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.name
order by revenue desc limit 3;




-- Calculate the percentage contribution of each pizza type to total revenue.
select pizza_types.name as pizza_name, 
round((sum(pizzas.price * order_details.quantity)/(select round(sum(order_details.quantity * pizzas.price), 2) as total_sales from order_details 
join pizzas on pizzas.pizza_id = order_details.pizza_id)) *100, 2) as percent_cont
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.name  
order by percent_cont desc;




-- Analyze the cumulative revenue generated over time.
select order_date,
round(sum(revenue) over(order by order_date), 2) as cum_revenue
from
(select orders.ORDER_DATE, 
round(sum(order_details.quantity * pizzas.price), 2) as revenue
from order_details join pizzas
on order_details.pizza_id = pizzas.pizza_id
join orders on orders.ORDER_ID = order_details.order_id
group by orders.ORDER_DATE) as sales;



-- Determine the top 3 most ordered pizza types based on revenue for each pizza category
select category, name, rn, revenue from 
(select category, name, revenue,
rank() over(partition by category order by revenue) as rn from
(select pizza_types.category, pizza_types.name,
sum(order_details.quantity * pizzas.price) as revenue
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.category, pizza_types.name) as revenue_rank) as b
where rn <=3;