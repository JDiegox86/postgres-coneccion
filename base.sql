create table usuario(
	dni INT primary key,
	nombre VARCHAR(30),
	apellido VARCHAR(30),
	fecha_de_nacimiento DATE,
	correo VARCHAR(35),
	contrasena VARCHAR(35)
);

create table administrador(
	id_administrador INT primary key,
	usuario VARCHAR(15),
	contrasena VARCHAR(15)
);

create table clinica(
	id_clinica INT primary key,
	nombre VARCHAR(60),
	ubicacion VARCHAR(60)
);

create table especialidad (
	id_especialidad INT primary key,
	nombre VARCHAR(50),
	descripcion VARCHAR(60),
	id_clinica INT,
	foreign key (id_clinica) references clinica(id_clinica)
);

create table doctor (
	id_doctor INT primary key,
	nombre VARCHAR(50),
	apellido VARCHAR(50),
	id_especialidad INT,
	id_clinica INT,
	foreign key (id_especialidad) references especialidad(id_especialidad),
	foreign key (id_clinica) references clinica(id_clinica)
);

create table cita (
	id_cita INT primary key,
	dni INT,
	id_clinica INT,
	id_especialidad INT,
	id_doctor INT,
	fecha_hora TIMESTAMP,
	num_atencion INT,
	foreign key (dni) references usuario(dni),
	foreign key (id_clinica) references clinica(id_clinica),
	foreign key (id_especialidad) references especialidad(id_especialidad),
	foreign key (id_doctor) references doctor(id_doctor)
);