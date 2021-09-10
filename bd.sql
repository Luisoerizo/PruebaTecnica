CREATE DATABASE viajes;
USE viajes;

CREATE TABLE aerolineas (
id_aerolinea INT AUTO_INCREMENT PRIMARY KEY, 
nombre_aerolinea VARCHAR(60) NOT NULL);

INSERT INTO aerolineas (nombre_aerolinea) VALUES ('Volaris');
INSERT INTO aerolineas (nombre_aerolinea) VALUES ('Aeromar');
INSERT INTO aerolineas (nombre_aerolinea) VALUES ('Interjet');
INSERT INTO aerolineas (nombre_aerolinea) VALUES ('Aeromexico');

CREATE TABLE aeropuertos (
id_aeropuerto INT AUTO_INCREMENT PRIMARY KEY,
nombre_aerolinea VARCHAR(60) NOT NULL);
 
 INSERT INTO aeropuertos (nombre_aerolinea) VALUES ('Benito Juarez');
 INSERT INTO aeropuertos (nombre_aerolinea) VALUES ('Guanajuato');
 INSERT INTO aeropuertos (nombre_aerolinea) VALUES ('La Paz');
 INSERT INTO aeropuertos (nombre_aerolinea) VALUES ('Oaxaca');
 
 CREATE TABLE movimientos (
 id_movimiento INT AUTO_INCREMENT PRIMARY KEY, 
 descripcion VARCHAR(60) NOT NULL); 
 
 INSERT INTO movimientos (descripcion) VALUES ('Salida');
 INSERT INTO movimientos (descripcion) VALUES ('Llegada');

 CREATE TABLE vuelos (id_aerolinea INT NOT NULL,  id_aeropuerto INT NOT NULL, id_movimiento INT NOT NULL, dia DATE NOT NULL);
 
 ALTER TABLE vuelos ADD CONSTRAINT fk_aerolineas FOREIGN KEY (id_aerolinea) REFERENCES aerolineas(id_aerolinea);
 
 ALTER TABLE vuelos ADD CONSTRAINT fk_aeropuertos FOREIGN KEY (id_aeropuerto) REFERENCES aeropuertos(id_aeropuerto);
 
 ALTER TABLE vuelos ADD CONSTRAINT fk_movimientos FOREIGN KEY (id_movimiento) REFERENCES movimientos(id_movimiento);

 INSERT INTO vuelos (ID_AEROLINEA, ID_AEROPUERTO, ID_MOVIMIENTO, DIA) VALUES 
 (1,1,1,'2021-05-02'), (2,1,1,'2021-05-02'), (3,2,2,'2021-05-02'),
 (4,3,2,'2021-05-02'), (1,3,2,'2021-05-02'), (2,1,1,'2021-05-02'),
 (2,3,1,'2021-05-04'), (3,4,1,'2021-05-04'), (3,4,1,'2021-05-04');

/*1. ¿Cuál es el nombre del aeropuerto que ha tenido mayor movimiento durante el año?*/
SELECT COUNT(id_movimiento) as movimientos, a.nombre_aerolinea FROM vuelos v
INNER JOIN aeropuertos a ON v.id_aeropuerto = a.id_aeropuerto
GROUP BY v.id_aeropuerto ORDER BY movimientos DESC LIMIT 1;

/*2. ¿Cuál es el nombre aerolínea que ha realizado mayor número de vuelos durante el año?*/
SELECT COUNT(id_movimiento) as movimientos, a.nombre_aerolinea FROM vuelos v
INNER JOIN aerolineas a ON v.id_aerolinea = a.id_aerolinea
GROUP BY v.id_aerolinea ORDER BY movimientos DESC LIMIT 1;

/*3. ¿En qué día se han tenido mayor número de vuelos?*/
SELECT (dia) AS Dia, count(dia) AS Vuelos FROM vuelos 
GROUP BY  dia  ORDER BY Vuelos DESC LIMIT 1;

/*4. ¿Cuáles son las aerolíneas que tienen mas de 2 vuelos por día?*/
SELECT a.nombre_aerolinea AS Aerolinea, count(distinct dia) AS Vuelos from vuelos v 
INNER JOIN aerolineas a ON v.id_aerolinea = a.id_aerolinea 
GROUP BY v.id_aerolinea
HAVING COUNT(DATE(dia)) > 2;