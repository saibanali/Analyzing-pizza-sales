create database pizza;
use pizza;

select * from orders;
select * from order_details;
select * from pizzas;
select * from pizza_types;


/*1:Retrieve the total number of orders placed.*/

SELECT count(order_id) as total_no_of_orders from order_details;

/*2:Join relevant tables to find the category-wise distribution of pizzas.*/

select count(name), category from pizza_types group by category;

/*3:Calculate the total revenue generated from pizza sales.*/

select sum(pizzas. price * order_details. quantity )as total_revenue from pizzas join order_details on pizzas. pizza_id = order_details. pizza_id;


/*4:Identify the highest-priced pizza.*/

select max(price) , pizza_id from pizzas group by pizza_id order by max(price) desc limit 1;

/*5:Identify the most common pizza size ordered.*/

select count(order_details.quantity) as total_quantity, pizzas. size from pizzas join order_details on pizzas.pizza_id = order_details. pizza_id
group by pizzas.size order by total_quantity desc limit 1;


/*6:List the top 5 most ordered pizza types along with their quantities.*/

select count(order_details. quantity)as most_ordered, pizza_types.name  from  
pizza_types join pizzas on pizzas. pizza_type_id = pizza_types . pizza_type_id
join order_details on pizzas.pizza_id = order_details . pizza_id 
group by pizza_types.name order by  most_ordered desc limit 5;

/*7:Join the necessary tables to find the total quantity of each pizza category ordered.*/

select count(order_details.quantity) as total_quantity, pizza_types.category from  
pizza_types join pizzas on pizzas. pizza_type_id = pizza_types . pizza_type_id
join order_details on pizzas.pizza_id = order_details . pizza_id 
group by pizza_types.category
order by total_quantity desc;

/*8:Determine the distribution of orders by hour of the day.*/

select hour(orders. time), sum(order_details.quantity) from orders join order_details on orders. order_id = order_details. order_id 
group by hour(orders. time);  

/*9:Group the orders by date and calculate the average number of pizzas ordered per day.*/

select sum(order_details. quantity),avg(order_details. quantity) from orders join order_details on orders. order_id = order_details. order_id group by orders.date ;

/*10:Determine the top 3 most ordered pizza types based on revenue.*/

select sum(pizzas. price * order_details. quantity ) as total_revenue , pizza_types. name from 
pizzas join order_details on pizzas. pizza_id = order_details.pizza_id
join pizza_types on pizzas.pizza_type_id = pizza_types.pizza_type_id
group by pizza_types.name
order by total_revenue desc limit 3;