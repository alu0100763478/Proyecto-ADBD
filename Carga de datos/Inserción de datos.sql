-- -----------------------------------------------------
-- Table Empleado
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Empleado (
  DNI VARCHAR(9) NOT NULL,
  Nombre VARCHAR(45) NULL,
  Faltas INT NULL,
  Salario_Base FLOAT NULL,
  Salario_Total FLOAT NULL,
  Horas_Extras INT NULL,
  PRIMARY KEY (DNI));

-- -----------------------------------------------------
-- Table Obra
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Obra (
  idObra INT NOT NULL,
  Fecha_Inicio DATE NULL,
  Fecha_Fin DATE NULL,
  Presupuesto FLOAT NULL,
  Gasto FLOAT NULL,
  Ubicación VARCHAR(45) NULL,
  DNI_Jefe_Obra VARCHAR(9) NULL,
  PRIMARY KEY (idObra),
  CONSTRAINT fk
    FOREIGN KEY (DNI_Jefe_Obra)
    REFERENCES Empleado (DNI)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Table Fases
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Fases (
  idFases INT NOT NULL,
  idObra_F INT NOT NULL,
  Fecha_Inicio DATE NULL,
  Fecha_Fin DATE NULL,
  Cumplida BOOLEAN NULL,
  PRIMARY KEY (idFases, idObra_F),
  CONSTRAINT fk_Fases_1
    FOREIGN KEY (idObra_F)
    REFERENCES Obra (idObra)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Table Tipo_Tareas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tipo_Tareas (
  idTareas INT NOT NULL,
  Nombre VARCHAR(45) NULL,
  PRIMARY KEY (idTareas));

-- -----------------------------------------------------
-- Table Tareas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tareas (
  id INT NOT NULL,
  idObra_T INT NULL,
  idFases_T INT NULL,
  DNI_E VARCHAR(9) NULL,
  idTareas INT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_Tareas_2
    FOREIGN KEY (DNI_E)
    REFERENCES Empleado (DNI)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT fk_Tareas_1
    FOREIGN KEY (idObra_T , idFases_T)
    REFERENCES Fases (idObra_F , idFases)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT fk_Tareas_3
    FOREIGN KEY (idTareas)
    REFERENCES Tipo_Tareas (idTareas)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Table Empelado_Tarea_Cursa
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Empelado_Tarea_Cursa (
  DNI_E VARCHAR(9) NOT NULL,
  idTareas_E INT NOT NULL,
  PRIMARY KEY (DNI_E, idTareas_E),
  CONSTRAINT fk_Empelado_Tarea_Cursa_1
    FOREIGN KEY (DNI_E)
    REFERENCES Empleado (DNI)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT fk_Empelado_Tarea_Cursa_2
    FOREIGN KEY (idTareas_E)
    REFERENCES Tipo_Tareas (idTareas)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Table Material
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Material (
  idMaterial INT NOT NULL,
  Tipo VARCHAR(45) NULL,
  Nombre VARCHAR(45) NULL,
  idObra_M INT NOT NULL,
  PRIMARY KEY (idMaterial,idObra_M),
  CONSTRAINT fk_Material_1
    FOREIGN KEY (idObra_M)
    REFERENCES Obra (idObra)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Table Medidas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Medidas (
  Dia INT NOT NULL,
  Nombre VARCHAR(45) NOT NULL,
  Cumplido BOOLEAN NULL,
  Nota VARCHAR(45) NULL,
  DNI_M VARCHAR(9) NULL,
  PRIMARY KEY (Dia, Nombre),
  CONSTRAINT fk_Medidas_1
    FOREIGN KEY (DNI_M)
    REFERENCES Empleado (DNI)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Table Proveedor
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Proveedor (
  idProveedor INT NOT NULL,
  Nombre VARCHAR(45) NULL,
  Telefono INT NULL,
  Ubicación VARCHAR(45) NULL,
  PRIMARY KEY (idProveedor));

-- -----------------------------------------------------
-- Table Factura
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Factura (
  idFactura INT NOT NULL,
  Importe FLOAT NULL,
  Fecha_Emisión VARCHAR(45) NULL,
  idProveedor_F INT NULL,
  PRIMARY KEY (idFactura),
  CONSTRAINT fk_Factura_1
    FOREIGN KEY (idProveedor_F)
    REFERENCES Proveedor (idProveedor)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Table Genera
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Genera (
  idMaterial_G INT NULL,
  idFactura_G INT NULL,
  idObra_G INT NULL,
  PRIMARY KEY (idMaterial_G,idFactura_G,idObra_G),
  CONSTRAINT fk_Genera_1
    FOREIGN KEY (idFactura_G)
    REFERENCES Factura (idFactura)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT fk_Genera_2
    FOREIGN KEY (idMaterial_G,idObra_G)
    REFERENCES Material (idMaterial,idObra_M)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Data for table Empleado
-- -----------------------------------------------------
INSERT INTO Empleado (DNI, Nombre, Faltas, Salario_Base, Salario_Total, Horas_Extras) VALUES ('78451240A', 'Miguel', 0, 1200, 1250, 1);
INSERT INTO Empleado (DNI, Nombre, Faltas, Salario_Base, Salario_Total, Horas_Extras) VALUES ('48545512X', 'Alexander', 0, 1000, 1200, 4);
INSERT INTO Empleado (DNI, Nombre, Faltas, Salario_Base, Salario_Total, Horas_Extras) VALUES ('45825455D', 'Carlos', 0, 1000, 1250, 5);
INSERT INTO Empleado (DNI, Nombre, Faltas, Salario_Base, Salario_Total, Horas_Extras) VALUES ('56484811F', 'María', 1, 1200, 1200, 1);
INSERT INTO Empleado (DNI, Nombre, Faltas, Salario_Base, Salario_Total, Horas_Extras) VALUES ('12515122X', 'Belén', 0, 1000, 1250, 5);
INSERT INTO Empleado (DNI, Nombre, Faltas, Salario_Base, Salario_Total, Horas_Extras) VALUES ('74845615A', 'Roberto', 2, 1350, 1350, 2);
INSERT INTO Empleado (DNI, Nombre, Faltas, Salario_Base, Salario_Total, Horas_Extras) VALUES ('48554154D', 'Félix', 0, 1250, 1250, 0);
INSERT INTO Empleado (DNI, Nombre, Faltas, Salario_Base, Salario_Total, Horas_Extras) VALUES ('65654899A', 'Luis', 0, 1000, 1000, 0);
INSERT INTO Empleado (DNI, Nombre, Faltas, Salario_Base, Salario_Total, Horas_Extras) VALUES ('56387786Y', 'Jennifer', 0, 1250, 1500, 6);
INSERT INTO Empleado (DNI, Nombre, Faltas, Salario_Base, Salario_Total, Horas_Extras) VALUES ('45758575N', 'Pedro', 0, 1000, 1000, 0);
INSERT INTO Empleado (DNI, Nombre, Faltas, Salario_Base, Salario_Total, Horas_Extras) VALUES ('25567868Q', 'Olga', 0, 1000, 1000, 0);


-- -----------------------------------------------------
-- Data for table Obra
-- -----------------------------------------------------
INSERT INTO Obra (idObra, Fecha_Inicio, Fecha_Fin, Presupuesto, Gasto, Ubicación, DNI_Jefe_Obra) VALUES (00001, '05-01-2015', '05-08-2015', 245000, 244005.05, 'El Tanque', '78451240A');
INSERT INTO Obra (idObra, Fecha_Inicio, Fecha_Fin, Presupuesto, Gasto, Ubicación, DNI_Jefe_Obra) VALUES (00002, '05-05-2015', '05-11-2015', 250005, 250000.10, 'Adeje', '78451240A');
INSERT INTO Obra (idObra, Fecha_Inicio, Fecha_Fin, Presupuesto, Gasto, Ubicación, DNI_Jefe_Obra) VALUES (00003, '05-08-2015', '05-04-2016', 628000, 627045.05, 'Los Cristianos', '78451240A');
INSERT INTO Obra (idObra, Fecha_Inicio, Fecha_Fin, Presupuesto, Gasto, Ubicación, DNI_Jefe_Obra) VALUES (00004, '05-04-2016', '05-08-2016', 582005, 580548.05, 'Adeje', '56387786Y');
INSERT INTO Obra (idObra, Fecha_Inicio, Fecha_Fin, Presupuesto, Gasto, Ubicación, DNI_Jefe_Obra) VALUES (00005, '04-05-2016', '05-08-2016', 250610, 250000.05, 'Garachico', '56387786Y');
INSERT INTO Obra (idObra, Fecha_Inicio, Fecha_Fin, Presupuesto, Gasto, Ubicación, DNI_Jefe_Obra) VALUES (00006, '05-08-2016', '20-05-2018', 905055, 905000.05, 'Arafo', '25567868Q');
INSERT INTO Obra (idObra, Fecha_Inicio, Fecha_Fin, Presupuesto, Gasto, Ubicación, DNI_Jefe_Obra) VALUES (00007, '05-05-2018', '05-12-2018', 256088, 255044.05, 'Fasnia', '74845615A');
INSERT INTO Obra (idObra, Fecha_Inicio, Fecha_Fin, Presupuesto, Gasto, Ubicación, DNI_Jefe_Obra) VALUES (00008, '05-08-2018', '02-05-2019', 562505, 450699.05, 'La Laguna', '74845615A');
INSERT INTO Obra (idObra, Fecha_Inicio, Fecha_Fin, Presupuesto, Gasto, Ubicación, DNI_Jefe_Obra) VALUES (00009, '09-05-2018', '05-08-2019', 250085, 85281.0, 'Adeje', '25567868Q');

-- -----------------------------------------------------
-- Data for table Fases
-- -----------------------------------------------------
INSERT INTO Fases (idFases, idObra_F, Fecha_Inicio, Fecha_Fin, Cumplida) VALUES (00001, 00001, '05-01-2015', '02-03-2015', TRUE);
INSERT INTO Fases (idFases, idObra_F, Fecha_Inicio, Fecha_Fin, Cumplida) VALUES (00002, 00001, '03-03-2015', '04-05-2015', TRUE);
INSERT INTO Fases (idFases, idObra_F, Fecha_Inicio, Fecha_Fin, Cumplida) VALUES (00003, 00001, '05-05-2015', '05-08-2015', TRUE);
INSERT INTO Fases (idFases, idObra_F, Fecha_Inicio, Fecha_Fin, Cumplida) VALUES (00001, 00002, '05-05-2015', '07-07-2015', TRUE);
INSERT INTO Fases (idFases, idObra_F, Fecha_Inicio, Fecha_Fin, Cumplida) VALUES (00002, 00002, '08-07-2015', '08-10-2015', TRUE);
INSERT INTO Fases (idFases, idObra_F, Fecha_Inicio, Fecha_Fin, Cumplida) VALUES (00003, 00002, '09-10-2015', '05-11-2015', TRUE);
INSERT INTO Fases (idFases, idObra_F, Fecha_Inicio, Fecha_Fin, Cumplida) VALUES (00001, 00003, '05-08-2015', '15-10-2015', TRUE);
INSERT INTO Fases (idFases, idObra_F, Fecha_Inicio, Fecha_Fin, Cumplida) VALUES (00002, 00003, '16-10-2015', '01-02-2016', FALSE);
INSERT INTO Fases (idFases, idObra_F, Fecha_Inicio, Fecha_Fin, Cumplida) VALUES (00003, 00003, '02-02-2016', '06-03-2016', TRUE);
INSERT INTO Fases (idFases, idObra_F, Fecha_Inicio, Fecha_Fin, Cumplida) VALUES (00004, 00003, '07-04-2016', '05-04-2016', TRUE);
INSERT INTO Fases (idFases, idObra_F, Fecha_Inicio, Fecha_Fin, Cumplida) VALUES (00001, 00004, '05-04-2016', '05-06-2016', TRUE);
INSERT INTO Fases (idFases, idObra_F, Fecha_Inicio, Fecha_Fin, Cumplida) VALUES (00002, 00004, '06-06-2016', '05-08-2016', TRUE);
INSERT INTO Fases (idFases, idObra_F, Fecha_Inicio, Fecha_Fin, Cumplida) VALUES (00001, 00005, '04-05-2016', '06-07-2016', TRUE);
INSERT INTO Fases (idFases, idObra_F, Fecha_Inicio, Fecha_Fin, Cumplida) VALUES (00002, 00005, '07-07-2016', '05-08-2016', TRUE);
INSERT INTO Fases (idFases, idObra_F, Fecha_Inicio, Fecha_Fin, Cumplida) VALUES (00001, 00006, '05-08-2016', '05-11-2016', TRUE);
INSERT INTO Fases (idFases, idObra_F, Fecha_Inicio, Fecha_Fin, Cumplida) VALUES (00002, 00006, '06-11-2016', '05-05-2017', TRUE);
INSERT INTO Fases (idFases, idObra_F, Fecha_Inicio, Fecha_Fin, Cumplida) VALUES (00003, 00006, '06-05-2017', '05-10-2017', TRUE);
INSERT INTO Fases (idFases, idObra_F, Fecha_Inicio, Fecha_Fin, Cumplida) VALUES (00004, 00006, '06-10-2017', '05-03-2018', TRUE);
INSERT INTO Fases (idFases, idObra_F, Fecha_Inicio, Fecha_Fin, Cumplida) VALUES (00005, 00006, '06-03-2018', '20-05-2018', TRUE);
INSERT INTO Fases (idFases, idObra_F, Fecha_Inicio, Fecha_Fin, Cumplida) VALUES (00001, 00007, '05-05-2018', '05-08-2018', FALSE);
INSERT INTO Fases (idFases, idObra_F, Fecha_Inicio, Fecha_Fin, Cumplida) VALUES (00002, 00007, '06-08-2018', '05-12-2018', TRUE);
INSERT INTO Fases (idFases, idObra_F, Fecha_Inicio, Fecha_Fin, Cumplida) VALUES (00001, 00008, '05-08-2018', '05-12-2018', TRUE);
INSERT INTO Fases (idFases, idObra_F, Fecha_Inicio, Fecha_Fin, Cumplida) VALUES (00002, 00008, '06-12-2018', '03-03-2019', FALSE);
INSERT INTO Fases (idFases, idObra_F, Fecha_Inicio, Fecha_Fin, Cumplida) VALUES (00003, 00008, '03-03-2019', '02-05-2019', TRUE);
INSERT INTO Fases (idFases, idObra_F, Fecha_Inicio, Fecha_Fin, Cumplida) VALUES (00001, 00009, '09-05-2018', '09-11-2018', TRUE);
INSERT INTO Fases (idFases, idObra_F, Fecha_Inicio, Fecha_Fin, Cumplida) VALUES (00002, 00009, '10-11-2019', '05-03-2019', FALSE);
INSERT INTO Fases (idFases, idObra_F, Fecha_Inicio, Fecha_Fin, Cumplida) VALUES (00003, 00009, '06-03-2019', '05-08-2019', FALSE);

-- -----------------------------------------------------
-- Data for table Tipo_Tareas
-- -----------------------------------------------------

INSERT INTO Tipo_Tareas (idTareas, Nombre) VALUES (00001, 'ABRIR PAREDES');
INSERT INTO Tipo_Tareas (idTareas, Nombre) VALUES (00002, 'CABLEADO');
INSERT INTO Tipo_Tareas (idTareas, Nombre) VALUES (00003, 'CONSTRUCCIÓN ESTRUCTURA');
INSERT INTO Tipo_Tareas (idTareas, Nombre) VALUES (00004, 'DEMOLICIÓN');
INSERT INTO Tipo_Tareas (idTareas, Nombre) VALUES (00005, 'DEMOLICIÓN DE PAREDES');
INSERT INTO Tipo_Tareas (idTareas, Nombre) VALUES (00006, 'ELIMINACIÓN DE CABLEADO');
INSERT INTO Tipo_Tareas (idTareas, Nombre) VALUES (00007, 'FONTANERÍA');
INSERT INTO Tipo_Tareas (idTareas, Nombre) VALUES (00008, 'INSTALACIÓN ELÉCTRICA');
INSERT INTO Tipo_Tareas (idTareas, Nombre) VALUES (00009, 'OBTENCIÓN DE PERMISOS');
INSERT INTO Tipo_Tareas (idTareas, Nombre) VALUES (00010, 'PINTURA');
INSERT INTO Tipo_Tareas (idTareas, Nombre) VALUES (00011, 'PLANOS');
INSERT INTO Tipo_Tareas (idTareas, Nombre) VALUES (00012, 'PREPARACIÓN DE PAREDES');
INSERT INTO Tipo_Tareas (idTareas, Nombre) VALUES (00013, 'REVESTIMIENTO');
INSERT INTO Tipo_Tareas (idTareas, Nombre) VALUES (00014, 'VALORACIÓN DE CABLEADO');
INSERT INTO Tipo_Tareas (idTareas, Nombre) VALUES (00015, 'VALORACIÓN DE ESTRUCTURA');

-- -----------------------------------------------------
-- Data for table Tareas
-- -----------------------------------------------------
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00034, 00001, 00001, '78451240A', 00001);
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00001, 00001, 00002, '12515122X', 00014);
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00002, 00001, 00002, '25567868Q', 00008);
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00003, 00001, 00003, '45758575N', 00013);
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00003, 00002, 00001, '12515122X', 00015);
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00004, 00002, 00002, '65654899A', 00006);
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00005, 00002, 00002, '48554154D', 00005);
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00006, 00002, 00003, '48545512X', 00002);
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00007, 00003, 00001, '56387786Y', 00011);
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00008, 00003, 00001, '78451240A', 00009);
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00009, 00003, 00002, '56484811F', 00003);
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00010, 00003, 00003, '48545512X', 00002);
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00011, 00003, 00003, '56387786Y', 00007);
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00012, 00003, 00004, '74845615A', 00010);
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00013, 00004, 00001, '48545512X', 00012);
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00014, 00004, 00002, '74845615A', 00010);
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00015, 00005, 00001, '48545512X', 00012);
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00016, 00005, 00002, '65654899A', 00010);
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00017, 00006, 00001, '78451240A', 00009);
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00018, 00006, 00001, '56387786Y', 00011);
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00019, 00006, 00002, '74845615A', 00004);
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00020, 00006, 00002, '56484811F', 00003);
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00021, 00006, 00003, '45825455D', 00002);
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00022, 00006, 00004, '56387786Y', 00007);
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00023, 00006, 00005, '45758575N', 00013);
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00024, 00007, 00001, '45825455D', 00012);
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00025, 00007, 00002, '65654899A', 00010);
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00026, 00008, 00001, '48554154D', 00011);
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00027, 00008, 00001, '78451240A', 00009);
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00028, 00008, 00002, '12515122X', 00003);
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00029, 00008, 00003, '56484811F', 00010);
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00030, 00009, 00001, '12515122X', 00003);
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00031, 00009, 00002, '45758575N', 00007);
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00032, 00009, 00002, '45825455D', 00002);
INSERT INTO Tareas (id, idObra_T, idFases_T, DNI_E, idTareas) VALUES (00033, 00009, 00003, '25567868Q', 00013);

-- -----------------------------------------------------
-- Data for table Empelado_Tarea_Cursa
-- -----------------------------------------------------

INSERT INTO Empelado_Tarea_Cursa (DNI_E, idTareas_E) VALUES ('78451240A', 00001);
INSERT INTO Empelado_Tarea_Cursa (DNI_E, idTareas_E) VALUES ('48545512X', 00002);
INSERT INTO Empelado_Tarea_Cursa (DNI_E, idTareas_E) VALUES ('45825455D', 00002);
INSERT INTO Empelado_Tarea_Cursa (DNI_E, idTareas_E) VALUES ('56484811F', 00003);
INSERT INTO Empelado_Tarea_Cursa (DNI_E, idTareas_E) VALUES ('12515122X', 00003);
INSERT INTO Empelado_Tarea_Cursa (DNI_E, idTareas_E) VALUES ('74845615A', 00004);
INSERT INTO Empelado_Tarea_Cursa (DNI_E, idTareas_E) VALUES ('48554154D', 00005);
INSERT INTO Empelado_Tarea_Cursa (DNI_E, idTareas_E) VALUES ('65654899A', 00006);
INSERT INTO Empelado_Tarea_Cursa (DNI_E, idTareas_E) VALUES ('56387786Y', 00007);
INSERT INTO Empelado_Tarea_Cursa (DNI_E, idTareas_E) VALUES ('45758575N', 00007);
INSERT INTO Empelado_Tarea_Cursa (DNI_E, idTareas_E) VALUES ('25567868Q', 00008);
INSERT INTO Empelado_Tarea_Cursa (DNI_E, idTareas_E) VALUES ('12515122X', 00015);
INSERT INTO Empelado_Tarea_Cursa (DNI_E, idTareas_E) VALUES ('78451240A', 00009);
INSERT INTO Empelado_Tarea_Cursa (DNI_E, idTareas_E) VALUES ('74845615A', 00010);
INSERT INTO Empelado_Tarea_Cursa (DNI_E, idTareas_E) VALUES ('65654899A', 00010);
INSERT INTO Empelado_Tarea_Cursa (DNI_E, idTareas_E) VALUES ('56484811F', 00010);
INSERT INTO Empelado_Tarea_Cursa (DNI_E, idTareas_E) VALUES ('56387786Y', 00011);
INSERT INTO Empelado_Tarea_Cursa (DNI_E, idTareas_E) VALUES ('48554154D', 00011);
INSERT INTO Empelado_Tarea_Cursa (DNI_E, idTareas_E) VALUES ('48545512X', 00012);
INSERT INTO Empelado_Tarea_Cursa (DNI_E, idTareas_E) VALUES ('45825455D', 00012);
INSERT INTO Empelado_Tarea_Cursa (DNI_E, idTareas_E) VALUES ('45758575N', 00013);
INSERT INTO Empelado_Tarea_Cursa (DNI_E, idTareas_E) VALUES ('25567868Q', 00013);
INSERT INTO Empelado_Tarea_Cursa (DNI_E, idTareas_E) VALUES ('12515122X', 00014);

-- -----------------------------------------------------
-- Data for table Material
-- -----------------------------------------------------
INSERT INTO Material (idMaterial, Tipo, Nombre, idObra_M) VALUES (00001, 'Carpintería', 'Madera de Pino', 00001);
INSERT INTO Material (idMaterial, Tipo, Nombre, idObra_M) VALUES (00002, 'Fontanería', 'Tubo 3.0 ', 00001);
INSERT INTO Material (idMaterial, Tipo, Nombre, idObra_M) VALUES (00003, 'Pintura', 'Blanco 500L', 00002);
INSERT INTO Material (idMaterial, Tipo, Nombre, idObra_M) VALUES (00004, 'Cables', 'Rojo 3.3mm', 00001);
INSERT INTO Material (idMaterial, Tipo, Nombre, idObra_M) VALUES (00005, 'Pintura ', 'Celeste 500L', 00003);
INSERT INTO Material (idMaterial, Tipo, Nombre, idObra_M) VALUES (00006, 'Fontanería', 'Tubo 2.0', 00004);
INSERT INTO Material (idMaterial, Tipo, Nombre, idObra_M) VALUES (00007, 'Cables ', 'Negro 3.3mm', 00004);
INSERT INTO Material (idMaterial, Tipo, Nombre, idObra_M) VALUES (00008, 'Cables', 'Blamco 3.2', 00009);
INSERT INTO Material (idMaterial, Tipo, Nombre, idObra_M) VALUES (00009, 'Madera', 'Mixta', 00005);
INSERT INTO Material (idMaterial, Tipo, Nombre, idObra_M) VALUES (00010, 'Revestimiento', 'Pladur', 00006);
INSERT INTO Material (idMaterial, Tipo, Nombre, idObra_M) VALUES (00011, 'Cables', 'Negro 3.3', 00003);

-- -----------------------------------------------------
-- Data for table Medidas
-- -----------------------------------------------------
INSERT INTO Medidas (Dia, Nombre, Cumplido, Nota, DNI_M) VALUES (02-05-2018, 'Cascos ', TRUE, '10', '45825455D');
INSERT INTO Medidas (Dia, Nombre, Cumplido, Nota, DNI_M) VALUES (02-05-2018, 'Equipo', TRUE, '9', '45825455D');
INSERT INTO Medidas (Dia, Nombre, Cumplido, Nota, DNI_M) VALUES (15-05-2018, 'Arnés', TRUE, '9', '45825455D');
INSERT INTO Medidas (Dia, Nombre, Cumplido, Nota, DNI_M) VALUES (15-05-2018, 'Equipo', TRUE, '9', '45825455D');
INSERT INTO Medidas (Dia, Nombre, Cumplido, Nota, DNI_M) VALUES (20-10-2018, 'Mascarillas', TRUE, '8', '56484811F');
INSERT INTO Medidas (Dia, Nombre, Cumplido, Nota, DNI_M) VALUES (30-12-2018, 'Cascos', TRUE, '10', '56484811F');
INSERT INTO Medidas (Dia, Nombre, Cumplido, Nota, DNI_M) VALUES (10-01-2019, 'Arnés', TRUE, '9', '56484811F');

-- -----------------------------------------------------
-- Data for table Proveedor
-- -----------------------------------------------------
INSERT INTO Proveedor (idProveedor, Nombre, Telefono, Ubicación) VALUES (00001, 'Maderas Juan', 635985696, 'Santa Cruz de Tenerife');
INSERT INTO Proveedor (idProveedor, Nombre, Telefono, Ubicación) VALUES (00002, 'Cables y fontanería Nerón', 637989495, 'La Laguna');
INSERT INTO Proveedor (idProveedor, Nombre, Telefono, Ubicación) VALUES (00003, 'Todo carpintería', 922584885, 'La Orotava');
INSERT INTO Proveedor (idProveedor, Nombre, Telefono, Ubicación) VALUES (00004, 'Mundo fontanería', 922545888, 'Santa Cruz de Tenerife');
INSERT INTO Proveedor (idProveedor, Nombre, Telefono, Ubicación) VALUES (00005, 'Cables Diego', 622245654, 'La Laguna');
INSERT INTO Proveedor (idProveedor, Nombre, Telefono, Ubicación) VALUES (00006, 'Pinturas ', 922989898, 'La Laguna');
INSERT INTO Proveedor (idProveedor, Nombre, Telefono, Ubicación) VALUES (00007, 'Distribuidora Julio', 922878787, 'Sants Cruz de Tenerife');

-- -----------------------------------------------------
-- Data for table Factura
-- -----------------------------------------------------
INSERT INTO Factura (idFactura, Importe, Fecha_Emisión, idProveedor_F) VALUES (000001, 250, '05-05-2016', 00001);
INSERT INTO Factura (idFactura, Importe, Fecha_Emisión, idProveedor_F) VALUES (000002, 585.01, '06-05-2016', 00002);
INSERT INTO Factura (idFactura, Importe, Fecha_Emisión, idProveedor_F) VALUES (000003, 548.05, '01-06-2016', 00003);
INSERT INTO Factura (idFactura, Importe, Fecha_Emisión, idProveedor_F) VALUES (000004, 58.50, '01-06-2016', 00001);
INSERT INTO Factura (idFactura, Importe, Fecha_Emisión, idProveedor_F) VALUES (000005, 289.05, '02-06-2016', 00004);
INSERT INTO Factura (idFactura, Importe, Fecha_Emisión, idProveedor_F) VALUES (000006, 5959.03, '05-05-2017', 00007);
INSERT INTO Factura (idFactura, Importe, Fecha_Emisión, idProveedor_F) VALUES (000007, 566.05, '05-09-2017', 00007);
INSERT INTO Factura (idFactura, Importe, Fecha_Emisión, idProveedor_F) VALUES (000008, 859.05, '05-11-2017', 00004);
INSERT INTO Factura (idFactura, Importe, Fecha_Emisión, idProveedor_F) VALUES (000009, 612.05, '05-11-2017', 00001);
INSERT INTO Factura (idFactura, Importe, Fecha_Emisión, idProveedor_F) VALUES (000010, 66.02, '02-12-2017', 00004);
INSERT INTO Factura (idFactura, Importe, Fecha_Emisión, idProveedor_F) VALUES (000011, 965.06, '02-12-2017', 00002);
INSERT INTO Factura (idFactura, Importe, Fecha_Emisión, idProveedor_F) VALUES (000012, 502.22, '02-01-2018', 00003);
INSERT INTO Factura (idFactura, Importe, Fecha_Emisión, idProveedor_F) VALUES (000013, 651.60, '02-02-2018', 00001);
INSERT INTO Factura (idFactura, Importe, Fecha_Emisión, idProveedor_F) VALUES (000014, 94.05, '04-02-2018', 00002);
INSERT INTO Factura (idFactura, Importe, Fecha_Emisión, idProveedor_F) VALUES (000015, 626.66, '02-03-2018', 00005);
INSERT INTO Factura (idFactura, Importe, Fecha_Emisión, idProveedor_F) VALUES (000016, 69.02, '06-04-2018', 00006);
INSERT INTO Factura (idFactura, Importe, Fecha_Emisión, idProveedor_F) VALUES (000017, 94.02, '05-05-2018', 00003);
INSERT INTO Factura (idFactura, Importe, Fecha_Emisión, idProveedor_F) VALUES (000018, 626.06, '06-06-2018', 00001);
INSERT INTO Factura (idFactura, Importe, Fecha_Emisión, idProveedor_F) VALUES (000020, 94.02, '05-08-2018', 00005);

-- -----------------------------------------------------
-- Data for table Genera
-- -----------------------------------------------------
INSERT INTO Genera (idMaterial_G, idFactura_G, idObra_G) VALUES (00001, 000001, 00001);
INSERT INTO Genera (idMaterial_G, idFactura_G, idObra_G) VALUES (00002, 000001, 00001);
INSERT INTO Genera (idMaterial_G, idFactura_G, idObra_G) VALUES (00003, 000002, 00002);
INSERT INTO Genera (idMaterial_G, idFactura_G, idObra_G) VALUES (00007, 000005, 00004);
INSERT INTO Genera (idMaterial_G, idFactura_G, idObra_G) VALUES (00004, 000004, 00001);
INSERT INTO Genera (idMaterial_G, idFactura_G, idObra_G) VALUES (00005, 000008, 00003);
INSERT INTO Genera (idMaterial_G, idFactura_G, idObra_G) VALUES (00006, 000005, 00004);
INSERT INTO Genera (idMaterial_G, idFactura_G, idObra_G) VALUES (00007, 000005, 00004);
INSERT INTO Genera (idMaterial_G, idFactura_G, idObra_G) VALUES (00008, 000020, 00009);
INSERT INTO Genera (idMaterial_G, idFactura_G, idObra_G) VALUES (00010, 000008, 00006);
INSERT INTO Genera (idMaterial_G, idFactura_G, idObra_G) VALUES (00011, 000008, 00003);
