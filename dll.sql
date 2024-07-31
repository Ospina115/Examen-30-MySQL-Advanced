CREATE DATABASE proyectosamuel
USE proyectosamuel

CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(45) NOT NULL,
    estado TINYINT
);

CREATE TABLE productos (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    id_categoria INT NOT NULL,
    codigo_barras VARCHAR(150),
    precio_venta DECIMAL(16, 2) NOT NULL,
    cantidad_stock INT NOT NULL,
    estado TINYINT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(40) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    celular DECIMAL(10,0),
    direccion VARCHAR(50) NOT NULL,
    correo_electronico VARCHAR(70)
);

CREATE TABLE compras (
    id_compra INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    fecha DATE NOT NULL,
    medio_pago CHAR(1),
    comentario VARCHAR(300),
    estado CHAR(1),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE compras_productos (
    id_compra INT,
    id_producto INT,
    cantidad INT,
    total DECIMAL(16.2),
    estado TINYINT,
    Foreign Key (id_compra) REFERENCES compras(id_compra),
    Foreign Key (id_producto) REFERENCES productos(id_producto)
);