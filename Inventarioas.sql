
CREATE DATABASE Tienda_Inventario
GO
USE Tienda_Inventario
GO


--------------------------------------------------------------------
--------------------------------------------------------------------
--Usuarios

CREATE TABLE tbUsuarios(
	usu_Id					INT IDENTITY(1,1),
	usu_Usuario				NVARCHAR(100) NOT NULL UNIQUE,
	usu_Contrasenia			NVARCHAR(MAX) NOT NULL,
	emp_Id					INT not null,
	usu_UsuarioCreacion		INT not null,
	usu_FechaCreacion		DATETIME not null,
	usu_UsuarioModificacion INT ,
	usu_FechaModificacion	DATETIME,
	usu_Estado				BIT NOT NULL,
	CONSTRAINT PK_dbo_tbUsuarios_usu_Id PRIMARY KEY(usu_Id)
);

--------------------------------------------------------------------
--------------------------------------------------------------------
--Estado Civil
CREATE TABLE tbEstadosCiviles(
	estciv_Id					CHAR(1) NOT NULL,
	estciv_Nombre				NVARCHAR(200) not null,
	estciv_FechaCreacion		DATETIME not null,
	estciv_UsuarioCreacion		INT not null,
	estciv_FechaModificacion	DATETIME,
	estciv_UsuarioModificacion  INT,
	estciv_Estado				BIT not null, 
	CONSTRAINT PK_dbo_tbEstadosCiviles_estciv_Id PRIMARY KEY(estciv_Id),
	CONSTRAINT FK_dbo_tbEstadosCiviles_dbo_tbUsuarios_estciv_UsuarioCreacion_usu_Id FOREIGN KEY(estciv_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
	CONSTRAINT FK_dbo_tbEstadosCiviles_dbo_tbUsuarios_estciv_UsuarioModificacion_usu_Id FOREIGN KEY(estciv_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)
);

--------------------------------------------------------------------
--------------------------------------------------------------------
--Departamentos
CREATE TABLE tbDepartamentos(
	dep_Id					CHAR(2) NOT NULL,
	dep_Nombre				NVARCHAR(200) NOT NULL,
	dep_FechaCreacion		DATETIME not null,
	dep_UsuarioCreacion		INT not null,
	dep_FechaModificacion	DATETIME,
	dep_UsuarioModificacion INT,
	dep_Estado				BIT not null,
	CONSTRAINT PK_dbo_tbDepartamentos_dep_Id PRIMARY KEY(dep_Id),
	CONSTRAINT FK_dbo_tbDepartamentos_dbo_tbUsuarios_dep_UsuarioCreacion_usu_Id FOREIGN KEY(dep_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
	CONSTRAINT FK_dbo_tbDepartamentos_dbo_tbUsuarios_dep_UsuarioModificacion_usu_Id FOREIGN KEY(dep_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)
);


--------------------------------------------------------------------
--------------------------------------------------------------------
--Municipios

CREATE TABLE tbMunicipios(
	mun_Id					CHAR(4) NOT NULL,
	dep_Id					CHAR(2) NOT NULL,
	mun_Nombre				NVARCHAR(200) NOT NULL,
	mun_FechaCreacion		DATETIME not null,
	mun_UsuarioCreacion		INT not null,
	mun_FechaModificacion	DATETIME,
	mun_UsuarioModificacion INT,
	mun_Estado				BIT not null,
	CONSTRAINT PK_dbo_tbMunicipios_mun_Id PRIMARY KEY(mun_Id),
	CONSTRAINT FK_tbMunicipios_tbDepartamentos_dep_Id FOREIGN KEY(dep_Id) REFERENCES tbDepartamentos(dep_Id),
	CONSTRAINT FK_dbo_tbMunicipios_dbo_tbUsuarios_mun_UsuarioCreacion_usu_Id FOREIGN KEY(mun_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
	CONSTRAINT FK_dbo_tbMunicipios_dbo_tbUsuarios_mun_UsuarioModificacion_usu_Id FOREIGN KEY(mun_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)
);

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

--Categorias
CREATE TABLE tbCategoria(
cat_Id INT IDENTITY(1,1),
cat_Descripcion NVARCHAR (100) NOT NULL,
cat_FechaCreacion		DATETIME not null,
cat_UsuarioCreacion		INT not null,
cat_FechaModificacion	DATETIME,
cat_UsuarioModificacion INT,
cat_Estado				BIT not null,
CONSTRAINT PK_dbo_tbCategoria_cat_Id PRIMARY KEY(cat_Id),
	CONSTRAINT FK_dbo_tbCategoria_dbo_tbUsuarios_cat_UsuarioCreacion_usu_Id FOREIGN KEY(cat_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
	CONSTRAINT FK_dbo_tbCategoria_dbo_tbUsuarios_cat_UsuarioModificacion_usu_Id FOREIGN KEY(cat_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)
);

--INSERT INTO tbCategoria
--VALUES ('Juguetes'),
--       ('Lacteos'),
--	   ('Cosméticos'),
--	   ('Frutas y Verduras'),
--	   ('Carnes')


--------------------------------------------------------------------
--------------------------------------------------------------------
--Cargos
CREATE TABLE tbCargos(
	car_Id					INT IDENTITY(1,1) NOT NULL,
	car_Nombre				NVARCHAR(90) NOT NULL,
	car_FechaCreacion		DATETIME not null,
	car_UsuarioCreacion		INT not null,
	car_FechaModificacion	DATETIME,
	car_UsuarioModificacion INT,
	car_Estado				BIT not null,
	CONSTRAINT PK_dbo_tbCargos_car_Id PRIMARY KEY(car_Id),
	CONSTRAINT FK_dbo_tbCargos_dbo_tbUsuarios_car_UsuarioCreacion_usu_Id FOREIGN KEY(car_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
	CONSTRAINT FK_dbo_tbCargos_dbo_tbUsuarios_car_UsuarioModificacion_usu_Id FOREIGN KEY(car_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)
);

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
--Metodo de Pago?¿
CREATE TABLE tbMetodoPago(
metpago_Id Char(1) not null,
metpago_Descripcion NVARCHAR (100) NOT NULL,
	metpago_FechaCreacion		DATETIME not null,
	metpago_UsuarioCreacion		INT not null,
	metpago_FechaModificacion	DATETIME,
	metpago_UsuarioModificacion INT,
	metpago_Estado				BIT not null,
	
	CONSTRAINT PK_dbo_tbMetodoPagos_metpago_Id PRIMARY KEY(metpago_Id),
	CONSTRAINT FK_dbo_tbMetodoPago_dbo_tbUsuarios_metpago_UsuarioCreacion_usu_Id FOREIGN KEY(metpago_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
	CONSTRAINT FK_dbo_tbMetodoPago_dbo_tbUsuarios_metpago_UsuarioModificacion_usu_Id FOREIGN KEY(metpago_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)

);
--INSERT INTO tbMetodoPago
--VALUES	('C','Tarjeta Credito'),
--		('D','Tarjeta Debito'),
--		('E','Efectivo');

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

--tabla proveedores
CREATE TABLE tbProveedores (
prov_Id                             INT IDENTITY(1,1),
prov_Nombre                         NVARCHAR(250) not null,
mun_Id								CHAR(04) NOT NULL,
prov_DireccionExacta                NVARCHAR(500),
prov_Telefono                       VARCHAR(50),
prov_Email                          NVARCHAR(50) not null,
prov_FechaCreacion					DATETIME not null,
prov_UsuarioCreacion				INT not null,
prov_FechaModificacion				DATETIME,
prov_UsuarioModificacion			INT,
prov_Estado							BIT not null,
CONSTRAINT PK_dbo_tbProveedores_prov_Id PRIMARY KEY(prov_Id ),
CONSTRAINT FK_dbo_tbProveedores_dbo_tbMunicipios_mun_Id FOREIGN KEY(mun_Id) REFERENCES tbMunicipios(mun_Id),
CONSTRAINT FK_dbo_tbproveedores_dbo_tbUsuarios_prov_UsuarioCreacion_usu_Id FOREIGN KEY(prov_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
CONSTRAINT FK_dbo_tbProveedores_dbo_tbUsuarios_prov_UsuarioModificacion_usu_Id FOREIGN KEY(prov_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)

	
);

--INSERT INTO tbProveedores
--VALUES('IMSA','Choloma Cortes','23124536','imsa123@gmail.com'),
--      ('Jugeteria Maria','Choloma Cortes','93124536','jugetesmaria@gmail.com'),
--	  ('AVON','San Pedro Sula, Cortes','94567536','avonofc@gmail.com'),
--	  ('Lacteos Jose','Choloma Cortes','33424536','lacteosjose@gmail.com');


------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

--Productos
CREATE TABLE tbProductos(
pro_Id			INT IDENTITY(1,1),
pro_Nombre		NVARCHAR (100) NOT NULL,
pro_Precio		DECIMAL (18,2) NOT NULL,
cat_Id			INT not null,
prov_id			INT not null,
pro_Stock		INT not null,
pro_FechaCreacion					DATETIME not null,
pro_UsuarioCreacion					INT not null,
pro_FechaModificacion				DATETIME,
pro_UsuarioModificacion				INT,
pro_Estado							BIT not null,

CONSTRAINT PK_dbo_tbProdutos_pro_Id PRIMARY KEY(pro_Id),
CONSTRAINT FK_dbo_tbProductos_tbCategoria_cat_Id FOREIGN KEY (cat_Id) REFERENCES tbCategoria (cat_Id),
CONSTRAINT FK_dbo_tbProductos_tbProveedores_prov_id FOREIGN KEY (prov_id) REFERENCES tbProveedores (prov_Id),
CONSTRAINT FK_dbo_tbProductos_dbo_tbUsuarios_pro_UsuarioCreacion_usu_Id FOREIGN KEY(pro_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
CONSTRAINT FK_dbo_tbProductos_dbo_tbUsuarios_pro_UsuarioModificacion_usu_Id FOREIGN KEY(pro_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)

);
--INSERT INTO tbProductos
--VALUES ('Malteada de chocolate',15,250,2,4),
--       ('Banano',5.25,80,4,4),
--	   ('Malteada de fresa',15,125,2,4),
--	   ('Asistin Lavanda',20,35,3,3),
--	   ('Mantequilla',25,160,2,4),
--	   ('Escoba Quica',45.252,10,3,3),
--	   ('Carro mac',15.206,25,1,2),
--	   ('Cacao',25,55,4,1),
--	   ('trapeador ',65,25,3,1),
--	   ('Juguete Bob const ',150,150,1,2),
--	   ('Tajo de res ',45,101,5,4);
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

--Clientes
CREATE TABLE tbClientes(
cli_Id                              INT IDENTITY (1,1),
cli_Nombre							NVARCHAR(100) NOT NULL,
cli_Apellido						NVARCHAR(100) NOT NULL,
mun_Id								CHAR(04) NOT NULL,
cli_DireccionExacta					NVARCHAR(500) NOT NULL,
cli_Telefono						NVARCHAR(20) NOT NULL,
cli_CorreoElectronico				NVARCHAR(100) NOT NULL,
cli_FechaCreacion					DATETIME not null,
cli_UsuarioCreacion					INT not null,
cli_FechaModificacion				DATETIME,
cli_UsuarioModificacion				INT,
cli_Estado							BIT not null,

CONSTRAINT PK_dbo_tbClientes_cli_Id PRIMARY KEY(cli_id),
CONSTRAINT FK_dbo_tbClientes_dbo_tbMunicipios_mun_Id FOREIGN KEY(mun_Id) REFERENCES tbMunicipios(mun_Id),
CONSTRAINT FK_dbo_tbClientes_dbo_tbUsuarios_cli_UsuarioCreacion_usu_Id FOREIGN KEY(cli_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
CONSTRAINT FK_dbo_tbClientes_dbo_tbUsuarios_cli_UsuarioModificacion_usu_Id FOREIGN KEY(cli_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)

);
--INSERT INTO tbClientes
--VALUES('Marta','Alvarado',' San Pedro Sula, Cortes','11-20-1993','98784565','martinezmarta@gmail.com'),
--      ('Alexander','Gutierrez','Choloma , Cortes','07-15-2000','88564205','alexguz0291@gmail.com'),
--      ('Daniel','Perez','San Pedro Sula, Cortes','02-04-2001','32724455','per00daniel@gmail.com'),
--      ('Cecilia','Lopez','La Lima, Cortes','11-18-2003','94358855','locaceci@gmail.com'),
--      ('Pedro','Perez','San Pedro Sula, Cortes','08-04-2001','94529572','pesau@gmail.com'),
--      ('Rut','Santos','Choloma , Cortes','09-11-2002','99698848','rutlaguerrera@gmail.com'),
--      ('Sara','Moraz','San Pedro Sula, Cortes','05-07-1999','92549019','samoraz@gmail.com'),
--       ('Jesus','Santos',' Choloma,Cortes','10-15-2001','88262541','jesussalvador@gmail.com'),
--       ('Danilo','Beltran','San Pedro Sula, Cortes','02-11-2000','98121879','beltran69@gmail.com'),
--       ('Belsebu','Hernandez','San Pedro Sula, Cortes','02-11-2004','98111879','beltran69@gmail.com');
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

--Empleados
CREATE TABLE tbEmpleados(
emp_Id                              INT IDENTITY (1,1),
emp_Nombre							NVARCHAR(100) NOT NULL,
emp_Apellido						NVARCHAR(100) NOT NULL,
emp_Sexo							CHAR(1) NOT NULL,
mun_Id								CHAR(04) NOT NULL,
emp_DireccionExacta					NVARCHAR(500) NOT NULL,
estciv_Id							CHAR(1) NOT NULL,
emp_Telefono						NVARCHAR(20) NOT NULL,
emp_CorreoElectronico				NVARCHAR(100) NOT NULL,
emp_FechaNacimiento					Date NOT NULL,
emp_FechaContratacion				Date NOT NULL,
car_Id								INT NOT NULL,
emp_FechaCreacion					DATETIME not null,
emp_UsuarioCreacion					INT not null,
emp_FechaModificacion				DATETIME,
emp_UsuarioModificacion				INT,
emp_Estado							BIT not null,

CONSTRAINT PK_dbo_tbEmpleados_emp_Id PRIMARY KEY(emp_Id),
CONSTRAINT FK_dbo_tbEmpleados_dbo_tbMunicipios_mun_Id FOREIGN KEY(mun_Id) REFERENCES tbMunicipios(mun_Id),
CONSTRAINT FK_dbo_tbEmpleados_dbo_tbEstadosCiviles_estciv_Id FOREIGN KEY(estciv_Id) REFERENCES tbEstadosCiviles(estciv_Id),
CONSTRAINT FK_dbo_tbEmpleados_dbo_tbCargos_car_Id FOREIGN KEY(car_Id) REFERENCES tbCargos(car_Id),
CONSTRAINT FK_dbo_tbEmpleados_dbo_tbUsuarios_emp_UsuarioCreacion_usu_Id FOREIGN KEY(emp_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
CONSTRAINT FK_dbo_tbEmpleados_dbo_tbUsuarios_emp_UsuarioModificacion_usu_Id FOREIGN KEY(emp_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)

);


--Factura
CREATE TABLE tbFactura(
fac_Id                              INT IDENTITY(1,1),
cli_Id                              INT not null,
fac_Fecha							Datetime NOT NULL,
emp_id								INT not null,
metpago_Id							CHAR(1) not null,
fac_FechaCreacion					DATETIME not null,
fac_UsuarioCreacion					INT not null,
fac_FechaModificacion				DATETIME,
fac_UsuarioModificacion				INT,
fac_Estado							BIT not null,

CONSTRAINT PK_dbo_tbFactura_fac_Id PRIMARY KEY(fac_Id),
CONSTRAINT FK_dbo_tbFactura_tbClientes_cli_id FOREIGN KEY(cli_Id) REFERENCES tbClientes(cli_Id),
CONSTRAINT FK_dbo_tbFactura_tbMetodoPago_metpago_id FOREIGN KEY(metpago_Id) REFERENCES tbMetodoPago(metpago_Id),
CONSTRAINT FK_dbo_tbFactura_dbo_tbEmpleados_emp_Id FOREIGN KEY(emp_Id) REFERENCES tbEmpleados(emp_Id),
CONSTRAINT FK_dbo_tbFactura_dbo_tbUsuarios_fac_UsuarioCreacion_usu_Id FOREIGN KEY(fac_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
CONSTRAINT FK_dbo_tbFactura_dbo_tbUsuarios_fac_UsuarioModificacion_usu_Id FOREIGN KEY(fac_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)

);

--INSERT INTO tbFactura
--VALUES (1,'11-20-2020',2),
--               (2,'11-21-2020',1),
--			   (4,'11-22-2020',2),
--			   (3,'11-23-2020',1),
--			   (5,'11-24-2020',2),
--			   (7,'11-25-2020',1),
--			   (8,'11-26-2020',2),
--			   (10,'11-26-2020',2)
--------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

--FacturaDetalles
CREATE TABLE tbFDetalles (
facd_Id                             INT IDENTITY(1,1),
fac_Id                              INT not null,
pro_Id                              INT not null,
facd_catidad						INT NOT NULL,
facd_Precio							DECIMAL (18,2) NOT NULL,
facd_FechaCreacion					DATETIME not null,
facd_UsuarioCreacion				INT not null,
facd_FechaModificacion				DATETIME,
facd_UsuarioModificacion			INT,
facd_Estado							BIT not null,
CONSTRAINT PK_dbo_tbFDetalles_facd_Id PRIMARY KEY(facd_Id),
CONSTRAINT FK_dbo_tbFDetalles_tbFactura_fac_id FOREIGN KEY(fac_Id) REFERENCES tbFactura(fac_Id),
CONSTRAINT FK_dbo_tbFDetalles_tbProducto_pro_id FOREIGN KEY(pro_Id) REFERENCES tbProductos(pro_Id),
CONSTRAINT FK_dbo_tbFDetalles_dbo_tbUsuarios_facd_UsuarioCreacion_usu_Id FOREIGN KEY(facd_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
CONSTRAINT FK_dbo_tbFDetalles_dbo_tbUsuarios_facd_UsuarioModificacion_usu_Id FOREIGN KEY(facd_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)

);

--INSERT INTO  tbFDetalles
--VALUES			(1,1,2,2*15),
--				(1,2,5,5*5.25),
--				(1,3,1,1*15),
--				(2,4,1,1*20),
--				(2,9,1,1*65),
--				(2,6,2,2*45.52),
--				(3,1,3,3*15),
--				(3,7,1,1*26),
--				(3,8,2,2*25),
--				(4,10,2,2*15),
--				(4,3,5,5*15),
--				(4,4,4,4*20),
--				(5,8,2,2*25),
--				(5,1,1,1*15),
--				(5,6,1,1*45.52),
--				(6,10,1,1*150),
--				(6,2,3,3*5.25),
--				(6,1,2,2*15),
--				(7,1,2,2*15),
--				(7,10,2,2*150),
--				(7,2,2,2*5.25),
--				(8,1,2,2*15),
--				(8,2,2,2*5.50),
--				(8,3,2,2*15),
--				(8,4,2,2*20),
--				(8,6,3,3*45)

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------



--Compra
CREATE TABLE tbCompras(
com_Id                              INT IDENTITY(1,1),
prov_Id                             INT not null,
com_Fecha							Datetime NOT NULL,
com_FechaCreacion					DATETIME not null,
com_UsuarioCreacion					INT not null,
com_FechaModificacion				DATETIME,
com_UsuarioModificacion				INT,
com_Estado							BIT not null,

CONSTRAINT PK_dbo_tbCompras_com_Id PRIMARY KEY(com_Id),
CONSTRAINT FK_dbo_tbCompras_tbProveedores_prov_id FOREIGN KEY(prov_Id) REFERENCES tbProveedores(prov_Id),
CONSTRAINT FK_dbo_tbCompras_dbo_tbUsuarios_com_UsuarioCreacion_usu_Id FOREIGN KEY(com_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
CONSTRAINT FK_dbo_tbCompras_dbo_tbUsuarios_com_UsuarioModificacion_usu_Id FOREIGN KEY(com_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)

);
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

--CompraDetalles
CREATE TABLE tbCDetalles (
comd_Id                             INT IDENTITY(1,1),
com_Id                              INT not null,
pro_Id                              INT not null,
comd_catidad						INT NOT NULL,
comd_Precio							DECIMAL (18,2) NOT NULL,
comd_FechaCreacion					DATETIME not null,
comd_UsuarioCreacion				INT not null,
comd_FechaModificacion				DATETIME,
comd_UsuarioModificacion			INT,
comd_Estado							BIT not null,
CONSTRAINT PK_dbo_tbCDetalles_comd_Id PRIMARY KEY(comd_Id),
CONSTRAINT FK_dbo_tbCDetalles_tbCompras_com_id FOREIGN KEY(com_Id) REFERENCES tbCompras(com_Id),
CONSTRAINT FK_dbo_tbCDetalles_tbProducto_pro_id FOREIGN KEY(pro_Id) REFERENCES tbProductos(pro_Id),
CONSTRAINT FK_dbo_tbCDetalles_dbo_tbUsuarios_comd_UsuarioCreacion_usu_Id FOREIGN KEY(comd_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
CONSTRAINT FK_dbo_tbCDetalles_dbo_tbUsuarios_comd_UsuarioModificacion_usu_Id FOREIGN KEY(comd_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)

);


------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

----Inventario

--CREATE TABLE tbInventario(
--inv_Id                              INT IDENTITY(1,1),
--pro_Id								INT,
--prov_Id                             INT,
--inv_Stock							INT NOT NULL,
--inv_FechaCreacion					DATETIME,
--inv_UsuarioCreacion					INT,
--inv_FechaModificacion				DATETIME,
--inv_UsuarioModificacion				INT,
--inv_Estado							BIT,

--CONSTRAINT PK_dbo_tbInventario_inv_Id PRIMARY KEY(inv_Id),
--CONSTRAINT FK_dbo_tbInventario_tbProveedores_prov_id FOREIGN KEY(prov_Id) REFERENCES tbProveedores(prov_Id),
--CONSTRAINT FK_dbo_tbInventario_tbProductos_pro_id FOREIGN KEY(pro_Id) REFERENCES tbProductos(pro_Id),
--CONSTRAINT FK_dbo_tbInventario_dbo_tbUsuarios_inv_UsuarioCreacion_usu_Id FOREIGN KEY(inv_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
--CONSTRAINT FK_dbo_tbInventario_dbo_tbUsuarios_inv_UsuarioModificacion_usu_Id FOREIGN KEY(inv_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)

--);

---------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------



go

CREATE TRIGGER trg_AumentarStock
   ON  [dbo].[tbCDetalles]
   AFTER INSERT
AS 
BEGIN
	

	DECLARE @NuevoStock int = (select t1.pro_Stock from [tbProductos] as t1 WHERE t1.pro_Id = (select t1.pro_Id from inserted as t1)) + (select t1.comd_catidad from inserted as t1 WHERE t1.pro_Id = (select t1.pro_Id from inserted as t1))

UPDATE [dbo].[tbProductos]
   SET [pro_Stock] = @NuevoStock
 WHERE pro_Id = (select t1.pro_Id from inserted as t1)


END
GO
go

-------------------------------------------------------------------------------------------



go

CREATE TRIGGER trg_DisminuirStock
   ON  [dbo].[tbFDetalles]
   AFTER INSERT
AS 
BEGIN
	

	DECLARE @NuevoStock int = (select t1.pro_Stock from [tbProductos] as t1 WHERE t1.pro_Id = (select t1.pro_Id from inserted as t1)) - (select t1.facd_catidad from inserted as t1 WHERE t1.pro_Id = (select t1.pro_Id from inserted as t1))

UPDATE [dbo].[tbProductos]
   SET [pro_Stock] = @NuevoStock
 WHERE pro_Id = (select t1.pro_Id from inserted as t1)


END
GO
go



-------------------------------------------------------------------------------------------

INSERT INTO [dbo].[tbUsuarios]
           ([usu_Usuario]
           ,[usu_Contrasenia]
           ,[emp_Id]
           ,[usu_UsuarioCreacion]
           ,[usu_FechaCreacion]
           ,[usu_UsuarioModificacion]
           ,[usu_FechaModificacion]
           ,[usu_Estado])
     VALUES
           ('admin0',HASHBYTES('SHA2_512','123'),1,1,GETDATE(),null,null,1)
GO


INSERT INTO [dbo].[tbDepartamentos]
VALUES ('01', 'Atlántida', GETDATE(), 1,null,null,1),
	   ('02', 'Colón', GETDATE(), 1,null,null,1),
	   ('03', 'Comayagua', GETDATE(), 1,null,null,1),
	   ('04', 'Copán', GETDATE(), 1,null,null,1),
	   ('05', 'Cortés', GETDATE(), 1,null,null,1),
	   ('06', 'Choluteca', GETDATE(), 1,null,null,1),
	   ('07', 'El Paraíso', GETDATE(), 1,null,null,1),
	   ('08', 'Francisco Morazán', GETDATE(), 1,null,null,1),
	   ('09', 'Gracias a Dios', GETDATE(), 1,null,null,1),
	   ('10', 'Intibucá', GETDATE(), 1,null,null,1),
	   ('11', 'Islas de la Bahía', GETDATE(), 1,null,null,1),
	   ('12', 'La Paz', GETDATE(), 1,null,null,1),
	   ('13', 'Lempira', GETDATE(), 1,null,null,1),
	   ('14', 'Ocotepeque', GETDATE(), 1,null,null,1),
	   ('15', 'Olancho', GETDATE(), 1,null,null,1),
	   ('16', 'Santa Bárbara', GETDATE(), 1,null,null,1),
	   ('17', 'Valle', GETDATE(), 1,null,null,1),
	   ('18', 'Yoro', GETDATE(), 1,null,null,1)

INSERT INTO [dbo].[tbMunicipios]([mun_Id], [mun_Nombre], [dep_Id], [mun_FechaCreacion],[mun_UsuarioCreacion],[mun_FechaModificacion], [mun_UsuarioModificacion],[mun_Estado])
VALUES ('0101', 'La Ceiba', '01', GETDATE(), 1,null,null,1),
	   ('0107', 'Tela', '01', GETDATE(), 1,null,null,1),
	   ('0301', 'Comayagua', '03', GETDATE(), 1,null,null,1),
	   ('0401', 'Santa Rosa de Copán', '04', GETDATE(), 1,null,null,1),
	   ('0501', 'San Pedro Sula', '05', GETDATE(), 1,null,null,1),
	   ('0502', 'Choloma', '05', GETDATE(), 1,null,null,1),
	   ('0511', 'Villanueva', '05', GETDATE(), 1,null,null,1),
	   ('0801', 'Distrito Central', '08', GETDATE(), 1,null,null,1),
	   ('0901', 'Puerto Lempira', '09', GETDATE(), 1,null,null,1),
	   ('1001', 'La Esperanza', '10', GETDATE(), 1,null,null,1),
	   ('1101', 'Roatán', '11', GETDATE(), 1,null,null,1)

	   INSERT INTO [dbo].[tbEstadosCiviles]
VALUES ('C', 'Casado(a)',  GETDATE(), 1, NULL, NULL, 1),
	   ('S', 'Soltero(a)',  GETDATE(), 1, NULL, NULL, 1),
	   ('D', 'Divorciado(a)',  GETDATE(), 1, NULL, NULL, 1),
	   ('V', 'Viudo(a)',  GETDATE(), 1, NULL, NULL, 1),
	   ('U', 'Union libre',  GETDATE(), 1, NULL, NULL, 1)


	   Insert INTO [dbo].[tbCargos]
	   Values('Jefe',GetDate(),1,null,null,1)

INSERT INTO [dbo].[tbEmpleados]
           ([emp_Nombre]
           ,[emp_Apellido]
           ,[emp_Sexo]
           ,[mun_Id]
           ,[emp_DireccionExacta]
           ,[estciv_Id]
           ,[emp_Telefono]
           ,[emp_CorreoElectronico]
           ,[emp_FechaNacimiento]
           ,[emp_FechaContratacion]
           ,[car_Id]
           ,[emp_FechaCreacion]
           ,[emp_UsuarioCreacion]
           ,[emp_FechaModificacion]
           ,[emp_UsuarioModificacion]
           ,[emp_Estado])
     VALUES
           ('Daniel','Espinoza' ,'M','0501' ,'Col. Municipal','S' ,'87756952' ,'daniele09099@gmail.com','02-04-2005' ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1)
GO



ALTER TABLE [dbo].[tbUsuarios] 
ADD CONSTRAINT FK_dbo_tbUsuarios_dbo_tbUsuarios_usu_UsuarioCreacion_usu_Id FOREIGN KEY([usu_UsuarioCreacion]) REFERENCES tbUsuarios(usu_Id);

GO

ALTER TABLE [dbo].[tbUsuarios] 
ADD CONSTRAINT FK_dbo_tbUsuarios_dbo_tbUsuarios_usu_UsuarioModificacion_usu_Id FOREIGN KEY([usu_UsuarioModificacion]) REFERENCES tbUsuarios(usu_Id);

GO

ALTER TABLE [dbo].[tbUsuarios] 
ADD CONSTRAINT FK_dbo_tbUsuarios_dbo_tbEmpleados_emp_Id FOREIGN KEY([emp_Id]) REFERENCES tbEmpleados([emp_Id]);



INSERT INTO [dbo].[tbMetodoPago]
           ([metpago_Id]
           ,[metpago_Descripcion]
           ,[metpago_FechaCreacion]
           ,[metpago_UsuarioCreacion]
           ,[metpago_FechaModificacion]
           ,[metpago_UsuarioModificacion]
           ,[metpago_Estado])
     VALUES
           ('E','Efectivo',GetDate(),1,null ,null,1),
           ('C','Tarjeta de Credito',GetDate(),1,null ,null,1),
           ('D','Tarjeta de Debito',GetDate(),1,null ,null,1)
GO

INSERT INTO [dbo].[tbProveedores]
           ([prov_Nombre]
           ,[mun_Id]
           ,[prov_DireccionExacta]
           ,[prov_Telefono]
           ,[prov_Email]
           ,[prov_FechaCreacion]
           ,[prov_UsuarioCreacion]
           ,[prov_FechaModificacion]
           ,[prov_UsuarioModificacion]
           ,[prov_Estado])
     VALUES
           ('Emsula','0501','Bulevar las torres','25002010','emsula@gmail.com',GetDate(),1,null,null ,1),
		   ('RicaSula','0501','Satelite','90002010','ricasula@gmail.com',GetDate(),1,null,null ,1),
		   ('lokilo','0501','Salida la lima','74550020','lokilo@gmail.com',GetDate(),1,null,null ,1),
		   ('Pollos Norteño','0501','15 calle','95660022','nortenios@gmail.com',GetDate(),1,null,null ,1),
		   ('Policarpio','0501','7 Calle','85556320','policarpio@gmail.com',GetDate(),1,null,null ,1)

GO


INSERT INTO [dbo].[tbClientes]
           ([cli_Nombre]
           ,[cli_Apellido]
           ,[mun_Id]
           ,[cli_DireccionExacta]
           ,[cli_Telefono]
           ,[cli_CorreoElectronico]
           ,[cli_FechaCreacion]
           ,[cli_UsuarioCreacion]
           ,[cli_FechaModificacion]
           ,[cli_UsuarioModificacion]
           ,[cli_Estado])
     VALUES
			('Comprador Final','NA','0501','NA','NA','NA',getDate(),1,null,null,1),
           ('Daniel','Martinez','0501','C10 15','87756952','daniel.martinez@gmail.com',getDate(),1,null,null,1),
		   ('Christopher','Aguiar Moreno','0501','Col Satelite','95299620','chrisaguila@gmail.com',getDate(),1,null,null,1),
		   ('Mario','Hernandez','0501','Ciudad nueva','74552012','marioh@gmail.com',getDate(),1,null,null,1)
GO



INSERT INTO [dbo].[tbCategoria]
           ([cat_Descripcion]
           ,[cat_FechaCreacion]
           ,[cat_UsuarioCreacion]
           ,[cat_FechaModificacion]
           ,[cat_UsuarioModificacion]
           ,[cat_Estado])
     VALUES
           ('Carnes',GETDATE(),'1',null,null,1),
		   ('Vegetales',GETDATE(),'1',null,null,1),
		   ('Juguetes',GETDATE(),'1',null,null,1),
		   ('Lacteos',GETDATE(),'1',null,null,1),
		   ('Medicamentos',GETDATE(),'1',null,null,1),
		   ('Electronicos',GETDATE(),'1',null,null,1),
		   ('Domesticos',GETDATE(),'1',null,null,1)
GO




INSERT INTO [dbo].[tbProductos]
           ([pro_Nombre]
           ,[pro_Precio]
           ,[cat_Id]
           ,[prov_id]
           ,[pro_Stock]
           ,[pro_FechaCreacion]
           ,[pro_UsuarioCreacion]
           ,[pro_FechaModificacion]
           ,[pro_UsuarioModificacion]
           ,[pro_Estado])
     VALUES
           ('Pollo',38.5,1,4,0 ,GETDATE(),1,null,null,1),
		   ('Carne Molida',30.5,1,4,0 ,GETDATE(),1,null,null,1),
		   ('Chuleta',42.5,1,4,0 ,GETDATE(),1,null,null,1),
		   ('Papas',16.5,2,3,0 ,GETDATE(),1,null,null,1),
		   ('Repollo',7.5,2,3,0 ,GETDATE(),1,null,null,1),
		   ('Cebolla',20.5,2,3,0 ,GETDATE(),1,null,null,1),
		   ('Leche',30.5,4,1,0 ,GETDATE(),1,null,null,1),
		   ('Queso',45.5,4,1,0 ,GETDATE(),1,null,null,1),
		   ('Mantequilla',40.5,4,1,0 ,GETDATE(),1,null,null,1),
		   ('Acetaminofen',24,5,5,0 ,GETDATE(),1,null,null,1)
GO



INSERT INTO [dbo].[tbCompras]
           ([prov_Id]
           ,[com_Fecha]
           ,[com_FechaCreacion]
           ,[com_UsuarioCreacion]
           ,[com_FechaModificacion]
           ,[com_UsuarioModificacion]
           ,[com_Estado])
     VALUES
           (4,GETDATE(),GETDATE(),1,null,null,1),
		   (3,GETDATE(),GETDATE(),1,null,null,1),
		   (1,GETDATE(),GETDATE(),1,null,null,1),
		   (5,GETDATE(),GETDATE(),1,null,null,1)
GO


INSERT INTO [dbo].[tbCDetalles]
           ([com_Id],[pro_Id],[comd_catidad],[comd_Precio],[comd_FechaCreacion],[comd_UsuarioCreacion],[comd_FechaModificacion],[comd_UsuarioModificacion],[comd_Estado])
     VALUES
           (1,1,20 ,35,GETDATE(),1,null ,null,1)
GO
INSERT INTO [dbo].[tbCDetalles]
           ([com_Id],[pro_Id],[comd_catidad],[comd_Precio],[comd_FechaCreacion],[comd_UsuarioCreacion],[comd_FechaModificacion],[comd_UsuarioModificacion],[comd_Estado])
     VALUES
		   (1,2,20 ,28,GETDATE(),1,null ,null,1)
GO
INSERT INTO [dbo].[tbCDetalles]
           ([com_Id],[pro_Id],[comd_catidad],[comd_Precio],[comd_FechaCreacion],[comd_UsuarioCreacion],[comd_FechaModificacion],[comd_UsuarioModificacion],[comd_Estado])
     VALUES
		   (1,3,20 ,40,GETDATE(),1,null ,null,1)
GO
INSERT INTO [dbo].[tbCDetalles]
           ([com_Id],[pro_Id],[comd_catidad],[comd_Precio],[comd_FechaCreacion],[comd_UsuarioCreacion],[comd_FechaModificacion],[comd_UsuarioModificacion],[comd_Estado])
     VALUES
		   (2,4,20 ,15,GETDATE(),1,null ,null,1)
GO
INSERT INTO [dbo].[tbCDetalles]
           ([com_Id],[pro_Id],[comd_catidad],[comd_Precio],[comd_FechaCreacion],[comd_UsuarioCreacion],[comd_FechaModificacion],[comd_UsuarioModificacion],[comd_Estado])
     VALUES
		   (2,5,20 ,5,GETDATE(),1,null ,null,1)
GO
INSERT INTO [dbo].[tbCDetalles]
           ([com_Id],[pro_Id],[comd_catidad],[comd_Precio],[comd_FechaCreacion],[comd_UsuarioCreacion],[comd_FechaModificacion],[comd_UsuarioModificacion],[comd_Estado])
     VALUES
		   (2,6,20 ,18,GETDATE(),1,null ,null,1)
GO
INSERT INTO [dbo].[tbCDetalles]
           ([com_Id],[pro_Id],[comd_catidad],[comd_Precio],[comd_FechaCreacion],[comd_UsuarioCreacion],[comd_FechaModificacion],[comd_UsuarioModificacion],[comd_Estado])
     VALUES
		   (3,7,20 ,28,GETDATE(),1,null ,null,1)
GO
INSERT INTO [dbo].[tbCDetalles]
           ([com_Id],[pro_Id],[comd_catidad],[comd_Precio],[comd_FechaCreacion],[comd_UsuarioCreacion],[comd_FechaModificacion],[comd_UsuarioModificacion],[comd_Estado])
     VALUES
		   (3,8,20 ,42,GETDATE(),1,null ,null,1)
GO
INSERT INTO [dbo].[tbCDetalles]
           ([com_Id],[pro_Id],[comd_catidad],[comd_Precio],[comd_FechaCreacion],[comd_UsuarioCreacion],[comd_FechaModificacion],[comd_UsuarioModificacion],[comd_Estado])
     VALUES
		   (3,9,20 ,38,GETDATE(),1,null ,null,1)
GO
INSERT INTO [dbo].[tbCDetalles]
           ([com_Id],[pro_Id],[comd_catidad],[comd_Precio],[comd_FechaCreacion],[comd_UsuarioCreacion],[comd_FechaModificacion],[comd_UsuarioModificacion],[comd_Estado])
     VALUES
		   (4,10,20 ,20,GETDATE(),1,null ,null,1)
GO

INSERT INTO [dbo].[tbFactura]
           ([cli_Id]
           ,[fac_Fecha]
           ,[emp_id]
           ,[metpago_Id]
           ,[fac_FechaCreacion]
           ,[fac_UsuarioCreacion]
           ,[fac_FechaModificacion]
           ,[fac_UsuarioModificacion]
           ,[fac_Estado])
     VALUES
           (1,GETDATE() ,1,'E',GETDATE(),'1' ,null,null,1),
		   (2,GETDATE() ,1,'C',GETDATE(),'1' ,null,null,1),
		   (3,GETDATE() ,1,'D',GETDATE(),'1' ,null,null,1)

GO

INSERT INTO [dbo].[tbFDetalles]
           ([fac_Id],[pro_Id],[facd_catidad],[facd_Precio],[facd_FechaCreacion],[facd_UsuarioCreacion],[facd_FechaModificacion],[facd_UsuarioModificacion],[facd_Estado])
     VALUES
           (1,7,2,(Select T1.pro_Precio from tbProductos T1 WHERE t1.pro_Id = 7),GETDATE(),1,null,null,1)

GO
INSERT INTO [dbo].[tbFDetalles]
           ([fac_Id],[pro_Id],[facd_catidad],[facd_Precio],[facd_FechaCreacion],[facd_UsuarioCreacion],[facd_FechaModificacion],[facd_UsuarioModificacion],[facd_Estado])
     VALUES
		   (2,1,3,(Select T1.pro_Precio from tbProductos T1 WHERE t1.pro_Id = 1),GETDATE(),1,null,null,1)

GO
INSERT INTO [dbo].[tbFDetalles]
           ([fac_Id],[pro_Id],[facd_catidad],[facd_Precio],[facd_FechaCreacion],[facd_UsuarioCreacion],[facd_FechaModificacion],[facd_UsuarioModificacion],[facd_Estado])
     VALUES
		   (2,2,4,(Select T1.pro_Precio from tbProductos T1 WHERE t1.pro_Id = 2),GETDATE(),1,null,null,1)

GO
INSERT INTO [dbo].[tbFDetalles]
           ([fac_Id],[pro_Id],[facd_catidad],[facd_Precio],[facd_FechaCreacion],[facd_UsuarioCreacion],[facd_FechaModificacion],[facd_UsuarioModificacion],[facd_Estado])
     VALUES
		   (3,3,6,(Select T1.pro_Precio from tbProductos T1 WHERE t1.pro_Id = 3),GETDATE(),1,null,null,1)

GO
INSERT INTO [dbo].[tbFDetalles]
           ([fac_Id],[pro_Id],[facd_catidad],[facd_Precio],[facd_FechaCreacion],[facd_UsuarioCreacion],[facd_FechaModificacion],[facd_UsuarioModificacion],[facd_Estado])
     VALUES
		   (3,4,8,(Select T1.pro_Precio from tbProductos T1 WHERE t1.pro_Id = 4),GETDATE(),1,null,null,1)

GO
INSERT INTO [dbo].[tbFDetalles]
           ([fac_Id],[pro_Id],[facd_catidad],[facd_Precio],[facd_FechaCreacion],[facd_UsuarioCreacion],[facd_FechaModificacion],[facd_UsuarioModificacion],[facd_Estado])
     VALUES
		   (3,6,10,(Select T1.pro_Precio from tbProductos T1 WHERE t1.pro_Id = 6),GETDATE(),1,null,null,1)

GO

----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------PROCEDIMIENTOS ALMACENADOS---------------------------------
----------------------------------------------------------------------------------------------------------------



-- Index prooveedores
create or alter procedure UDP_BuscarProveedores
@frase nvarchar(250)
as
begin


SELECT   prov_Id,
		 prov_Nombre, 
		 t1.mun_Id, 
		 t2.mun_Nombre + ', '+ t3.dep_Nombre AS mun_Nombre,
		 prov_DireccionExacta, 
		 prov_Telefono, 
		 prov_Email, 
		 prov_FechaCreacion, 
		 prov_UsuarioCreacion, 
		 prov_FechaModificacion,
		  prov_UsuarioModificacion, 
		  prov_Estado     
FROM            tbProveedores t1 INNER JOIN  [dbo].[tbMunicipios]  t2
ON t1.mun_Id = t2.mun_Id INNER JOIN [dbo].[tbDepartamentos] t3 
ON t2.dep_Id = t3.dep_Id
WHERE  (( prov_Id LIKE '%'+@frase+'%')
or     (prov_Nombre LIKE '%'+@frase+'%')
or     (prov_DireccionExacta LIKE '%'+@frase+'%')
or     ( prov_Telefono LIKE '%'+@frase+'%')
or     ( prov_Email LIKE '%'+@frase+'%'))
AND t1.prov_Estado = 1
end 
GO




--Procedimiento Editar Proveedor

create or alter procedure UDP_EditarProveedores
@id int,
@Nombre nvarchar(220),
@Municipio nvarchar(200),
@Direccion nvarchar(500),
@Telefono nvarchar(20),
@Email  nvarchar(100),
@UsuarioModificacion INT
as
begin


update tbProveedores
set prov_Nombre = @Nombre,
	prov_DireccionExacta = @Direccion,
    prov_Telefono= @Telefono, 
	prov_Email=@Email,
	prov_FechaModificacion=  GETDATE(),
	prov_UsuarioModificacion = @UsuarioModificacion
where prov_Id=@id
end

go
--Procedimiento Almacenado Eliminar Proveedor
create or alter procedure UDP_EliminarProveedores
@id int
as
begin

update tbProveedores
set prov_Estado = 0
where prov_Id=@id

end
go


 --Insertar Proveedores


 
create or alter procedure UDP_InsertarProveedores
@Nombre nvarchar(220),
@Municipio nvarchar(200),
@Direccion nvarchar(500),
@Telefono nvarchar(20),
@Email  nvarchar(100),
@UsuarioCreacion INT
as
begin



INSERT INTO [dbo].[tbProveedores]
           ([prov_Nombre]
           ,[mun_Id]
           ,[prov_DireccionExacta]
           ,[prov_Telefono]
           ,[prov_Email]
           ,[prov_FechaCreacion]
           ,[prov_UsuarioCreacion]
           ,[prov_FechaModificacion]
           ,[prov_UsuarioModificacion]
           ,[prov_Estado])
     VALUES
           (@Nombre,@Municipio,@Direccion,@Telefono,@Email,GetDate(),1,null,null ,1)

end

GO


--Insertar Usuario
CREATE PROCEDURE UDP_InsertarUsuario
	@Usuario Nvarchar(100),
	@Contrasenia Nvarchar(max),
	@Empleado int,
	@usuarioCreacion int

AS
BEGIN

Declare @Password Nvarchar(max) = (HASHBYTES('SHA2_512',@Contrasenia))

INSERT INTO [dbo].[tbUsuarios]
           ([usu_Usuario]
           ,[usu_Contrasenia]
           ,[emp_Id]
           ,[usu_UsuarioCreacion]
           ,[usu_FechaCreacion]
           ,[usu_UsuarioModificacion]
           ,[usu_FechaModificacion]
           ,[usu_Estado])
     VALUES
           (@Usuario
           ,@Password
           ,@Empleado
           ,@usuarioCreacion
           ,GetDate()
           ,null
           ,null
           ,1)

END
GO

--Index/Tabla Usuarios
CREATE PROCEDURE UDP_IndexUsuario

AS
BEGIN

SELECT [usu_Id]
      ,[usu_Usuario]
      ,[usu_Contrasenia]
      ,T1.[emp_Id]
	  ,t2.emp_Nombre + ' ' + t2.emp_Apellido as emp_Nombre 
      ,[usu_UsuarioCreacion]
      ,[usu_FechaCreacion]
      ,[usu_UsuarioModificacion]
      ,[usu_FechaModificacion]
      ,[usu_Estado]
  FROM [tbUsuarios] T1 INNER JOIN [dbo].[tbEmpleados] T2
  ON T1.emp_Id = T2.emp_Id
  WHERE t1.usu_Estado = 1

END
GO


--Editar Usuario 
CREATE PROCEDURE UDP_EdicionUsuario
	@IdEdicion INT,
	@Contrasenia Nvarchar(max),
	@Empleado int,
	@usuarioModificacion int
AS
BEGIN

Declare @Password Nvarchar(max) = (HASHBYTES('SHA2_512',@Contrasenia))

UPDATE [dbo].[tbUsuarios]
   SET [usu_Contrasenia] = @Password
      ,[emp_Id] = @Empleado
      ,[usu_UsuarioModificacion] = @usuarioModificacion
      ,[usu_FechaModificacion] = GetDate()
      ,[usu_Estado] = 1
 WHERE usu_Id = @IdEdicion


END
GO


--borrar Usuario
CREATE OR ALTER PROCEDURE UDP_BorrarUsuario
	@IdEdicion INT
AS
BEGIN

UPDATE [dbo].[tbUsuarios]
   SET [usu_Estado] = 0
 WHERE usu_Id = @IdEdicion


END
GO


--Login
CREATE PROCEDURE UDP_Login
	@Usuario Nvarchar(100),
	@Contrasenia Nvarchar(Max)
AS
BEGIN

Declare @Password Nvarchar(max) = (HASHBYTES('SHA2_512',@Contrasenia))

SELECT [usu_Id]
      ,[usu_Usuario]
      ,[usu_Contrasenia]
      ,T1.[emp_Id]
	  ,t2.emp_Nombre + ' ' + t2.emp_Apellido as emp_Nombre 
      ,[usu_UsuarioCreacion]
      ,[usu_FechaCreacion]
      ,[usu_UsuarioModificacion]
      ,[usu_FechaModificacion]
      ,[usu_Estado]
  FROM [tbUsuarios] T1 INNER JOIN [dbo].[tbEmpleados] T2
  ON T1.emp_Id = T2.emp_Id
  WHERE t1.usu_Contrasenia = @Password 
  AND t1.usu_Usuario = @Usuario

END
GO


--index / buscar cargos

CREATE PROCEDURE UDP_IndexCargos
AS
BEGIN

SELECT [car_Id]
      ,[car_Nombre]
      ,[car_FechaCreacion]
      ,[car_UsuarioCreacion]
      ,[car_FechaModificacion]
      ,[car_UsuarioModificacion]
      ,[car_Estado]
  FROM [dbo].[tbCargos]
  WHERE car_Estado = 1


END
GO

--Insetar Cargo

CREATE PROCEDURE UDP_InsertarCargo
	@nombre Nvarchar(200),
	@usuarioCreacion int

AS
BEGIN


INSERT INTO [dbo].[tbCargos]
           ([car_Nombre]
           ,[car_FechaCreacion]
           ,[car_UsuarioCreacion]
           ,[car_FechaModificacion]
           ,[car_UsuarioModificacion]
           ,[car_Estado])
     VALUES
           (@nombre
           ,GetDate()
           ,@usuarioCreacion
           ,null
           ,null
           ,1)


END
GO


--borrar Cargo
CREATE OR ALTER PROCEDURE UDP_BorrarCargo
	@IdEdicion INT
AS
BEGIN

UPDATE [dbo].[tbCargos]
   SET [car_Estado] = 0
 WHERE car_Id = @IdEdicion


END
GO



--Iditar Cargo
CREATE PROCEDURE UDP_EdicionCargo
	@IdEdicion INT,
	@nombre Nvarchar(90),
	@usuarioModificacion int
AS
BEGIN


UPDATE [dbo].[tbCargos]
   SET [car_Nombre] = @nombre
      ,[car_FechaModificacion] = GETDATE()
      ,[car_UsuarioModificacion] = @usuarioModificacion
 WHERE car_Id = @IdEdicion

END
GO