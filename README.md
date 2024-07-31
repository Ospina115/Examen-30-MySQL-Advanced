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

```

Consultar todas las compras y los clientes que las realizaron

```sql

```

Consultar los productos comprados en cada compra

```sql

```

Consultar las compras realizadas por un cliente específico

```sql

```

Consultar el total gastado por cada cliente

```sql

```

Consultar el stock disponible de productos y su categoría

```sql

```

Consultar los detalles de compras junto con la información del cliente y el producto

```sql

```

Consultar los productos que han sido comprados por más de una cantidad específica

```sql

```

Consultar la cantidad total de productos vendidos por categoría

```sql

```

Consultar los clientes que han realizado compras en un rango de fechas específico

```sql

```

Consultar el total gastado por cada cliente junto con la cantidad total de productos
comprados

```sql

```

Consultar los productos que nunca han sido comprados

```sql

```

Consultar los clientes que han realizado más de una compra y el total gastado por ellos

```sql

```

Consultar los productos más vendidos por categoría

```sql

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

```

Consultar los clientes que han gastado más del promedio general en sus compras

```sql

```

Consultar las categorías que tienen más de 5 productos

```sql

```

Consultar los productos más vendidos (top 5) por categoría

```sql

```

Consultar los clientes que han realizado compras en los últimos 30 días

```sql

```

Consultar las compras y sus productos para un cliente específico, mostrando solo las
compras más recientes

```sql

```

Consultar las categorías que tienen productos con un stock por debajo del promedio general

```sql

```

Consultar los productos que han sido comprados por todos los clientes

```sql

```

Consultar las compras que tienen más productos que el promedio de productos por compra

```sql

```

Consultar los productos que se han vendido menos de la cantidad promedio de productos
vendidos

```sql

```

