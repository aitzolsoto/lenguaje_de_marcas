create table medico(
    cod_m int AUTO INCREMENT,
    nombre varchar(25) not null,
    apellido varchar(25) not null,
    fecha_nac date not_null,
    primary key (cod_m));

create table paciente(
    DNI varchar(9),
    nombre varchar(25) not null,
    apellido varchar(25) not null,
    cod_m int,
    primary key (DNI),
    foreign key (cod_m) references medico(cod_m));

create table consultas(
    cod_m int,
    DNI varchar(9),
    fecha_hora date,
    primary key(cod_m, DNI, fecha_hora),
    foreign key(cod_m) references medico(cod_m),
    foreign key(DNI) references paciente(DNI));
