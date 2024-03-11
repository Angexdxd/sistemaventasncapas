CREATE DATABASE TIENDA_BD

GO




 CREATE TABLE PERSONAS(
 IDPERSONA INT IDENTITY (1,1) NOT NULL,
 NOMBRES NVARCHAR(25) NOT NULL,
 APELLIDOS NVARCHAR(25) NULL,
 TELEFONO VARCHAR(15) NOT NULL,
 CI VARCHAR(15) NOT NULL,
 CORREO NVARCHAR(25) NOT NULL,
 ESTADO NVARCHAR(25) NOT NULL,
 PRIMARY KEY(IDPERSONA));
 GO

 CREATE TABLE CLIENTE(
 IDCLIENTE INT IDENTITY (1,1) NOT NULL,
 IDPERSONA INT NOT NULL,
 TIPOCLIENTE NVARCHAR(25) NOT NULL,
 CODIGOCLIE NVARCHAR(25) NOT NULL,
 ESTADO NVARCHAR(25) NOT NULL,
 PRIMARY KEY(IDCLIENTE),
 FOREIGN KEY (IDPERSONA) REFERENCES PERSONAS(IDPERSONA));
 GO

 CREATE TABLE USUARIO(
 IDUSUARIO INT IDENTITY (1,1) NOT NULL,
 IDPERSONA INT NOT NULL,
 NOMBREUSER NVARCHAR(25) NOT NULL,
 CONTRASEŅA NVARCHAR(25) NOT NULL,
 FECHAREG DATE NOT NULL,
 PRIMARY KEY(IDUSUARIO),
 FOREIGN KEY (IDPERSONA) REFERENCES PERSONAS(IDPERSONA));
 GO

 CREATE TABLE ROL(
 IDROL INT IDENTITY (1,1) NOT NULL,
 NOMBRE NVARCHAR(25) NOT NULL,
 ESTADO NVARCHAR(25) NOT NULL,
 PRIMARY KEY(IDROL));
 GO

 CREATE TABLE USUARIOROL(
 IDUSUARIOROL INT IDENTITY (1,1) NOT NULL,
 IDUSUARIO INT NOT NULL,
 IDROL INT NOT NULL,
 FECHAASIGNA DATE NOT NULL,
 ESTADO NVARCHAR(25) NOT NULL,
 PRIMARY KEY(IDUSUARIOROL),
 FOREIGN KEY (IDUSUARIO) REFERENCES USUARIO(IDUSUARIO),
 FOREIGN KEY (IDROL) REFERENCES ROL(IDROL));
 GO

 CREATE TABLE VENTA(
 IDVENTA INT IDENTITY (1,1) NOT NULL,
 IDCLIENTE INT NOT NULL ,
 IDVENDEDOR INT NULL ,
 FECHA DATE NOT NULL,
 TOTAL NVARCHAR(15) NOT NULL,
 ESTADO NVARCHAR(25) NOT NULL,
 PRIMARY KEY (IDVENTA),
 FOREIGN KEY (IDCLIENTE) REFERENCES CLIENTE(IDCLIENTE),
 FOREIGN KEY (IDVENDEDOR) REFERENCES USUARIO(IDUSUARIO));
 GO


 CREATE TABLE TIPOPROD(
 IDTIPOPROD INT IDENTITY PRIMARY KEY,
 NOMBRE NVARCHAR(15) NOT NULL,
 ESTADO NVARCHAR(25) NOT NULL);
 GO

 CREATE TABLE MARCA(
 IDMARCA INT IDENTITY PRIMARY KEY,
 NOMBRE VARCHAR(15) NOT NULL,
 ESTADO VARCHAR(25) NOT NULL);
 GO

 CREATE TABLE PRODUCTO(
 IDPRODUCTO INT IDENTITY PRIMARY KEY,
 IDTIPOPRODUCTO INT NOT NULL REFERENCES TIPOPROD(IDTIPOPROD),
 NOMBRE NVARCHAR(15) NOT NULL,
 CODIGOBARRA VARCHAR(15) NOT NULL,
 IDMARCA INT NOT NULL REFERENCES MARCA(IDMARCA),
 CANTIDAD INT NOT NULL,
 UNIDAD INT NOT NULL,
 DESCRIPCION NVARCHAR(150) NOT NULL,
 ESTADO NVARCHAR(25) NOT NULL);
 GO

 CREATE TABLE DETALLEVENT(
 IDDETALLEEVENT INT IDENTITY PRIMARY KEY,
 IDVENTA INT NOT NULL REFERENCES VENTA(IDVENTA),
 IDPRODUCTO INT NULL REFERENCES PRODUCTO(IDPRODUCTO),
 CANTIDAD INT NOT NULL,
 PRECIOVENTA NVARCHAR(15) NOT NULL,
 SUBTOTAL NVARCHAR(15) NOT NULL,
 ESTADO NVARCHAR(25) NOT NULL);
 GO
 
 CREATE TABLE PROVEEDOR(
 IDPROVEEDOR INT IDENTITY PRIMARY KEY,
 NOMBRE NVARCHAR(25) NOT NULL,
 TELEFONO NVARCHAR(15) NOT NULL,
 DIRECCION NVARCHAR(25) NOT NULL,
 ESTADO NVARCHAR(25) NOT NULL);
 GO

 CREATE TABLE INGRESO(
 IDINGRESO INT IDENTITY PRIMARY KEY,
 IDPROVEEDOR INT NOT NULL REFERENCES PROVEEDOR(IDPROVEEDOR),
 FECHAINGRESO DATE NOT NULL,
 TOTAL NVARCHAR(15) NOT NULL,
 ESTADO VARCHAR(25) NOT NULL);
 GO

 CREATE TABLE PROVEE(
 IDPROVEE INT IDENTITY PRIMARY KEY,
 IDPRODUCTO INT NOT NULL REFERENCES PRODUCTO(IDPRODUCTO),
 IDPROVEEDOR INT NOT NULL REFERENCES PROVEEDOR(IDPROVEEDOR),
 FECHA DATE NOT NULL,
 PRECIO NVARCHAR(15) NOT NULL);
 GO


 CREATE TABLE DETALLEING(
 IDDETALLEEVENT INT IDENTITY PRIMARY KEY,
 IDPRODUCTO INT NULL REFERENCES PRODUCTO(IDPRODUCTO),
 IDINGRESO INT NOT NULL REFERENCES INGRESO(IDINGRESO),
 FECHAVENC DATE NOT NULL,
 CANTIDAD INT NOT NULL,
 PRECIOCOSTO VARCHAR(15) NOT NULL,
 PRECIOVENTA NVARCHAR(15) NOT NULL,
 SUBTOTAL NVARCHAR(15) NOT NULL,
 ESTADO NVARCHAR(25) NOT NULL);
 GO



