-- =====================================
-- 1️⃣ Crear base de datos
-- =====================================
USE master;
GO
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'InmobiliariaDB3')
BEGIN
    ALTER DATABASE InmobiliariaDB3 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE InmobiliariaDB3;
END
GO
CREATE DATABASE InmobiliariaDB3;
GO
USE InmobiliariaDB3;
GO

-- =====================================
-- 2️⃣ Crear tablas
-- =====================================
CREATE TABLE usuarios_inversionistas (
    id_usuario INT PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE,
    correo VARCHAR(100) UNIQUE,
    telefono VARCHAR(20) UNIQUE
);

CREATE TABLE barrios (
    id_barrio INT PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE,
    comuna VARCHAR(100) -- Sin UNIQUE para permitir repeticiones
);

CREATE TABLE propiedades (
    id_propiedad INT PRIMARY KEY,
    tipo_propiedad VARCHAR(50),
    id_barrio INT,
    direccion VARCHAR(150),
    area_m2 FLOAT,
    precio_total BIGINT,
    precio_m2 FLOAT,
    habitaciones INT,
    banos INT,
    parqueaderos INT,
    anio_construccion INT,
    estado_inmueble VARCHAR(50),
    estrato INT,
    disponibilidad VARCHAR(20),
    fecha_publicacion DATE,
    agente VARCHAR(100),
    id_usuario INT,
    FOREIGN KEY (id_barrio) REFERENCES barrios(id_barrio),
    FOREIGN KEY (id_usuario) REFERENCES usuarios_inversionistas(id_usuario)
);

-- =====================================
-- 3️⃣ Datos auxiliares (200 registros cada uno)
-- =====================================

-- Nombres (200 registros únicos)
DECLARE @nombres TABLE (id INT, nombre VARCHAR(100));
INSERT INTO @nombres VALUES
(1, 'Juan David Pérez Gómez'), (2, 'María Fernanda López Rojas'), (3, 'Carlos Andrés Martínez Díaz'),
(4, 'Laura Valentina García Moreno'), (5, 'Diego Alejandro Rodríguez Vargas'), (6, 'Sofía Camila Hernández Castro'),
(7, 'Andrés Felipe Sánchez Torres'), (8, 'Paula Andrea Ramírez Ortiz'), (9, 'Luis Fernando González Pineda'),
(10, 'Ana María Restrepo Salazar'), (11, 'Camilo Ernesto Morales López'), (12, 'Valeria Alejandra Castañeda'),
(13, 'Santiago Restrepo Mejía'), (14, 'Isabella Gómez Quintero'), (15, 'Mateo Vargas Alzate'),
(16, 'Natalia Ospina Cardona'), (17, 'Julián David Montoya Gil'), (18, 'Daniela Marcela Zapata'),
(19, 'Sebastián López Arango'), (20, 'Mariana Zuluaga Valencia'), (21, 'Alejandro Torres Silva'),
(22, 'Carolina Mendoza Rojas'), (23, 'Fernando Castro Díaz'), (24, 'Gabriela López Moreno'),
(25, 'Ricardo Vargas Pérez'), (26, 'Elena Martínez Gómez'), (27, 'Óscar Ramírez Torres'),
(28, 'Patricia Herrera Sánchez'), (29, 'Hugo González Castro'), (30, 'Claudia Ruiz Mendoza'),
(31, 'Javier Díaz López'), (32, 'Lucía Morales Pérez'), (33, 'Miguel Ángel Rojas'),
(34, 'Verónica Silva Torres'), (35, 'Raúl Mendoza Gómez'), (36, 'Adriana Castro Díaz'),
(37, 'Arturo Pérez López'), (38, 'Silvia Gómez Martínez'), (39, 'Guillermo Torres Rojas'),
(40, 'Teresa Sánchez Mendoza'), (41, 'Ernesto Díaz Pérez'), (42, 'Beatriz López Gómez'),
(43, 'Felipe Martínez Torres'), (44, 'Raquel Pérez Díaz'), (45, 'Víctor Gómez López'),
(46, 'Mónica Torres Martínez'), (47, 'Eduardo Díaz Pérez'), (48, 'Inés López Gómez'),
(49, 'Roberto Martínez Torres'), (50, 'Esther Pérez Díaz'), (51, 'Alfonso Gómez López'),
(52, 'Aurora Torres Martínez'), (53, 'Gerardo Díaz Pérez'), (54, 'Concepción López Gómez'),
(55, 'Joaquín Martínez Torres'), (56, 'Pilar Pérez Díaz'), (57, 'Sergio Gómez López'),
(58, 'Rosario Torres Martínez'), (59, 'Agustín Díaz Pérez'), (60, 'Dolores López Gómez'),
(61, 'Jorge Martínez Torres'), (62, 'Emilia Pérez Díaz'), (63, 'Manuel Gómez López'),
(64, 'Luisa Torres Martínez'), (65, 'Francisco Díaz Pérez'), (66, 'Cristina López Gómez'),
(67, 'Antonio Martínez Torres'), (68, 'Ángeles Pérez Díaz'), (69, 'Pedro Gómez López'),
(70, 'Sara Torres Martínez'), (71, 'David Díaz Pérez'), (72, 'Elvira López Gómez'),
(73, 'José Martínez Torres'), (74, 'Margarita Pérez Díaz'), (75, 'Ángel Gómez López'),
(76, 'Rocío Torres Martínez'), (77, 'Rafael Díaz Pérez'), (78, 'Consuelo López Gómez'),
(79, 'Alberto Martínez Torres'), (80, 'Asunción Pérez Díaz'), (81, 'Enrique Gómez López'),
(82, 'Juana Torres Martínez'), (83, 'Gustavo Díaz Pérez'), (84, 'Carmen López Gómez'),
(85, 'Ramón Martínez Torres'), (86, 'Manuela Pérez Díaz'), (87, 'Rolando Gómez López'),
(88, 'Gloria Torres Martínez'), (89, 'Saúl Díaz Pérez'), (90, 'Lorena López Gómez'),
(91, 'Marcos Martínez Torres'), (92, 'Aurelia Pérez Díaz'), (93, 'Héctor Gómez López'),
(94, 'Matilde Torres Martínez'), (95, 'Fabián Díaz Pérez'), (96, 'Celia López Gómez'),
(97, 'Rodrigo Martínez Torres'), (98, 'Rebeca Pérez Díaz'), (99, 'Raúl Gómez López'),
(100, 'Olga Torres Martínez'), (101, 'Octavio Díaz Pérez'), (102, 'Lidia López Gómez'),
(103, 'Federico Martínez Torres'), (104, 'Eugenia Pérez Díaz'), (105, 'Leonardo Gómez López'),
(106, 'Susana Torres Martínez'), (107, 'César Díaz Pérez'), (108, 'Magdalena López Gómez'),
(109, 'Homero Martínez Torres'), (110, 'Ramona Pérez Díaz'), (111, 'Bernardo Gómez López'),
(112, 'Paz Torres Martínez'), (113, 'Ismael Díaz Pérez'), (114, 'Soledad López Gómez'),
(115, 'Jacinto Martínez Torres'), (116, 'Nieves Pérez Díaz'), (117, 'Dario Gómez López'),
(118, 'Almudena Torres Martínez'), (119, 'Ezequiel Díaz Pérez'), (120, 'Purificación López Gómez'),
(121, 'Aristides Martínez Torres'), (122, 'Candelaria Pérez Díaz'), (123, 'Plácido Gómez López'),
(124, 'Esperanza Torres Martínez'), (125, 'Eulogio Díaz Pérez'), (126, 'Hildegarda López Gómez'),
(127, 'Ambrosio Martínez Torres'), (128, 'Eugenia Pérez Díaz'), (129, 'Bonifacio Gómez López'),
(130, 'Rosalía Torres Martínez'), (131, 'Casimiro Díaz Pérez'), (132, 'Filomena López Gómez'),
(133, 'Leandro Martínez Torres'), (134, 'Anunciación Pérez Díaz'), (135, 'Nicolás Gómez López'),
(136, 'Presentación Torres Martínez'), (137, 'Próspero Díaz Pérez'), (138, 'Remedios López Gómez'),
(139, 'Saturnino Martínez Torres'), (140, 'Socorro Pérez Díaz'), (141, 'Teodosio Gómez López'),
(142, 'Trinidad Torres Martínez'), (143, 'Ursicino Díaz Pérez'), (144, 'Venancio López Gómez'),
(145, 'Vicenta Torres Martínez'), (146, 'Ximena Díaz Pérez'), (147, 'Yolanda Gómez López'),
(148, 'Zacarías Torres Martínez'), (149, 'Adela Díaz Pérez'), (150, 'Baldomero López Gómez'),
(151, 'Casilda Torres Martínez'), (152, 'Demetrio Díaz Pérez'), (153, 'Eleuterio López Gómez'),
(154, 'Fabiola Torres Martínez'), (155, 'Gumersindo Díaz Pérez'), (156, 'Hermelinda López Gómez'),
(157, 'Ildefonso Torres Martínez'), (158, 'Jacinta Díaz Pérez'), (159, 'Leocadia López Gómez'),
(160, 'Macario Torres Martínez'), (161, 'Narcisa Díaz Pérez'), (162, 'Ovidio López Gómez'),
(163, 'Pancracio Torres Martínez'), (164, 'Quintina Díaz Pérez'), (165, 'Rogelio López Gómez'),
(166, 'Salomé Torres Martínez'), (167, 'Tadeo Díaz Pérez'), (168, 'Ubaldo López Gómez'),
(169, 'Veneranda Torres Martínez'), (170, 'Wenceslao Díaz Pérez'), (171, 'Yago López Gómez'),
(172, 'Zoe Torres Martínez'), (173, 'Abdón Díaz Pérez'), (174, 'Benedicta López Gómez'),
(175, 'Cirino Torres Martínez'), (176, 'Dorotea Díaz Pérez'), (177, 'Efraín López Gómez'),
(178, 'Fidelia Torres Martínez'), (179, 'Gervasio Díaz Pérez'), (180, 'Honorina López Gómez'),
(181, 'Ignacio Torres Martínez'), (182, 'Jovita Díaz Pérez'), (183, 'Laureano López Gómez'),
(184, 'Melania Torres Martínez'), (185, 'Nazario Díaz Pérez'), (186, 'Obdulia López Gómez'),
(187, 'Pascual Torres Martínez'), (188, 'Riquilda Díaz Pérez'), (189, 'Salvador López Gómez'),
(190, 'Tarsicia Torres Martínez'), (191, 'Ulises Díaz Pérez'), (192, 'Valentina López Gómez'),
(193, 'Wilfrido Torres Martínez'), (194, 'Xavier Díaz Pérez'), (195, 'Yolanda López Gómez'),
(196, 'Zenaida Torres Martínez'), (197, 'Amparo Díaz Pérez'), (198, 'Bartolomé López Gómez'),
(199, 'Catalina Torres Martínez'), (200, 'Dámaso Díaz Pérez');

-- Correos (200 registros únicos)
DECLARE @correos TABLE (id INT, correo VARCHAR(100));
INSERT INTO @correos VALUES
(1, 'juan.perez@gmail.com'), (2, 'maria.lopez@hotmail.com'), (3, 'carlos.martinez@yahoo.com'),
(4, 'laura.garcia@outlook.com'), (5, 'diego.rodriguez@gmail.com'), (6, 'sofia.hernandez@hotmail.com'),
(7, 'andres.sanchez@yahoo.com'), (8, 'paula.ramirez@outlook.com'), (9, 'luis.gonzalez@gmail.com'),
(10, 'ana.restrepo@hotmail.com'), (11, 'camilo.morales@yahoo.com'), (12, 'valeria.castaneda@outlook.com'),
(13, 'santiago.restrepo@gmail.com'), (14, 'isabella.gomez@hotmail.com'), (15, 'mateo.vargas@yahoo.com'),
(16, 'natalia.ospina@outlook.com'), (17, 'julian.montoya@gmail.com'), (18, 'daniela.zapata@hotmail.com'),
(19, 'sebastian.lopez@yahoo.com'), (20, 'mariana.zuluaga@outlook.com'), (21, 'alejandro.torres@gmail.com'),
(22, 'carolina.silva@hotmail.com'), (23, 'fernando.castro@yahoo.com'), (24, 'gabriela.mendoza@outlook.com'),
(25, 'ricardo.rios@gmail.com'), (26, 'elena.moreno@hotmail.com'), (27, 'oscar.vega@yahoo.com'),
(28, 'patricia.diaz@outlook.com'), (29, 'hugo.romero@gmail.com'), (30, 'claudia.nunez@hotmail.com'),
(31, 'javier.ortiz@yahoo.com'), (32, 'lucia.flores@outlook.com'), (33, 'miguel.suarez@gmail.com'),
(34, 'veronica.cruz@hotmail.com'), (35, 'raul.miranda@yahoo.com'), (36, 'adriana.chavez@outlook.com'),
(37, 'arturo.rivera@gmail.com'), (38, 'silvia.vazquez@hotmail.com'), (39, 'guillermo.reyes@yahoo.com'),
(40, 'teresa.medina@outlook.com'), (41, 'ernesto.aguilar@gmail.com'), (42, 'beatriz.leon@hotmail.com'),
(43, 'felipe.molina@yahoo.com'), (44, 'raquel.campos@outlook.com'), (45, 'victor.guerrero@gmail.com'),
(46, 'monica.ibarra@hotmail.com'), (47, 'eduardo.salazar@yahoo.com'), (48, 'ines.vargas@outlook.com'),
(49, 'roberto.delgado@gmail.com'), (50, 'esther.mora@hotmail.com'), (51, 'alfonso.contreras@yahoo.com'),
(52, 'aurora.pacheco@outlook.com'), (53, 'gerardo.santos@gmail.com'), (54, 'concepcion.rojas@hotmail.com'),
(55, 'joaquin.luna@yahoo.com'), (56, 'pilar.navarro@outlook.com'), (57, 'sergio.mendez@gmail.com'),
(58, 'rosario.acosta@hotmail.com'), (59, 'agustin.fuentes@yahoo.com'), (60, 'dolores.herrera@outlook.com'),
(61, 'jorge.cortes@gmail.com'), (62, 'emilia.carrillo@hotmail.com'), (63, 'manuel.dominguez@yahoo.com'),
(64, 'luisa.serrano@outlook.com'), (65, 'francisco.marquez@gmail.com'), (66, 'cristina.rivas@hotmail.com'),
(67, 'antonio.rios@yahoo.com'), (68, 'angeles.gil@outlook.com'), (69, 'pedro.carmona@gmail.com'),
(70, 'sara.ochoa@hotmail.com'), (71, 'david.pineda@yahoo.com'), (72, 'elvira.arias@outlook.com'),
(73, 'jose.escobar@gmail.com'), (74, 'margarita.padilla@hotmail.com'), (75, 'angel.calderon@yahoo.com'),
(76, 'rocio.villa@outlook.com'), (77, 'rafael.soto@gmail.com'), (78, 'consuelo.mejia@hotmail.com'),
(79, 'alberto.camacho@yahoo.com'), (80, 'asuncion.guevara@outlook.com'), (81, 'enrique.valdez@gmail.com'),
(82, 'juana.cabrera@hotmail.com'), (83, 'gustavo.velazquez@yahoo.com'), (84, 'carmen.franco@outlook.com'),
(85, 'ramon.solis@gmail.com'), (86, 'manuela.olivera@hotmail.com'), (87, 'rolando.cervantes@yahoo.com'),
(88, 'gloria.ponce@outlook.com'), (89, 'saul.salinas@gmail.com'), (90, 'lorena.benitez@hotmail.com'),
(91, 'marcos.avila@yahoo.com'), (92, 'aurelia.maldonado@outlook.com'), (93, 'hector.villarreal@gmail.com'),
(94, 'matilde.zamora@hotmail.com'), (95, 'fabian.rosas@yahoo.com'), (96, 'celia.vega@outlook.com'),
(97, 'rodrigo.figueroa@gmail.com'), (98, 'rebeca.sandoval@hotmail.com'), (99, 'raul.quintero@yahoo.com'),
(100, 'olga.cardenas@outlook.com'), (101, 'octavio.arellano@gmail.com'), (102, 'lidia.beltran@hotmail.com'),
(103, 'federico.trejo@yahoo.com'), (104, 'eugenia.galvan@outlook.com'), (105, 'leonardo.valencia@gmail.com'),
(106, 'susana.velasco@hotmail.com'), (107, 'cesar.murillo@yahoo.com'), (108, 'magdalena.espinosa@outlook.com'),
(109, 'homero.gallegos@gmail.com'), (110, 'ramona.duarte@hotmail.com'), (111, 'bernardo.bustos@yahoo.com'),
(112, 'paz.colon@outlook.com'), (113, 'ismael.bernal@gmail.com'), (114, 'soledad.aguirre@hotmail.com'),
(115, 'jacinto.baez@yahoo.com'), (116, 'nieves.rangel@outlook.com'), (117, 'dario.rivero@gmail.com'),
(118, 'almudena.quintana@hotmail.com'), (119, 'ezequiel.segura@yahoo.com'), (120, 'purificacion.mesa@outlook.com'),
(121, 'aristides.montes@gmail.com'), (122, 'candelaria.soria@hotmail.com'), (123, 'placido.delacruz@yahoo.com'),
(124, 'esperanza.miranda@outlook.com'), (125, 'eulogio.cuevas@gmail.com'), (126, 'hildegarda.esquivel@hotmail.com'),
(127, 'ambrosio.zapata@yahoo.com'), (128, 'eugenia.lozano@outlook.com'), (129, 'bonifacio.madrid@gmail.com'),
(130, 'rosalia.escobedo@hotmail.com'), (131, 'casimiro.corona@yahoo.com'), (132, 'filomena.barrera@outlook.com'),
(133, 'leandro.bonilla@gmail.com'), (134, 'anunciacion.saenz@hotmail.com'), (135, 'nicolas.paredes@yahoo.com'),
(136, 'presentacion.brito@outlook.com'), (137, 'prospero.becerra@gmail.com'), (138, 'remedios.alvarado@hotmail.com'),
(139, 'saturnino.villanueva@yahoo.com'), (140, 'socorro.angel@outlook.com'), (141, 'teodosio.tovar@gmail.com'),
(142, 'trinidad.andrade@hotmail.com'), (143, 'ursicino.arroyo@yahoo.com'), (144, 'venancio.casas@outlook.com'),
(145, 'vicenta.castillo@gmail.com'), (146, 'ximena.cisneros@hotmail.com'), (147, 'yolanda.cordero@yahoo.com'),
(148, 'zacarias.correa@outlook.com'), (149, 'adela.covarrubias@gmail.com'), (150, 'baldomero.davila@hotmail.com'),
(151, 'casilda.deleon@yahoo.com'), (152, 'demetrio.duran@outlook.com'), (153, 'eleuterio.feliciano@gmail.com'),
(154, 'fabiola.fernandez@hotmail.com'), (155, 'gumersindo.fuentes@yahoo.com'), (156, 'hermelinda.galindo@outlook.com'),
(157, 'ildefonso.garay@gmail.com'), (158, 'jacinta.guerra@hotmail.com'), (159, 'leocadia.guzman@yahoo.com'),
(160, 'macario.henriquez@outlook.com'), (161, 'narcisa.ibanez@gmail.com'), (162, 'ovidio.jaimes@hotmail.com'),
(163, 'pancracio.lara@yahoo.com'), (164, 'quintina.leal@outlook.com'), (165, 'rogelio.ledezma@gmail.com'),
(166, 'salome.luevano@hotmail.com'), (167, 'tadeo.magana@yahoo.com'), (168, 'ubaldo.marin@outlook.com'),
(169, 'veneranda.mata@gmail.com'), (170, 'wenceslao.mayorga@hotmail.com'), (171, 'yago.mireles@yahoo.com'),
(172, 'zoe.mojica@outlook.com'), (173, 'abdon.montemayor@gmail.com'), (174, 'benedicta.naranjo@hotmail.com'),
(175, 'cirino.oliva@yahoo.com'), (176, 'dorotea.ordonez@outlook.com'), (177, 'efrain.orozco@gmail.com'),
(178, 'fidelia.parra@hotmail.com'), (179, 'gervasio.paz@yahoo.com'), (180, 'honorina.pineda@outlook.com'),
(181, 'ignacio.placencia@gmail.com'), (182, 'jovita.pulido@hotmail.com'), (183, 'laureano.quezada@yahoo.com'),
(184, 'melania.quintanilla@outlook.com'), (185, 'nazario.rendon@gmail.com'), (186, 'obdulia.riojas@hotmail.com'),
(187, 'pascual.roa@yahoo.com'), (188, 'riquilda.rodarte@outlook.com'), (189, 'salvador.roldan@gmail.com'),
(190, 'tarsicia.rosales@hotmail.com'), (191, 'ulises.ruiz@yahoo.com'), (192, 'valentina.saldivar@outlook.com'),
(193, 'wilfrido.samaniego@gmail.com'), (194, 'xavier.sedillo@hotmail.com'), (195, 'yolanda.segovia@yahoo.com'),
(196, 'zenaida.serna@outlook.com'), (197, 'amparo.solis@gmail.com'), (198, 'bartolome.tamayo@hotmail.com'),
(199, 'catalina.tellez@yahoo.com'), (200, 'damaso.terrazas@outlook.com');

-- Teléfonos (200 registros únicos)
DECLARE @telefonos TABLE (id INT, telefono VARCHAR(20));
INSERT INTO @telefonos VALUES
(1, '+573102345678'), (2, '+573112345679'), (3, '+573122345680'), (4, '+573132345681'), (5, '+573142345682'),
(6, '+573152345683'), (7, '+573162345684'), (8, '+573172345685'), (9, '+573182345686'), (10, '+573192345687'),
(11, '+573202345688'), (12, '+573212345689'), (13, '+573222345690'), (14, '+573232345691'), (15, '+573242345692'),
(16, '+573252345693'), (17, '+573262345694'), (18, '+573272345695'), (19, '+573282345696'), (20, '+573292345697'),
(21, '+573302345698'), (22, '+573312345699'), (23, '+573322345700'), (24, '+573332345701'), (25, '+573342345702'),
(26, '+573352345703'), (27, '+573362345704'), (28, '+573372345705'), (29, '+573382345706'), (30, '+573392345707'),
(31, '+573402345708'), (32, '+573412345709'), (33, '+573422345710'), (34, '+573432345711'), (35, '+573442345712'),
(36, '+573452345713'), (37, '+573462345714'), (38, '+573472345715'), (39, '+573482345716'), (40, '+573492345717'),
(41, '+573502345718'), (42, '+573512345719'), (43, '+573522345720'), (44, '+573532345721'), (45, '+573542345722'),
(46, '+573552345723'), (47, '+573562345724'), (48, '+573572345725'), (49, '+573582345726'), (50, '+573592345727'),
(51, '+573602345728'), (52, '+573612345729'), (53, '+573622345730'), (54, '+573632345731'), (55, '+573642345732'),
(56, '+573652345733'), (57, '+573662345734'), (58, '+573672345735'), (59, '+573682345736'), (60, '+573692345737'),
(61, '+573702345738'), (62, '+573712345739'), (63, '+573722345740'), (64, '+573732345741'), (65, '+573742345742'),
(66, '+573752345743'), (67, '+573762345744'), (68, '+573772345745'), (69, '+573782345746'), (70, '+573792345747'),
(71, '+573802345748'), (72, '+573812345749'), (73, '+573822345750'), (74, '+573832345751'), (75, '+573842345752'),
(76, '+573852345753'), (77, '+573862345754'), (78, '+573872345755'), (79, '+573882345756'), (80, '+573892345757'),
(81, '+573902345758'), (82, '+573912345759'), (83, '+573922345760'), (84, '+573932345761'), (85, '+573942345762'),
(86, '+573952345763'), (87, '+573962345764'), (88, '+573972345765'), (89, '+573982345766'), (90, '+573992345767'),
(91, '+574002345768'), (92, '+574012345769'), (93, '+574022345770'), (94, '+574032345771'), (95, '+574042345772'),
(96, '+574052345773'), (97, '+574062345774'), (98, '+574072345775'), (99, '+574082345776'), (100, '+574092345777'),
(101, '+574102345778'), (102, '+574112345779'), (103, '+574122345780'), (104, '+574132345781'), (105, '+574142345782'),
(106, '+574152345783'), (107, '+574162345784'), (108, '+574172345785'), (109, '+574182345786'), (110, '+574192345787'),
(111, '+574202345788'), (112, '+574212345789'), (113, '+574222345790'), (114, '+574232345791'), (115, '+574242345792'),
(116, '+574252345793'), (117, '+574262345794'), (118, '+574272345795'), (119, '+574282345796'), (120, '+574292345797'),
(121, '+574302345798'), (122, '+574312345799'), (123, '+574322345800'), (124, '+574332345801'), (125, '+574342345802'),
(126, '+574352345803'), (127, '+574362345804'), (128, '+574372345805'), (129, '+574382345806'), (130, '+574392345807'),
(131, '+574402345808'), (132, '+574412345809'), (133, '+574422345810'), (134, '+574432345811'), (135, '+574442345812'),
(136, '+574452345813'), (137, '+574462345814'), (138, '+574472345815'), (139, '+574482345816'), (140, '+574492345817'),
(141, '+574502345818'), (142, '+574512345819'), (143, '+574522345820'), (144, '+574532345821'), (145, '+574542345822'),
(146, '+574552345823'), (147, '+574562345824'), (148, '+574572345825'), (149, '+574582345826'), (150, '+574592345827'),
(151, '+574602345828'), (152, '+574612345829'), (153, '+574622345830'), (154, '+574632345831'), (155, '+574642345832'),
(156, '+574652345833'), (157, '+574662345834'), (158, '+574672345835'), (159, '+574682345836'), (160, '+574692345837'),
(161, '+574702345838'), (162, '+574712345839'), (163, '+574722345840'), (164, '+574732345841'), (165, '+574742345842'),
(166, '+574752345843'), (167, '+574762345844'), (168, '+574772345845'), (169, '+574782345846'), (170, '+574792345847'),
(171, '+574802345848'), (172, '+574812345849'), (173, '+574822345850'), (174, '+574832345851'), (175, '+574842345852'),
(176, '+574852345853'), (177, '+574862345854'), (178, '+574872345855'), (179, '+574882345856'), (180, '+574892345857'),
(181, '+574902345858'), (182, '+574912345859'), (183, '+574922345860'), (184, '+574932345861'), (185, '+574942345862'),
(186, '+574952345863'), (187, '+574962345864'), (188, '+574972345865'), (189, '+574982345866'), (190, '+574992345867'),
(191, '+575002345868'), (192, '+575012345869'), (193, '+575022345870'), (194, '+575032345871'), (195, '+575042345872'),
(196, '+575052345873'), (197, '+575062345874'), (198, '+575072345875'), (199, '+575082345876'), (200, '+575092345877');

-- Barrios (200 registros, nombres únicos)
DECLARE @barrios_lista TABLE (id INT, nombre VARCHAR(100));
INSERT INTO @barrios_lista VALUES
(1, 'El Poblado 1'), (2, 'Laureles 1'), (3, 'Envigado 1'), (4, 'Belén 1'), (5, 'Castilla 1'), (6, 'Manrique 1'),
(7, 'Robledo 1'), (8, 'Buenos Aires 1'), (9, 'La América 1'), (10, 'San Javier 1'), (11, 'Aranjuez 1'), (12, 'Santa Cruz 1'),
(13, 'Popular 1'), (14, 'El Chagualo 1'), (15, 'La Candelaria 1'), (16, 'Boston 1'), (17, 'San Diego 1'), (18, 'Guayabal 1'),
(19, 'Sabaneta 1'), (20, 'Itagüí 1'), (21, 'El Poblado 2'), (22, 'Laureles 2'), (23, 'Envigado 2'), (24, 'Belén 2'),
(25, 'Castilla 2'), (26, 'Manrique 2'), (27, 'Robledo 2'), (28, 'Buenos Aires 2'), (29, 'La América 2'), (30, 'San Javier 2'),
(31, 'Aranjuez 2'), (32, 'Santa Cruz 2'), (33, 'Popular 2'), (34, 'El Chagualo 2'), (35, 'La Candelaria 2'), (36, 'Boston 2'),
(37, 'San Diego 2'), (38, 'Guayabal 2'), (39, 'Sabaneta 2'), (40, 'Itagüí 2'), (41, 'El Poblado 3'), (42, 'Laureles 3'),
(43, 'Envigado 3'), (44, 'Belén 3'), (45, 'Castilla 3'), (46, 'Manrique 3'), (47, 'Robledo 3'), (48, 'Buenos Aires 3'),
(49, 'La América 3'), (50, 'San Javier 3'), (51, 'Aranjuez 3'), (52, 'Santa Cruz 3'), (53, 'Popular 3'), (54, 'El Chagualo 3'),
(55, 'La Candelaria 3'), (56, 'Boston 3'), (57, 'San Diego 3'), (58, 'Guayabal 3'), (59, 'Sabaneta 3'), (60, 'Itagüí 3'),
(61, 'El Poblado 4'), (62, 'Laureles 4'), (63, 'Envigado 4'), (64, 'Belén 4'), (65, 'Castilla 4'), (66, 'Manrique 4'),
(67, 'Robledo 4'), (68, 'Buenos Aires 4'), (69, 'La América 4'), (70, 'San Javier 4'), (71, 'Aranjuez 4'), (72, 'Santa Cruz 4'),
(73, 'Popular 4'), (74, 'El Chagualo 4'), (75, 'La Candelaria 4'), (76, 'Boston 4'), (77, 'San Diego 4'), (78, 'Guayabal 4'),
(79, 'Sabaneta 4'), (80, 'Itagüí 4'), (81, 'El Poblado 5'), (82, 'Laureles 5'), (83, 'Envigado 5'), (84, 'Belén 5'),
(85, 'Castilla 5'), (86, 'Manrique 5'), (87, 'Robledo 5'), (88, 'Buenos Aires 5'), (89, 'La América 5'), (90, 'San Javier 5'),
(91, 'Aranjuez 5'), (92, 'Santa Cruz 5'), (93, 'Popular 5'), (94, 'El Chagualo 5'), (95, 'La Candelaria 5'), (96, 'Boston 5'),
(97, 'San Diego 5'), (98, 'Guayabal 5'), (99, 'Sabaneta 5'), (100, 'Itagüí 5'), (101, 'El Poblado 6'), (102, 'Laureles 6'),
(103, 'Envigado 6'), (104, 'Belén 6'), (105, 'Castilla 6'), (106, 'Manrique 6'), (107, 'Robledo 6'), (108, 'Buenos Aires 6'),
(109, 'La América 6'), (110, 'San Javier 6'), (111, 'Aranjuez 6'), (112, 'Santa Cruz 6'), (113, 'Popular 6'), (114, 'El Chagualo 6'),
(115, 'La Candelaria 6'), (116, 'Boston 6'), (117, 'San Diego 6'), (118, 'Guayabal 6'), (119, 'Sabaneta 6'), (120, 'Itagüí 6'),
(121, 'El Poblado 7'), (122, 'Laureles 7'), (123, 'Envigado 7'), (124, 'Belén 7'), (125, 'Castilla 7'), (126, 'Manrique 7'),
(127, 'Robledo 7'), (128, 'Buenos Aires 7'), (129, 'La América 7'), (130, 'San Javier 7'), (131, 'Aranjuez 7'), (132, 'Santa Cruz 7'),
(133, 'Popular 7'), (134, 'El Chagualo 7'), (135, 'La Candelaria 7'), (136, 'Boston 7'), (137, 'San Diego 7'), (138, 'Guayabal 7'),
(139, 'Sabaneta 7'), (140, 'Itagüí 7'), (141, 'El Poblado 8'), (142, 'Laureles 8'), (143, 'Envigado 8'), (144, 'Belén 8'),
(145, 'Castilla 8'), (146, 'Manrique 8'), (147, 'Robledo 8'), (148, 'Buenos Aires 8'), (149, 'La América 8'), (150, 'San Javier 8'),
(151, 'Aranjuez 8'), (152, 'Santa Cruz 8'), (153, 'Popular 8'), (154, 'El Chagualo 8'), (155, 'La Candelaria 8'), (156, 'Boston 8'),
(157, 'San Diego 8'), (158, 'Guayabal 8'), (159, 'Sabaneta 8'), (160, 'Itagüí 8'), (161, 'El Poblado 9'), (162, 'Laureles 9'),
(163, 'Envigado 9'), (164, 'Belén 9'), (165, 'Castilla 9'), (166, 'Manrique 9'), (167, 'Robledo 9'), (168, 'Buenos Aires 9'),
(169, 'La América 9'), (170, 'San Javier 9'), (171, 'Aranjuez 9'), (172, 'Santa Cruz 9'), (173, 'Popular 9'), (174, 'El Chagualo 9'),
(175, 'La Candelaria 9'), (176, 'Boston 9'), (177, 'San Diego 9'), (178, 'Guayabal 9'), (179, 'Sabaneta 9'), (180, 'Itagüí 9'),
(181, 'El Poblado 10'), (182, 'Laureles 10'), (183, 'Envigado 10'), (184, 'Belén 10'), (185, 'Castilla 10'), (186, 'Manrique 10'),
(187, 'Robledo 10'), (188, 'Buenos Aires 10'), (189, 'La América 10'), (190, 'San Javier 10'), (191, 'Aranjuez 10'), (192, 'Santa Cruz 10'),
(193, 'Popular 10'), (194, 'El Chagualo 10'), (195, 'La Candelaria 10'), (196, 'Boston 10'), (197, 'San Diego 10'), (198, 'Guayabal 10'),
(199, 'Sabaneta 10'), (200, 'Itagüí 10');

-- Comunas (200 registros, permite repeticiones)
DECLARE @comunas TABLE (id INT, comuna VARCHAR(100));
INSERT INTO @comunas VALUES
(1, 'Comuna 14 - El Poblado'), (2, 'Comuna 11 - Laureles-Estadio'), (3, 'Envigado'), (4, 'Comuna 16 - Belén'),
(5, 'Comuna 5 - Castilla'), (6, 'Comuna 3 - Manrique'), (7, 'Comuna 7 - Robledo'), (8, 'Comuna 9 - Buenos Aires'),
(9, 'Comuna 12 - La América'), (10, 'Comuna 13 - San Javier'), (11, 'Comuna 4 - Aranjuez'), (12, 'Comuna 2 - Santa Cruz'),
(13, 'Comuna 1 - Popular'), (14, 'Comuna 10 - La Candelaria'), (15, 'Comuna 10 - La Candelaria'), (16, 'Comuna 10 - La Candelaria'),
(17, 'Comuna 10 - La Candelaria'), (18, 'Comuna 15 - Guayabal'), (19, 'Sabaneta'), (20, 'Itagüí'),
(21, 'Comuna 14 - El Poblado'), (22, 'Comuna 11 - Laureles-Estadio'), (23, 'Envigado'), (24, 'Comuna 16 - Belén'),
(25, 'Comuna 5 - Castilla'), (26, 'Comuna 3 - Manrique'), (27, 'Comuna 7 - Robledo'), (28, 'Comuna 9 - Buenos Aires'),
(29, 'Comuna 12 - La América'), (30, 'Comuna 13 - San Javier'), (31, 'Comuna 4 - Aranjuez'), (32, 'Comuna 2 - Santa Cruz'),
(33, 'Comuna 1 - Popular'), (34, 'Comuna 10 - La Candelaria'), (35, 'Comuna 10 - La Candelaria'), (36, 'Comuna 10 - La Candelaria'),
(37, 'Comuna 10 - La Candelaria'), (38, 'Comuna 15 - Guayabal'), (39, 'Sabaneta'), (40, 'Itagüí'),
(41, 'Comuna 14 - El Poblado'), (42, 'Comuna 11 - Laureles-Estadio'), (43, 'Envigado'), (44, 'Comuna 16 - Belén'),
(45, 'Comuna 5 - Castilla'), (46, 'Comuna 3 - Manrique'), (47, 'Comuna 7 - Robledo'), (48, 'Comuna 9 - Buenos Aires'),
(49, 'Comuna 12 - La América'), (50, 'Comuna 13 - San Javier'), (51, 'Comuna 4 - Aranjuez'), (52, 'Comuna 2 - Santa Cruz'),
(53, 'Comuna 1 - Popular'), (54, 'Comuna 10 - La Candelaria'), (55, 'Comuna 10 - La Candelaria'), (56, 'Comuna 10 - La Candelaria'),
(57, 'Comuna 10 - La Candelaria'), (58, 'Comuna 15 - Guayabal'), (59, 'Sabaneta'), (60, 'Itagüí'),
(61, 'Comuna 14 - El Poblado'), (62, 'Comuna 11 - Laureles-Estadio'), (63, 'Envigado'), (64, 'Comuna 16 - Belén'),
(65, 'Comuna 5 - Castilla'), (66, 'Comuna 3 - Manrique'), (67, 'Comuna 7 - Robledo'), (68, 'Comuna 9 - Buenos Aires'),
(69, 'Comuna 12 - La América'), (70, 'Comuna 13 - San Javier'), (71, 'Comuna 4 - Aranjuez'), (72, 'Comuna 2 - Santa Cruz'),
(73, 'Comuna 1 - Popular'), (74, 'Comuna 10 - La Candelaria'), (75, 'Comuna 10 - La Candelaria'), (76, 'Comuna 10 - La Candelaria'),
(77, 'Comuna 10 - La Candelaria'), (78, 'Comuna 15 - Guayabal'), (79, 'Sabaneta'), (80, 'Itagüí'),
(81, 'Comuna 14 - El Poblado'), (82, 'Comuna 11 - Laureles-Estadio'), (83, 'Envigado'), (84, 'Comuna 16 - Belén'),
(85, 'Comuna 5 - Castilla'), (86, 'Comuna 3 - Manrique'), (87, 'Comuna 7 - Robledo'), (88, 'Comuna 9 - Buenos Aires'),
(89, 'Comuna 12 - La América'), (90, 'Comuna 13 - San Javier'), (91, 'Comuna 4 - Aranjuez'), (92, 'Comuna 2 - Santa Cruz'),
(93, 'Comuna 1 - Popular'), (94, 'Comuna 10 - La Candelaria'), (95, 'Comuna 10 - La Candelaria'), (96, 'Comuna 10 - La Candelaria'),
(97, 'Comuna 10 - La Candelaria'), (98, 'Comuna 15 - Guayabal'), (99, 'Sabaneta'), (100, 'Itagüí'),
(101, 'Comuna 14 - El Poblado'), (102, 'Comuna 11 - Laureles-Estadio'), (103, 'Envigado'), (104, 'Comuna 16 - Belén'),
(105, 'Comuna 5 - Castilla'), (106, 'Comuna 3 - Manrique'), (107, 'Comuna 7 - Robledo'), (108, 'Comuna 9 - Buenos Aires'),
(109, 'Comuna 12 - La América'), (110, 'Comuna 13 - San Javier'), (111, 'Comuna 4 - Aranjuez'), (112, 'Comuna 2 - Santa Cruz'),
(113, 'Comuna 1 - Popular'), (114, 'Comuna 10 - La Candelaria'), (115, 'Comuna 10 - La Candelaria'), (116, 'Comuna 10 - La Candelaria'),
(117, 'Comuna 10 - La Candelaria'), (118, 'Comuna 15 - Guayabal'), (119, 'Sabaneta'), (120, 'Itagüí'),
(121, 'Comuna 14 - El Poblado'), (122, 'Comuna 11 - Laureles-Estadio'), (123, 'Envigado'), (124, 'Comuna 16 - Belén'),
(125, 'Comuna 5 - Castilla'), (126, 'Comuna 3 - Manrique'), (127, 'Comuna 7 - Robledo'), (128, 'Comuna 9 - Buenos Aires'),
(129, 'Comuna 12 - La América'), (130, 'Comuna 13 - San Javier'), (131, 'Comuna 4 - Aranjuez'), (132, 'Comuna 2 - Santa Cruz'),
(133, 'Comuna 1 - Popular'), (134, 'Comuna 10 - La Candelaria'), (135, 'Comuna 10 - La Candelaria'), (136, 'Comuna 10 - La Candelaria'),
(137, 'Comuna 10 - La Candelaria'), (138, 'Comuna 15 - Guayabal'), (139, 'Sabaneta'), (140, 'Itagüí'),
(141, 'Comuna 14 - El Poblado'), (142, 'Comuna 11 - Laureles-Estadio'), (143, 'Envigado'), (144, 'Comuna 16 - Belén'),
(145, 'Comuna 5 - Castilla'), (146, 'Comuna 3 - Manrique'), (147, 'Comuna 7 - Robledo'), (148, 'Comuna 9 - Buenos Aires'),
(149, 'Comuna 12 - La América'), (150, 'Comuna 13 - San Javier'), (151, 'Comuna 4 - Aranjuez'), (152, 'Comuna 2 - Santa Cruz'),
(153, 'Comuna 1 - Popular'), (154, 'Comuna 10 - La Candelaria'), (155, 'Comuna 10 - La Candelaria'), (156, 'Comuna 10 - La Candelaria'),
(157, 'Comuna 10 - La Candelaria'), (158, 'Comuna 15 - Guayabal'), (159, 'Sabaneta'), (160, 'Itagüí'),
(161, 'Comuna 14 - El Poblado'), (162, 'Comuna 11 - Laureles-Estadio'), (163, 'Envigado'), (164, 'Comuna 16 - Belén'),
(165, 'Comuna 5 - Castilla'), (166, 'Comuna 3 - Manrique'), (167, 'Comuna 7 - Robledo'), (168, 'Comuna 9 - Buenos Aires'),
(169, 'Comuna 12 - La América'), (170, 'Comuna 13 - San Javier'), (171, 'Comuna 4 - Aranjuez'), (172, 'Comuna 2 - Santa Cruz'),
(173, 'Comuna 1 - Popular'), (174, 'Comuna 10 - La Candelaria'), (175, 'Comuna 10 - La Candelaria'), (176, 'Comuna 10 - La Candelaria'),
(177, 'Comuna 10 - La Candelaria'), (178, 'Comuna 15 - Guayabal'), (179, 'Sabaneta'), (180, 'Itagüí'),
(181, 'Comuna 14 - El Poblado'), (182, 'Comuna 11 - Laureles-Estadio'), (183, 'Envigado'), (184, 'Comuna 16 - Belén'),
(185, 'Comuna 5 - Castilla'), (186, 'Comuna 3 - Manrique'), (187, 'Comuna 7 - Robledo'), (188, 'Comuna 9 - Buenos Aires'),
(189, 'Comuna 12 - La América'), (190, 'Comuna 13 - San Javier'), (191, 'Comuna 4 - Aranjuez'), (192, 'Comuna 2 - Santa Cruz'),
(193, 'Comuna 1 - Popular'), (194, 'Comuna 10 - La Candelaria'), (195, 'Comuna 10 - La Candelaria'), (196, 'Comuna 10 - La Candelaria'),
(197, 'Comuna 10 - La Candelaria'), (198, 'Comuna 15 - Guayabal'), (199, 'Sabaneta'), (200, 'Itagüí');

-- Agentes (200 registros, permite repeticiones)
DECLARE @agentes TABLE (id INT, agente VARCHAR(100));
INSERT INTO @agentes VALUES
(1, 'Alejandro Gómez Restrepo'), (2, 'Carolina Mejía Ospina'), (3, 'Felipe Vargas Montoya'), (4, 'Tatiana Zuluaga López'),
(5, 'Ricardo Salazar Pineda'), (6, 'Mónica Castañeda Rojas'), (7, 'Esteban Ramírez Torres'), (8, 'Catalina Hernández Díaz'),
(9, 'Javier Morales Quintero'), (10, 'Sandra Ortiz García'), (11, 'Óscar Pérez Cardona'), (12, 'Patricia Valencia Alzate'),
(13, 'Eduardo Sánchez Castro'), (14, 'Clara Zapata Moreno'), (15, 'Manuel López Arango'), (16, 'Verónica Gil Vargas'),
(17, 'Héctor Montoya Salazar'), (18, 'Liliana Restrepo Gómez'), (19, 'Germán Torres Pineda'), (20, 'Adriana Mejía Ospina'),
(21, 'Alejandro Gómez Restrepo'), (22, 'Carolina Mejía Ospina'), (23, 'Felipe Vargas Montoya'), (24, 'Tatiana Zuluaga López'),
(25, 'Ricardo Salazar Pineda'), (26, 'Mónica Castañeda Rojas'), (27, 'Esteban Ramírez Torres'), (28, 'Catalina Hernández Díaz'),
(29, 'Javier Morales Quintero'), (30, 'Sandra Ortiz García'), (31, 'Óscar Pérez Cardona'), (32, 'Patricia Valencia Alzate'),
(33, 'Eduardo Sánchez Castro'), (34, 'Clara Zapata Moreno'), (35, 'Manuel López Arango'), (36, 'Verónica Gil Vargas'),
(37, 'Héctor Montoya Salazar'), (38, 'Liliana Restrepo Gómez'), (39, 'Germán Torres Pineda'), (40, 'Adriana Mejía Ospina'),
(41, 'Alejandro Gómez Restrepo'), (42, 'Carolina Mejía Ospina'), (43, 'Felipe Vargas Montoya'), (44, 'Tatiana Zuluaga López'),
(45, 'Ricardo Salazar Pineda'), (46, 'Mónica Castañeda Rojas'), (47, 'Esteban Ramírez Torres'), (48, 'Catalina Hernández Díaz'),
(49, 'Javier Morales Quintero'), (50, 'Sandra Ortiz García'), (51, 'Óscar Pérez Cardona'), (52, 'Patricia Valencia Alzate'),
(53, 'Eduardo Sánchez Castro'), (54, 'Clara Zapata Moreno'), (55, 'Manuel López Arango'), (56, 'Verónica Gil Vargas'),
(57, 'Héctor Montoya Salazar'), (58, 'Liliana Restrepo Gómez'), (59, 'Germán Torres Pineda'), (60, 'Adriana Mejía Ospina'),
(61, 'Alejandro Gómez Restrepo'), (62, 'Carolina Mejía Ospina'), (63, 'Felipe Vargas Montoya'), (64, 'Tatiana Zuluaga López'),
(65, 'Ricardo Salazar Pineda'), (66, 'Mónica Castañeda Rojas'), (67, 'Esteban Ramírez Torres'), (68, 'Catalina Hernández Díaz'),
(69, 'Javier Morales Quintero'), (70, 'Sandra Ortiz García'), (71, 'Óscar Pérez Cardona'), (72, 'Patricia Valencia Alzate'),
(73, 'Eduardo Sánchez Castro'), (74, 'Clara Zapata Moreno'), (75, 'Manuel López Arango'), (76, 'Verónica Gil Vargas'),
(77, 'Héctor Montoya Salazar'), (78, 'Liliana Restrepo Gómez'), (79, 'Germán Torres Pineda'), (80, 'Adriana Mejía Ospina'),
(81, 'Alejandro Gómez Restrepo'), (82, 'Carolina Mejía Ospina'), (83, 'Felipe Vargas Montoya'), (84, 'Tatiana Zuluaga López'),
(85, 'Ricardo Salazar Pineda'), (86, 'Mónica Castañeda Rojas'), (87, 'Esteban Ramírez Torres'), (88, 'Catalina Hernández Díaz'),
(89, 'Javier Morales Quintero'), (90, 'Sandra Ortiz García'), (91, 'Óscar Pérez Cardona'), (92, 'Patricia Valencia Alzate'),
(93, 'Eduardo Sánchez Castro'), (94, 'Clara Zapata Moreno'), (95, 'Manuel López Arango'), (96, 'Verónica Gil Vargas'),
(97, 'Héctor Montoya Salazar'), (98, 'Liliana Restrepo Gómez'), (99, 'Germán Torres Pineda'), (100, 'Adriana Mejía Ospina'),
(101, 'Alejandro Gómez Restrepo'), (102, 'Carolina Mejía Ospina'), (103, 'Felipe Vargas Montoya'), (104, 'Tatiana Zuluaga López'),
(105, 'Ricardo Salazar Pineda'), (106, 'Mónica Castañeda Rojas'), (107, 'Esteban Ramírez Torres'), (108, 'Catalina Hernández Díaz'),
(109, 'Javier Morales Quintero'), (110, 'Sandra Ortiz García'), (111, 'Óscar Pérez Cardona'), (112, 'Patricia Valencia Alzate'),
(113, 'Eduardo Sánchez Castro'), (114, 'Clara Zapata Moreno'), (115, 'Manuel López Arango'), (116, 'Verónica Gil Vargas'),
(117, 'Héctor Montoya Salazar'), (118, 'Liliana Restrepo Gómez'), (119, 'Germán Torres Pineda'), (120, 'Adriana Mejía Ospina'),
(121, 'Alejandro Gómez Restrepo'), (122, 'Carolina Mejía Ospina'), (123, 'Felipe Vargas Montoya'), (124, 'Tatiana Zuluaga López'),
(125, 'Ricardo Salazar Pineda'), (126, 'Mónica Castañeda Rojas'), (127, 'Esteban Ramírez Torres'), (128, 'Catalina Hernández Díaz'),
(129, 'Javier Morales Quintero'), (130, 'Sandra Ortiz García'), (131, 'Óscar Pérez Cardona'), (132, 'Patricia Valencia Alzate'),
(133, 'Eduardo Sánchez Castro'), (134, 'Clara Zapata Moreno'), (135, 'Manuel López Arango'), (136, 'Verónica Gil Vargas'),
(137, 'Héctor Montoya Salazar'), (138, 'Liliana Restrepo Gómez'), (139, 'Germán Torres Pineda'), (140, 'Adriana Mejía Ospina'),
(141, 'Alejandro Gómez Restrepo'), (142, 'Carolina Mejía Ospina'), (143, 'Felipe Vargas Montoya'), (144, 'Tatiana Zuluaga López'),
(145, 'Ricardo Salazar Pineda'), (146, 'Mónica Castañeda Rojas'), (147, 'Esteban Ramírez Torres'), (148, 'Catalina Hernández Díaz'),
(149, 'Javier Morales Quintero'), (150, 'Sandra Ortiz García'), (151, 'Óscar Pérez Cardona'), (152, 'Patricia Valencia Alzate'),
(153, 'Eduardo Sánchez Castro'), (154, 'Clara Zapata Moreno'), (155, 'Manuel López Arango'), (156, 'Verónica Gil Vargas'),
(157, 'Héctor Montoya Salazar'), (158, 'Liliana Restrepo Gómez'), (159, 'Germán Torres Pineda'), (160, 'Adriana Mejía Ospina'),
(161, 'Alejandro Gómez Restrepo'), (162, 'Carolina Mejía Ospina'), (163, 'Felipe Vargas Montoya'), (164, 'Tatiana Zuluaga López'),
(165, 'Ricardo Salazar Pineda'), (166, 'Mónica Castañeda Rojas'), (167, 'Esteban Ramírez Torres'), (168, 'Catalina Hernández Díaz'),
(169, 'Javier Morales Quintero'), (170, 'Sandra Ortiz García'), (171, 'Óscar Pérez Cardona'), (172, 'Patricia Valencia Alzate'),
(173, 'Eduardo Sánchez Castro'), (174, 'Clara Zapata Moreno'), (175, 'Manuel López Arango'), (176, 'Verónica Gil Vargas'),
(177, 'Héctor Montoya Salazar'), (178, 'Liliana Restrepo Gómez'), (179, 'Germán Torres Pineda'), (180, 'Adriana Mejía Ospina'),
(181, 'Alejandro Gómez Restrepo'), (182, 'Carolina Mejía Ospina'), (183, 'Felipe Vargas Montoya'), (184, 'Tatiana Zuluaga López'),
(185, 'Ricardo Salazar Pineda'), (186, 'Mónica Castañeda Rojas'), (187, 'Esteban Ramírez Torres'), (188, 'Catalina Hernández Díaz'),
(189, 'Javier Morales Quintero'), (190, 'Sandra Ortiz García'), (191, 'Óscar Pérez Cardona'), (192, 'Patricia Valencia Alzate'),
(193, 'Eduardo Sánchez Castro'), (194, 'Clara Zapata Moreno'), (195, 'Manuel López Arango'), (196, 'Verónica Gil Vargas'),
(197, 'Héctor Montoya Salazar'), (198, 'Liliana Restrepo Gómez'), (199, 'Germán Torres Pineda'), (200, 'Adriana Mejía Ospina');

-- =====================================
-- 4️⃣ Insertar 200 usuarios únicos
-- =====================================
DECLARE @i INT = 1;
WHILE @i <= 200
BEGIN
    INSERT INTO usuarios_inversionistas (id_usuario, nombre, correo, telefono)
    SELECT
        @i,
        n.nombre,
        c.correo,
        t.telefono
    FROM @nombres n
    JOIN @correos c ON c.id = n.id
    JOIN @telefonos t ON t.id = n.id
    WHERE n.id = @i;

    SET @i = @i + 1;
END;

-- =====================================
-- 5️⃣ Insertar 200 barrios
-- =====================================
INSERT INTO barrios (id_barrio, nombre, comuna)
SELECT b.id, b.nombre, c.comuna
FROM @barrios_lista b
JOIN @comunas c ON c.id = b.id
WHERE b.id <= 200;

-- =====================================
-- 6️⃣ Insertar 200 propiedades (con estratos realistas y sesgados hacia altos para áreas premium/emergentes de Medellín)
-- =====================================
SET @i = 1;
WHILE @i <= 200
BEGIN
    DECLARE @barrio_id INT = ((@i - 1) % 200) + 1;
    DECLARE @barrio_nombre VARCHAR(100);
    SELECT @barrio_nombre = nombre FROM @barrios_lista WHERE id = @barrio_id;

    DECLARE @estrato INT = CASE
        WHEN @barrio_nombre LIKE 'Popular%' OR @barrio_nombre LIKE 'Santa Cruz%' OR @barrio_nombre LIKE 'Aranjuez%' THEN 1 + ((@i - 1) % 2)  -- 1-2 (bajos)
        WHEN @barrio_nombre LIKE 'Castilla%' OR @barrio_nombre LIKE 'Manrique%' OR @barrio_nombre LIKE 'Robledo%' OR @barrio_nombre LIKE 'San Javier%' THEN 2 + ((@i - 1) % 2)  -- 2-3 (bajos-medios)
        WHEN @barrio_nombre LIKE 'Buenos Aires%' OR @barrio_nombre LIKE 'Guayabal%' OR @barrio_nombre LIKE 'San Diego%' OR @barrio_nombre LIKE 'Boston%' OR @barrio_nombre LIKE 'La Candelaria%' OR @barrio_nombre LIKE 'El Chagualo%' THEN 3 + ((@i - 1) % 2)  -- 3-4 (medios)
        WHEN @barrio_nombre LIKE 'Belén%' OR @barrio_nombre LIKE 'La América%' OR @barrio_nombre LIKE 'Sabaneta%' OR @barrio_nombre LIKE 'Itagüí%' THEN 3 + ((@i - 1) % 3)  -- 3-5 (medios-altos, sesgado alto)
        WHEN @barrio_nombre LIKE 'Laureles%' OR @barrio_nombre LIKE 'Envigado%' THEN 4 + ((@i - 1) % 3)  -- 4-6 (altos, sesgado alto)
        WHEN @barrio_nombre LIKE 'El Poblado%' THEN 5 + ((@i - 1) % 2)  -- 5-6 (premium)
        ELSE 3
    END;

    DECLARE @area FLOAT = ((@i - 1) % 150) + 40;
    DECLARE @precio_total BIGINT = ((@i - 1) * 900000) + 70000000 + (@estrato * 5000000);  -- Ajuste por estrato para precios más altos en estratos altos
    DECLARE @precio_m2 FLOAT = @precio_total / @area;

    INSERT INTO propiedades (id_propiedad, tipo_propiedad, id_barrio, direccion, area_m2, precio_total, precio_m2, habitaciones, banos, parqueaderos, anio_construccion, estado_inmueble, estrato, disponibilidad, fecha_publicacion, agente, id_usuario)
    VALUES (
        @i,
        CASE WHEN @i % 2 = 0 THEN 'Apartamento' ELSE 'Casa' END,
        @barrio_id,
        CONCAT('Carrera ', @i, ' #', ((@i - 1) % 50) + 1, '-', ((@i - 1) % 20) + 1),
        @area,
        @precio_total,
        @precio_m2,
        ((@i - 1) % 5) + 1,
        ((@i - 1) % 3) + 1,
        ((@i - 1) % 2),
        1980 + ((@i - 1) % 40),
        CASE WHEN @i % 3 = 0 THEN 'Remodelado' WHEN @i % 2 = 0 THEN 'Nuevo' ELSE 'Usado' END,
        @estrato,
        CASE WHEN @i % 2 = 0 THEN 'Disponible' ELSE 'Vendido' END,
        DATEADD(DAY, -((@i - 1) % 400), GETDATE()),
        (SELECT agente FROM @agentes WHERE id = ((@i - 1) % 20) + 1),
        @i
    );

    SET @i = @i + 1;
END;

-- =====================================
-- 7️⃣ Verificar los datos insertados
-- =====================================
SELECT 'usuarios_inversionistas' AS tabla, COUNT(*) AS total FROM usuarios_inversionistas
UNION
SELECT 'barrios' AS tabla, COUNT(*) AS total FROM barrios
UNION
SELECT 'propiedades' AS tabla, COUNT(*) AS total FROM propiedades;

-- Consulta de ejemplo para verificar algunos registros
SELECT TOP 10 
    p.id_propiedad,
    p.tipo_propiedad,
    b.nombre AS barrio,
    u.nombre AS usuario,
    p.direccion,
    p.precio_total,
    p.estrato
FROM propiedades p
JOIN barrios b ON p.id_barrio = b.id_barrio
JOIN usuarios_inversionistas u ON p.id_usuario = u.id_usuario
ORDER BY p.id_propiedad;