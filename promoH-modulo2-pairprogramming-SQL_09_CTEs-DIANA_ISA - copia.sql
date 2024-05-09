/* 1. Extraer en una CTE todos los nombres de las compañias y los id de los clientes.
Para empezar nos han mandado hacer una CTE muy sencilla el id del cliente y el nombre de la compañia de la tabla Customers. */
WITH datos_clientes AS
	(SELECT customer_id, company_name
    FROM customers)
SELECT customer_id, company_name
FROM datos_clientes;

/* 2. Selecciona solo los de que vengan de "Germany".
Ampliemos un poco la query anterior. 
En este caso, queremos un resultado similar al anterior, pero solo queremos los que pertezcan a "Germany". */
WITH datos_clientes AS
	(SELECT customer_id, company_name
    FROM customers
    WHERE country = "Germany")
SELECT customer_id, company_name
FROM datos_clientes;

/* 3. Extraed el id de las facturas y su fecha de cada cliente.
En este caso queremos extraer todas las facturas que se han emitido a un cliente, su fecha la compañia a la que pertenece.
📌 NOTA En este caso tendremos columnas con elementos repetidos(CustomerID, y Company Name). */
WITH facturas AS
	(SELECT customers.customer_id, customers.company_name, orders.order_id, orders.order_date
	FROM customers
	INNER JOIN orders
	ON customers.customer_id = orders.customer_id)
SELECT *
FROM facturas;

/* 4. Contad el número de facturas por cliente
Mejoremos la query anterior. 
En este caso queremos saber el número de facturas emitidas por cada cliente. */
WITH facturas AS
	(SELECT customer_id, company_name
	FROM customers)
SELECT facturas.customer_id, facturas.company_name, COUNT(orders.order_id) AS numero_facturas
FROM orders
INNER JOIN facturas
ON facturas.customer_id = orders.customer_id
GROUP BY orders.customer_id;
-- El GROUP BY nos da el mismo resultado ya sea agrupándolo desde facturas.customer_id o desde orders.customer_id.

/* 5. Cuál la cantidad media pedida de todos los productos ProductID.
Necesitaréis extraer la suma de las cantidades por cada producto y calcular la media. */
WITH cantidad_productos AS
	(SELECT product_id, SUM(quantity) AS cantidad_total
	FROM order_details
    GROUP BY product_id)
SELECT AVG(cantidad_total) AS media
FROM cantidad_productos;


SELECT product_id, SUM(quantity) AS cantidad_total
FROM 
	(SELECT AVG(cantidad_total) AS media
	FROM order_details) 
AS o;

-- BONUS: Estos ejercicios no es obligatorio realizarlos. 
-- Los podéis hacer más adelante para poder practicar las CTE´s.

/* 6. Usando una CTE, extraer el nombre de las diferentes categorías de productos, con su precio medio, máximo y mínimo. */

/* 7. La empresa nos ha pedido que busquemos el nombre de cliente, su teléfono y el número de pedidos que ha hecho cada uno de ellos. */

/* 8. Modifica la consulta anterior para obtener los mismos resultados pero con los pedidos por año que ha hecho cada cliente. */

/* 9. Modifica la cte del ejercicio anterior, úsala en una subconsulta para saber el nombre del cliente y su teléfono, para aquellos clientes que hayan hecho más de 6 pedidos en el año 1998. */

/* 10. Nos piden que obtengamos el importe total (teniendo en cuenta los descuentos) de cada pedido de la tabla orders y el customer_id asociado a cada pedido. */