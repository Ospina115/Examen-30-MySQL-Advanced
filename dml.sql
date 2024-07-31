INSERT INTO categorias (descripcion, estado) VALUES
    ('Electrónica', 1),
    ('Ropa', 1),
    ('Alimentos', 1),
    ('Hogar', 1),
    ('Deportes', 1);

INSERT INTO productos (nombre, id_categoria, codigo_barras, precio_venta, cantidad_stock, estado) VALUES
    ('TV LED 40"', 1, '1234567890123', 800000.00, 10, 1),
    ('Camisa polo', 2, '9876543210987', 20000.00, 50, 1),
    ('Arroz blanco', 3, '1111111111111', 5000.00, 100, 1),
    ('Silla de comedor', 4, '2222222222222', 50000.00, 20, 1),
    ('Balón de fútbol', 5, '3333333333333', 15000.00, 30, 1);

INSERT INTO clientes (nombre, apellidos, celular, direccion, correo_electronico) VALUES
    ('Juan', 'Pérez', 1234567890, 'Calle 123', 'juan.perez@gmail.com'),
    ('María', 'García', 9876543210, 'Avenida 456', 'maria.garcia@hotmail.com'),
    ('Carlos', 'Rodríguez', 5555555555, 'Calle 789', 'carlos.rodriguez@live.com');

INSERT INTO compras (id_cliente, fecha, medio_pago, comentario, estado) VALUES
    (1, '2022-01-01', 'E', 'Compra en efectivo', 'A'),
    (2, '2022-01-15', 'T', 'Compra con tarjeta', 'A'),
    (3, '2022-02-01', 'E', 'Compra en efectivo', 'A');

INSERT INTO compras_productos (id_compra, id_producto, cantidad, total, estado) VALUES
    (1, 1, 2, 1600000.00, 1),
    (1, 2, 3, 60000.00, 1),
    (2, 3, 1, 5000.00, 1),
    (2, 4, 2, 100000.00, 1),
    (3, 5, 1, 15000.00, 1);