--Total sales revenue

SELECT ROUND(SUM(od.quantity * p.price), 2) AS total_revenue
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id;

-- Top selling pizzas

SELECT pizza_id, COUNT(*) AS total_orders
FROM order_details
GROUP BY pizza_id
ORDER BY total_orders DESC;

-- Sales by pizza size

SELECT pizzas.size, SUM(order_details.quantity) AS total 
FROM order_details LEFT JOIN pizzas 
ON pizzas.pizza_id = order_details.pizza_id GROUP BY pizzas.size;

-- monthly sales

SELECT 
    DATE_FORMAT(o.date, '%Y-%m') AS month,
    SUM(od.quantity) AS total_sales
FROM 
    order_details od
JOIN 
    orders o ON od.order_id = o.order_id
JOIN 
    pizzas p ON od.pizza_id = p.pizza_id
GROUP BY 
    month
ORDER BY 
    month;

-- Sales by category

SELECT 
	pizza_types.category AS category,
    SUM(order_details.quantity) AS total_sales
FROM 
    order_details 
JOIN 
    pizzas  ON order_details.pizza_id = pizzas.pizza_id
JOIN 
    pizza_types  ON pizza_types.pizza_type_id = pizzas.pizza_type_id
GROUP BY 
    category
ORDER BY 
    category;