USE northwind_2024_2; -- Diana northwind-2

/* 1. Extraed los pedidos con el máximo "order_date" para cada empleado.
Nuestro jefe quiere saber la fecha de los pedidos más recientes que ha gestionado cada empleado. 
Para eso nos pide que lo hagamos con una query correlacionada. */
SELECT order_id AS OrderID, customer_id AS CustomerID, employee_id AS EmployeeID, order_date AS OrderDate, required_date AS RequiredDate
FROM orders
GROUP BY order_id
HAVING MAX(order_date);

SELECT order_id AS OrderID, customer_id AS CustomerID, employee_id AS EmployeeID, order_date AS OrderDate, required_date AS RequiredDate
FROM orders
WHERE order_id DATE(1998-05-05);

SELECT order_id AS OrderID, customer_id AS CustomerID, employee_id AS EmployeeID, order_date AS OrderDate, required_date AS RequiredDate
FROM orders
	(SELECT employee_id
	FROM employees
    WHERE orders.employee_id = employees.employee_id);


SELECT MAX(order_date)
FROM employees;


employee_number
customer_number
sales_rep_employee_number

/* 2. Extraed el precio unitario máximo (unit_price) de cada producto vendido.
Supongamos que ahora nuestro jefe quiere un informe de los productos vendidos y su precio unitario. 
De nuevo lo tendréis que hacer con queries correlacionadas. */

/* 3. Extraed información de los productos "Beverages"
En este caso nuestro jefe nos pide que le devolvamos toda la información necesaria para identificar un tipo de producto. 
En concreto, tienen especial interés por los productos con categoría "Beverages". 
Devuelve el ID del producto, el nombre del producto y su ID de categoría. */

/* 4. Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país.
Suponemos que si se trata de ofrecer un mejor tiempo de entrega a los clientes, entonces podría dirigirse a estos países para buscar proveedores adicionales. */

/* 5. Extraer los clientes que compraron mas de 20 articulos "Grandma's Boysenberry Spread".
Extraed el OrderId y el nombre del cliente que pidieron más de 20 artículos del producto "Grandma's Boysenberry Spread" (ProductID 6) en un solo pedido. */

/* 6. Extraed los 10 productos más caros.
Nos siguen pidiendo más queries correlacionadas. 
En este caso queremos saber cuáles son los 10 productos más caros. */

/* BONUS:
7. Qué producto es más popular.
Extraed cuál es el producto que más ha sido comprado y la cantidad que se compró. */