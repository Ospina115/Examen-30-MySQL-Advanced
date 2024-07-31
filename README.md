# PROYECTO EXAMEN MySQL

Joseph Samuel Ospina

![](imagedatabse.png)

## Consultas Básicas

Consultar todos los productos y sus categorías

```sql
SELECT id_producto, nombre, id_categoria, precio_venta, cantidad_stock, estado
FROM productos;
```

Consultar todas las compras y los clientes que las realizaron

```sql
SELECT id_compra, fecha, id_cliente, comentario
FROM compras;
```

Consultar los productos comprados en una compra específica

```sql
SELECT id_compra, id_producto, cantidad, total, estado
FROM compras_productos
WHERE id_compra = 1;
```

Agregar un nuevo producto

```sql
INSERT INTO productos (nombre, id_categoria, codigo_barras, precio_venta, cantidad_stock, estado) VALUES
('Tablet Galaxy A10', 1,'8963487224684', '400000.00', 20, 1);
```

Actualizar el stock de un producto

```sql
UPDATE productos
SET cantidad_stock = 13
WHERE id_producto = 6;
```

Consultar todas las compras de un cliente específico

```sql
SELECT id_compra, fecha, medio_pago, comentario, estado
FROM compras
WHERE id_cliente = 1;
```

Consultar todos los clientes y sus correos electrónicos

```sql
SELECT id_cliente, nombre, apellidos, correo_electronico
FROM clientes;
```

Consultar la cantidad total de productos comprados en cada compra

```sql
SELECT id_compra, id_producto, cantidad
FROM compras_productos;
```

Consultar las compras realizadas en un rango de fechas

```sql
SELECT id_compra, fecha, id_cliente, comentario
FROM compras
WHERE fecha BETWEEN '2022-01-01' AND '2022-01-31';
```





## Consultas usando funciones agregadas

Contar la cantidad de productos por categoría

```sql
SELECT id_categoria, COUNT(id_producto) AS "Cantidad de Productos"
FROM productos
GROUP BY id_categoria;
```

Calcular el precio total de ventas por cada cliente

```sql
SELECT c.id_cliente, c.nombre, c.apellidos, SUM(cp.total) AS total_ventas
FROM clientes c
JOIN compras co ON c.id_cliente = co.id_cliente
JOIN compras_productos cp ON co.id_compra = cp.id_compra
GROUP BY c.id_cliente, c.nombre, c.apellidos
ORDER BY total_ventas DESC;
```

Calcular el precio promedio de los productos por categoría

```sql
SELECT id_categoria, AVG(cantidad_stock)
FROM productos
GROUP BY id_categoria
```

Encontrar la fecha de la primera y última compra registrada

```sql
SELECT MIN(fecha) AS primera_compra, MAX(fecha) AS ultima_compra
FROM compras;
```

Calcular el total de ingresos por ventas

```sql
SELECT SUM(total) AS total_ingresos
FROM compras_productos
WHERE estado = 1;
```

Contar la cantidad de compras realizadas por cada medio de pago

```sql
SELECT medio_pago AS medio_de_pago, COUNT(*) AS cantidad_compras
FROM compras
GROUP BY medio_pago;
```

Calcular el total de productos vendidos por cada producto

```sql
SELECT p.nombre AS producto, SUM(cp.cantidad) AS total_vendido
FROM compras_productos cp
JOIN productos p ON cp.id_producto = p.id_producto
WHERE cp.estado = 1
GROUP BY p.nombre;
```

Obtener el promedio de cantidad de productos comprados por compra

```sql
SELECT AVG(cantidad) AS promedio_cantidad
FROM compras_productos
WHERE estado = 1;
```

Encontrar los productos con el stock más bajo

```sql
SELECT id_producto, cantidad_stock
FROM productos
WHERE estado = 1
ORDER BY cantidad_stock ASC
LIMIT 10;
```

Calcular el total de productos comprados y el total gastado por cliente.

```sql
SELECT c.id_cliente,c.nombre,c.apellidos,SUM(cp.cantidad) AS productos_comprados,SUM(cp.total) AS total_gastado
FROM clientes c
JOIN compras co ON c.id_cliente = co.id_cliente
JOIN compras_productos cp ON co.id_compra = cp.id_compra
WHERE cp.estado = 1
GROUP BY c.id_cliente, c.nombre, c.apellidos;
```





## Consultas usando join

Consultar todos los productos con sus categorías 

```sql
SELECT p.id_producto AS "id del producto", p.nombre AS "nombre del producto", p.codigo_barras, p.precio_venta, p.cantidad_stock, p.estado, c.id_categoria AS "id categoria", c.descripcion AS "nombre categoria", c.estado
FROM productos AS p
JOIN categorias AS c ON p.id_categoria = c.id_categoria;
```

Consultar todas las compras y los clientes que las realizaron

```sql
SELECT c.id_compra, c.fecha, c.medio_pago, c.comentario, c.estado, cl.id_cliente, cl.nombre, cl.apellidos, cl.celular, cl.direccion, cl.correo_electronico
FROM compras c
INNER JOIN clientes cl ON c.id_cliente = cl.id_cliente;
```

Consultar los productos comprados en cada compra

```sql
SELECT c.id_compra, c.fecha, p.nombre AS producto, cp.cantidad, cp.total
FROM compras c
INNER JOIN compras_productos cp ON c.id_compra = cp.id_compra
INNER JOIN productos p ON cp.id_producto = p.id_producto
ORDER BY c.id_compra;
```

Consultar las compras realizadas por un cliente específico

```sql
SELECT cl.nombre AS cliente, cl.apellidos, c.id_compra, c.fecha, p.nombre AS producto, cp.cantidad, cp.total
FROM clientes cl
INNER JOIN compras c ON cl.id_cliente = c.id_cliente
INNER JOIN compras_productos cp ON c.id_compra = cp.id_compra
INNER JOIN productos p ON cp.id_producto = p.id_producto
WHERE cl.id_cliente = 1;
```

Consultar el total gastado por cada cliente

```sql
SELECT cl.id_cliente, cl.nombre, cl.apellidos, SUM(cp.total) AS total_gastado
FROM clientes cl
INNER JOIN compras c ON cl.id_cliente = c.id_cliente
INNER JOIN compras_productos cp ON c.id_compra = cp.id_compra
GROUP BY cl.id_cliente, cl.nombre, cl.apellidos
ORDER BY total_gastado DESC;
```

Consultar el stock disponible de productos y su categoría

```sql
SELECT p.id_producto, p.nombre AS producto, c.descripcion AS categoria, p.cantidad_stock AS stock_disponible
FROM productos p
INNER JOIN categorias c ON p.id_categoria = c.id_categoria
WHERE p.estado = 1
ORDER BY c.descripcion, p.nombre;
```

Consultar los detalles de compras junto con la información del cliente y el producto

```sql
SELECT c.id_compra, c.fecha, c.medio_pago, c.comentario, c.estado, cl.id_cliente, cl.nombre AS cliente_nombre, cl.apellidos AS cliente_apellidos, cl.celular AS cliente_celular, cl.direccion AS cliente_direccion, cl.correo_electronico AS cliente_correo, p.id_producto, p.nombre AS producto_nombre, p.codigo_barras AS producto_codigo_barras, p.precio_venta AS producto_precio_venta, cp.cantidad AS cantidad_comprada, cp.total AS total_comprado
FROM compras c
INNER JOIN clientes cl ON c.id_cliente = cl.id_cliente
INNER JOIN compras_productos cp ON c.id_compra = cp.id_compra
INNER JOIN productos p ON cp.id_producto = p.id_producto
ORDER BY c.id_compra, cp.id_producto;
```

Consultar los productos que han sido comprados por más de una cantidad específica

```sql
SELECT p.id_producto, p.nombre AS producto, SUM(cp.cantidad) AS cantidad_comprada
FROM productos p
INNER JOIN compras_productos cp ON p.id_producto = cp.id_producto
GROUP BY p.id_producto, p.nombre
HAVING SUM(cp.cantidad) > 1;
```

Consultar la cantidad total de productos vendidos por categoría

```sql
SELECT c.descripcion AS categoria, SUM(cp.cantidad) AS cantidad_vendida
FROM categorias c
INNER JOIN productos p ON c.id_categoria = p.id_categoria
INNER JOIN compras_productos cp ON p.id_producto = cp.id_producto
GROUP BY c.descripcion
ORDER BY cantidad_vendida DESC;
```

Consultar los clientes que han realizado compras en un rango de fechas específico

```sql
SELECT c.id_cliente, c.nombre, c.apellidos, SUM(cp.total) AS total_compras
FROM clientes c
INNER JOIN compras co ON c.id_cliente = co.id_cliente
INNER JOIN compras_productos cp ON co.id_compra = cp.id_compra
WHERE co.fecha BETWEEN '2022-01-01' AND '2022-01-31'
GROUP BY c.id_cliente, c.nombre, c.apellidos
ORDER BY total_compras DESC;
```

Consultar el total gastado por cada cliente junto con la cantidad total de productos
comprados

```sql
SELECT c.id_cliente, c.nombre, c.apellidos, SUM(cp.total) AS total_gastado, SUM(cp.cantidad) AS cantidad_productos
FROM clientes c
INNER JOIN compras co ON c.id_cliente = co.id_cliente
INNER JOIN compras_productos cp ON co.id_compra = cp.id_compra
GROUP BY c.id_cliente, c.nombre, c.apellidos
ORDER BY total_gastado DESC;
```

Consultar los productos que nunca han sido comprados

```sql
SELECT p.id_producto,p.nombre,p.codigo_barras,p.precio_venta,p.cantidad_stock
FROM productos p
LEFT JOIN compras_productos cp ON p.id_producto = cp.id_producto
WHERE cp.id_producto IS NULL;
```

Consultar los clientes que han realizado más de una compra y el total gastado por ellos

```sql

```

Consultar los productos más vendidos por categoría

```sql
SELECT c.descripcion AS categoria, p.nombre AS producto, SUM(cp.cantidad) AS cantidad_vendida
FROM compras_productos cp
INNER JOIN productos p ON cp.id_producto = p.id
INNER JOIN categorias c ON p.id_categoria = c.id
GROUP BY c.descripcion, p.nombre
ORDER BY c.descripcion, cantidad_vendida DESC;
```

Consultar las compras realizadas por clientes de una ciudad específica y el total gastado

```sql

```

Consultar los proveedores que han suministrado productos y la cantidad total suministrada

```sql

```





## Subconsultas

Consultar los productos que tienen un precio de venta superior al precio promedio de todos
los productos

```sql
SELECT id_producto, nombre, id_categoria, codigo_barras, precio_venta, cantidad_stock, estado
FROM productos
WHERE precio_venta > (SELECT AVG(precio_venta)FROM productos);
```

Consultar los clientes que han gastado más del promedio general en sus compras

```sql

```

Consultar las categorías que tienen más de 5 productos

```sql
SELECT id_categoria, descripcion, estado
FROM categorias
WHERE id_categoria IN (
  SELECT id_categoria
  FROM productos
  GROUP BY id_categoria
  HAVING COUNT(id_producto) > 5
);
```

Consultar los productos más vendidos (top 5) por categoría

```sql
SELECT c.descripcion AS categoria, p.nombre AS producto, (SELECT SUM(cp.cantidad) FROM compras_productos cp WHERE cp.id_producto = p.id_producto) AS cantidad_vendida
FROM productos p
INNER JOIN categorias c ON p.id_categoria = c.id_categoria
ORDER BY c.descripcion, cantidad_vendida DESC
LIMIT 5;
```

Consultar los clientes que han realizado compras en los últimos 30 días

```sql
SELECT id_cliente, nombre, apellidos, celular, direccion, correo_electronico
FROM clientes
WHERE id_cliente IN (
  SELECT id_cliente
  FROM compras
  WHERE fecha >= DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY)
);
```

Consultar las compras y sus productos para un cliente específico, mostrando solo las
compras más recientes

```sql
SELECT c.id_compra, c.fecha, cp.id_producto, p.nombre, cp.cantidad, cp.total
FROM compras c
INNER JOIN compras_productos cp ON c.id_compra = cp.id_compra
INNER JOIN productos p ON cp.id_producto = p.id_producto
WHERE c.id_cliente = 1
AND c.fecha IN (
  SELECT MAX(fecha)
  FROM compras
  WHERE id_cliente = 1
);
```

Consultar las categorías que tienen productos con un stock por debajo del promedio general

```sql
SELECT c.id_categoria, c.descripcion
FROM categorias c
WHERE c.id_categoria IN (
  SELECT p.id_categoria
  FROM productos p
  WHERE p.cantidad_stock < (
    SELECT AVG(cantidad_stock)
    FROM productos
  )
);
```

Consultar los productos que han sido comprados por todos los clientes

```sql
SELECT p.id_producto, p.nombre
FROM productos p
WHERE p.id_producto IN (
  SELECT cp.id_producto
  FROM compras_productos cp
  GROUP BY cp.id_producto
  HAVING COUNT(DISTINCT cp.id_compra) = (
    SELECT COUNT(*)
    FROM clientes
  )
);
```

Consultar las compras que tienen más productos que el promedio de productos por compra

```sql
SELECT c.id_compra, c.fecha, c.id_cliente, COUNT(cp.id_producto) AS cantidad_productos
FROM compras c
JOIN compras_productos cp ON c.id_compra = cp.id_compra
GROUP BY c.id_compra, c.fecha, c.id_cliente
HAVING COUNT(cp.id_producto) > (
  SELECT AVG(cantidad_productos)
  FROM (
    SELECT id_compra, COUNT(id_producto) AS cantidad_productos
    FROM compras_productos
    GROUP BY id_compra
  ) AS subconsulta
);
```

Consultar los productos que se han vendido menos de la cantidad promedio de productos
vendidos

```sql
SELECT p.id_producto, p.nombre, SUM(cp.cantidad) AS cantidad_vendida
FROM productos p
JOIN compras_productos cp ON p.id_producto = cp.id_producto
GROUP BY p.id_producto, p.nombre
HAVING SUM(cp.cantidad) < (
  SELECT AVG(cantidad_vendida)
  FROM (
    SELECT id_producto, SUM(cantidad) AS cantidad_vendida
    FROM compras_productos
    GROUP BY id_producto
  ) AS subconsulta
);
```

