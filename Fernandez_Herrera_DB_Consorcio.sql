 
SET DATEFORMAT dmy; 
create database Fernandez_Herrera_DB_Consorcio
GO
use Fernandez_Herrera_DB_Consorcio
GO
create  table CALENDARIOS  (
 ID BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1), 
 FECHA DATE NOT NULL,
 HORA  TIME NOT NULL,
EVENTO VARCHAR(50) NOT NULL,
 DESCRIPCION VARCHAR(MAX) NULL,
 ESTADO BIT NOT NULL
)
go
create table tbl_contents (
	id int identity,
	idvecino int,
	mes varchar(40),
	content varbinary(max),
	constraint pk_tbl_contents primary key(id)
)
go
create table SERVICIOS (
ID INT NOT NULL PRIMARY	KEY identity(1,1),
DESCRIPCION VARCHAR (100)NOT NULL
)
go
create table ServiciosRecomendados(
ID BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1), 
IDSERVICIO INT NOT NULL FOREIGN KEY REFERENCES SERVICIOS(ID),
txt_Nombre VARCHAR(50) NOT NULL,
NroContacto  VARCHAR(100)  NULL,
Horarios Varchar(50) NULL,
Sitio varchar(max) null,
ImgSitio varchar(max) null,
Ubicacion varchar(max) null,
ImgUbicacion varchar(max) null,
 ESTADO BIT NOT NULL
)
GO
create table CATEGORIAS (
ID INT NOT NULL PRIMARY	KEY identity(1,1),
DESCRIPCION VARCHAR (100)NOT NULL
)
go
create table Avisos (
 ID BIGINT NOT NULL PRIMARY KEY IDENTITY (1,1),
 FECHA DATE NOT NULL,
 DESCRIPCION VARCHAR(5000) NULL,
 IMAGENURL VARCHAR(1000) NOT NULL,
 IDCATEGORIA INT NOT NULL FOREIGN KEY REFERENCES CATEGORIAS(ID),
  Estado bit not null ,
)
GO
create table TipoUsuarios (
 ID INT NOT NULL PRIMARY KEY IDENTITY (1,1),
 DESCRIPCION VARCHAR(50) NOT NULL,
)
GO

create table Departamento(
ID Int NOT NULL PRIMARY KEY IDENTITY (1,1),
Descripcion varchar(20)
)
go
create table Usuarios (
 ID BIGINT NOT NULL PRIMARY KEY IDENTITY (1,1),
 NOMBREUSUARIO VARCHAR(50) NULL,
 NOMBRE VARCHAR(50) NULL,
 APELLIDO VARCHAR(50) NOT NULL,
 EMAIL VARCHAR(100) NULL,
 PASS VARCHAR(80) NULL,
 FECHANAC DATE NOT NULL,
 FECHAALTA DATE NOT NULL,
 IDTIPO INT NOT NULL FOREIGN KEY REFERENCES TipoUsuarios(ID),
 IDDepto INT NOT NULL FOREIGN KEY REFERENCES Departamento(ID),
 Estado bit not null  
)

GO

create table EstadosProyectos(
ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
Descripcion Varchar(200)
)
GO
create table Proyectos(
ID BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
NOMBRE Varchar(200) ,
DESCRIPCION Varchar(200) , 
Monto Money,
IDESTADO INT foreign key references EstadosProyectos(ID) 
)
        --DATOS---
--TIPOS USUARIOS--
INSERT INTO TipoUsuarios VALUES('Administrador')
INSERT INTO TipoUsuarios VALUES('Vecino')
--Departamento-
INSERT INTO Departamento VALUES ('ADMIN')
INSERT INTO Departamento VALUES ('PB A')
INSERT INTO Departamento VALUES ('PB B')
INSERT INTO Departamento VALUES ('1 A')
INSERT INTO Departamento VALUES ('1 B')
--USUARIOS--
INSERT INTO Usuarios VALUES ('NicoAdmin','Nicolas','Herrera','admin@gmail.com','1234','1986-11-04',getdate(),1,1,1)
INSERT INTO Usuarios VALUES ('DaniVecino','DAniel','Fernandez','vecino@gmail.com','1234','1986-11-04',getdate(),2,2,1)
--Estados Proyectos
INSERT INTO EstadosProyectos VALUES('Pendiente')
INSERT INTO EstadosProyectos VALUES('Evaluando')
INSERT INTO EstadosProyectos VALUES('Aprobado')
--CALENDARIO
INSERT INTO CALENDARIOS VALUES( GETDATE(),'18:30','REUNION POR PRESUPUESTO',' PROYECTO SOLARIUM',1)
INSERT INTO CALENDARIOS VALUES('2023/08/20','08:00','GASISTA',' ',1)
INSERT INTO CALENDARIOS VALUES('2022/08/21','08:00','GASISTA',' ',1)
INSERT INTO CALENDARIOS VALUES( GETDATE(),'10:00','REUNION CONSORCIO','LOS TEMAS DE ESTA REUNION SERAN PROXIMOS PROYECTOS',1)
INSERT INTO CALENDARIOS VALUES( GETDATE(),'08:00','GASISTA','REPARACION DE ALA B',1)
INSERT INTO CALENDARIOS VALUES( GETDATE(),'10:30','PINTORES','',1)
INSERT INTO CALENDARIOS VALUES( GETDATE(),'10:00','REUNION CONSORCIO','LOS TEMAS DE ESTA REUNION SERAN PROXIMOS PROYECTOS',1)
INSERT INTO CALENDARIOS VALUES( GETDATE(),'08:00','GASISTA','REPARACION DE ALA B',1)
INSERT INTO CALENDARIOS VALUES( GETDATE(),'10:00','REUNION CONSORCIO','LOS TEMAS DE ESTA REUNION SERAN PROXIMOS PROYECTOS',1)

--SERVICIOS
INSERT INTO SERVICIOS VALUES('TRANSPORTE')
INSERT INTO SERVICIOS VALUES('PLOMERIA')
INSERT INTO SERVICIOS VALUES('ELECTRICISTA')
INSERT INTO SERVICIOS VALUES('GASISTA')
INSERT INTO SERVICIOS VALUES('FERRETERIA')
INSERT INTO SERVICIOS VALUES('VETERINARIA')
INSERT INTO SERVICIOS VALUES('CERRAJERIA')
INSERT INTO SERVICIOS VALUES('FARMACIA')


--SERVICIOS RECOMENDADOS

--iconos de servicios recomendados---
-- x---
--https://cdn-icons-png.flaticon.com/512/1828/1828527.png

--google map--
--https://cdn-icons-png.flaticon.com/512/1483/1483336.png

-- web--
--https://cdn-icons-png.flaticon.com/512/1006/1006669.png

--con pagina con ubicacion
INSERT INTO  ServiciosRecomendados VALUES(2,'plomero.com','sin numero','24hs','https://www.plomero.com.ar/','https://cdn-icons-png.flaticon.com/512/1006/1006669.png','https://www.google.com.ar/maps/place/PLOMERO.COM.AR/@-34.5923364,-58.4897871,14z/data=!4m7!3m6!1s0x95bcb5f78e76a4b9:0x2a2d15bb4b61a006!8m2!3d-34.596004!4d-58.4510431!15sCiRodHRwczovL3d3dy5wbG9tZXJvLmNvbS5hci9wbG9tZXJpYS-SAQdwbHVtYmVy4AEA!16s%2Fg%2F11bxc6180t?coh=164777&entry=tt','https://cdn-icons-png.flaticon.com/512/1483/1483336.png',1)
INSERT INTO  ServiciosRecomendados VALUES(3,'Electricista Matriculado','sin numero','24hs','https://www.electricista-matriculado.net/seguridad-electrica/','https://cdn-icons-png.flaticon.com/512/1006/1006669.png','https://www.google.com.ar/maps/place/Lavalle+1772,+C1048AAP+CABA/@-34.6032322,-58.3940287,17z/data=!3m1!4b1!4m6!3m5!1s0x95bccac1073b3e87:0x41408909df2860df!8m2!3d-34.6032366!4d-58.3918347!16s%2Fg%2F11cs9dk43x?coh=164777&entry=tt','https://cdn-icons-png.flaticon.com/512/1483/1483336.png',1)
INSERT INTO  ServiciosRecomendados VALUES(4,'Gasista Matriculado','sin numero','24hs','https://www.jhonservices.com/','https://cdn-icons-png.flaticon.com/512/1006/1006669.png','https://www.google.com.ar/maps/place/RAMON+-+GASISTA+MATRICULADO+Y+PLOMERIA/@-34.5912871,-58.427594,13z/data=!4m6!3m5!1s0x95bccbe924c2409d:0x8e698a3c91722b4c!8m2!3d-34.6081456!4d-58.3958427!16s%2Fg%2F11h_19btkn?coh=164777&entry=tt','https://cdn-icons-png.flaticon.com/512/1483/1483336.png',1)

--sin pagina sin ubicacion
INSERT INTO  ServiciosRecomendados VALUES(1,'Fletes Ricardo','11433456','de 8 a 21 hs','Error.aspx','https://cdn-icons-png.flaticon.com/512/1828/1828527.png','Error.aspx','https://cdn-icons-png.flaticon.com/512/1828/1828527.png',1)
INSERT INTO  ServiciosRecomendados VALUES(1,'Mudanzas LosHermanos','1154419886','de 8 a 21 hs','Error.aspx','https://cdn-icons-png.flaticon.com/512/1828/1828527.png','Error.aspx','https://cdn-icons-png.flaticon.com/512/1828/1828527.png',1)
INSERT INTO  ServiciosRecomendados VALUES(2,'manolo','46001553','24hs','Error.aspx','https://cdn-icons-png.flaticon.com/512/1828/1828527.png','Error.aspx','https://cdn-icons-png.flaticon.com/512/1828/1828527.png',1)

-- sin pagina
INSERT INTO  ServiciosRecomendados VALUES(2,'Home inox','46001553','24hs','Error.aspx','https://cdn-icons-png.flaticon.com/512/1828/1828527.png','https://www.google.com.ar/maps/place/Homeinox/@-34.5974266,-58.5184174,14z/data=!4m6!3m5!1s0x95bcb7fc52099c25:0x728766727842880c!8m2!3d-34.5974266!4d-58.4854584!16s%2Fg%2F11fvfpdn8c?coh=164777&entry=tt','https://cdn-icons-png.flaticon.com/512/1483/1483336.png',1)


--sin pagina sin ubicacion
INSERT INTO  ServiciosRecomendados VALUES('Transporte','Fletes Ricardo','11433456','de 8 a 21 hs','Error.aspx','https://cdn-icons-png.flaticon.com/512/1828/1828527.png','Error.aspx','https://cdn-icons-png.flaticon.com/512/1828/1828527.png',1)
INSERT INTO  ServiciosRecomendados VALUES('Transporte','Mudanzas LosHermanos','1154419886','de 8 a 21 hs','Error.aspx','https://cdn-icons-png.flaticon.com/512/1828/1828527.png','Error.aspx','https://cdn-icons-png.flaticon.com/512/1828/1828527.png',1)
INSERT INTO  ServiciosRecomendados VALUES('plomeria','manolo','46001553','24hs','Error.aspx','https://cdn-icons-png.flaticon.com/512/1828/1828527.png','Error.aspx','https://cdn-icons-png.flaticon.com/512/1828/1828527.png',1)

-- sin pagina
INSERT INTO  ServiciosRecomendados VALUES('plomeria','Home inox','46001553','24hs','Error.aspx','https://cdn-icons-png.flaticon.com/512/1828/1828527.png','https://www.google.com.ar/maps/place/Homeinox/@-34.5974266,-58.5184174,14z/data=!4m6!3m5!1s0x95bcb7fc52099c25:0x728766727842880c!8m2!3d-34.5974266!4d-58.4854584!16s%2Fg%2F11fvfpdn8c?coh=164777&entry=tt','https://cdn-icons-png.flaticon.com/512/1483/1483336.png',1)



INSERT INTO CATEGORIAS VALUES('CALENDARIO')
INSERT INTO CATEGORIAS VALUES('MENSAJES')
INSERT INTO CATEGORIAS VALUES('EXPENSAS')
INSERT INTO CATEGORIAS VALUES('SERVICIOS COMUNES')
INSERT INTO CATEGORIAS VALUES('SERVICIOS RECOMENDADOS')
--AVISOS
INSERT INTO Avisos VALUES ('2022/06/22','REUNION DE CONSORCIO EL 24/06','https://www.bing.com/th?id=OIP.FmlS-PaMW23NwkwKOH2bMQHaJR&w=150&h=188&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2',1,1)
INSERT INTO Avisos VALUES ('2022/06/22','REUNION DE CONSORCIO EL 24/06','https://th.bing.com/th/id/OIP.apI5d6gkSiQBgi_7hKHK8AHaJR?pid=ImgDet&w=170&h=213&c=7',1,1)
INSERT INTO Avisos VALUES ('2022/06/22','REUNION DE CONSORCIO EL 24/06','https://www.bing.com/th?id=OIP.FmlS-PaMW23NwkwKOH2bMQHaJR&w=150&h=188&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2',1,1)
INSERT INTO Avisos VALUES ('2022/06/22','REUNION DE CONSORCIO EL 24/06','https://th.bing.com/th/id/OIP.apI5d6gkSiQBgi_7hKHK8AHaJR?pid=ImgDet&w=170&h=213&c=7',1,1)

INSERT INTO Avisos VALUES ('2022/06/22','REUNION DE CONSORCIO EL 24/06','https://www.bing.com/th?id=OIP.FmlS-PaMW23NwkwKOH2bMQHaJR&w=150&h=188&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2',1,1)
INSERT INTO Avisos VALUES ('2022/06/22','REUNION DE CONSORCIO EL 24/06','https://th.bing.com/th/id/OIP.apI5d6gkSiQBgi_7hKHK8AHaJR?pid=ImgDet&w=170&h=213&c=7',1,1)

INSERT INTO Avisos VALUES ('2022/06/22','REUNION DE CONSORCIO EL 24/06','https://www.bing.com/th?id=OIP.FmlS-PaMW23NwkwKOH2bMQHaJR&w=150&h=188&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2',1,1)
INSERT INTO Avisos VALUES ('2022/06/22','REUNION DE CONSORCIO EL 24/06','https://th.bing.com/th/id/OIP.apI5d6gkSiQBgi_7hKHK8AHaJR?pid=ImgDet&w=170&h=213&c=7',1,1)

INSERT INTO Avisos VALUES ('2022/06/22','REUNION DE CONSORCIO EL 24/06','https://www.bing.com/th?id=OIP.FmlS-PaMW23NwkwKOH2bMQHaJR&w=150&h=188&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2',1,1)
INSERT INTO Avisos VALUES ('2022/06/22','REUNION DE CONSORCIO EL 24/06','https://th.bing.com/th/id/OIP.apI5d6gkSiQBgi_7hKHK8AHaJR?pid=ImgDet&w=170&h=213&c=7',1,1)

INSERT INTO Avisos VALUES ('2022/06/22','REUNION DE CONSORCIO EL 24/06','https://www.bing.com/th?id=OIP.FmlS-PaMW23NwkwKOH2bMQHaJR&w=150&h=188&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2',1,1)
INSERT INTO Avisos VALUES ('2022/06/22','REUNION DE CONSORCIO EL 24/06','https://th.bing.com/th/id/OIP.apI5d6gkSiQBgi_7hKHK8AHaJR?pid=ImgDet&w=170&h=213&c=7',1,1)

--Proyectos


GO 
	----SP----

---	USUARIOS-------
Create PROCEDURE sp_ins_usuario(
@NombreUsuario VARCHAR (50),
@Nombre VARCHAR (50),
@Apellido VARCHAR (50),
@Email VARCHAR (100),
@Pass VARCHAR (80),
@FechaNac Date,
@IdTipo int,
@IdDepto int

)
AS 
BEGIN
	Begin try 
		INSERT INTO Usuarios(NOMBREUSUARIO,NOMBRE,APELLIDO,EMAIL,PASS,FECHANAC,FECHAALTA,IDTIPO,IDDEPTO,Estado) VALUES(@NombreUsuario,@Nombre,@Apellido,@Email,@Pass,@FechaNac,getDate(),@IdTipo,@IdDepto,1)
	End try
    Begin Catch
        RAISERROR('Error grave al guardar el usuario', 16, 1)
	End Catch
END

go


Create PROCEDURE sp_Modif_usuario(
@ID bigint,
@NombreUsuario VARCHAR (50),
@Nombre VARCHAR (50),
@Apellido VARCHAR (50),
@Email VARCHAR (100),
@Pass VARCHAR (80),
@FechaNac Date,
@IdTipo int,
@IdDepto int

)
AS 
BEGIN
	Begin try 
	UPDATE Usuarios SET NOMBREUSUARIO =@NombreUsuario,NOMBRE=@Nombre,APELLIDO=@Apellido,EMAIL=@Email,FECHANAC=@FechaNac,PASS=@Pass,IDTIPO=@IdTipo,IDDepto=@IdDepto,Estado=1 where ID =@ID;   

	End try
    Begin Catch
        RAISERROR('Error grave al guardar el usuario', 16, 1)
	End Catch
END

go

---	PROYECTOS-------
create PROCEDURE sp_ins_proyecto(
@Nombre VARCHAR (200),
@Descripcion VARCHAR (200),
@Monto Money,
@idestado int
)
AS 
BEGIN
	Begin try 
		INSERT INTO Proyectos(NOMBRE,DESCRIPCION,Monto,IDESTADO) VALUES(@Nombre,@Descripcion,@Monto,@idestado)
	End try
    Begin Catch
        RAISERROR('Error grave al Enviar el proyecto', 16, 1)
	End Catch
END
GO

---	SERVICIOS-------
Create PROCEDURE sp_ins_serviciorecomendado(
@Servicio int ,
@NombreContacto varchar(100),
@Contacto varchar(100),
@Horario varchar(100), 
@Paginaweb varchar(max),
@ImgSitio varchar (max),
@Ubicacion varchar(max), 
@ImgUbicacion varchar(max)

)
AS 
BEGIN
	Begin try 
		INSERT INTO ServiciosRecomendados(IDSERVICIO,txt_Nombre,NroContacto,Horarios,Sitio,ImgSitio,Ubicacion,ImgUbicacion,Estado) VALUES(@Servicio,@NombreContacto, @Contacto,@Horario, @Paginaweb,@ImgSitio,@Ubicacion,@ImgUbicacion ,1  )

	End try
    Begin Catch
        RAISERROR('Error grave al guardar el usuario', 16, 1)
	End Catch
END

go

---CALENDARIO----
go
Create PROCEDURE sp_Modif_calendario(
@ID bigint,
@Fecha date,
@Hora time ,
@Evento varchar(50),
@Descripcion varchar(max)
) 
AS 
BEGIN
	Begin try 
	UPDATE Calendarios SET  Fecha=@Fecha,Hora=@Hora,Evento=@Evento,Descripcion =@Descripcion,Estado=1 where ID =@ID;   

	End try
    Begin Catch
        RAISERROR('Error grave al guardar el evento', 16, 1)
	End Catch
END

go
Create PROCEDURE sp_ins_evento(
@Fecha date,
@Hora time ,
@Evento varchar(50),
@Descripcion varchar(max)

)
AS 
BEGIN
	Begin try 
		INSERT INTO Calendarios(Fecha,Hora,Evento,Descripcion,Estado) VALUES(@Fecha,@Hora,@Evento,@Descripcion,1)
	End try
    Begin Catch
        RAISERROR('Error grave al guardar el evento', 16, 1)
	End Catch
END
