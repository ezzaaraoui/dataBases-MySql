create database airline ;
use airline ;
CREATE TABLE Avion (
    ID_A INT PRIMARY KEY,
    Norn VARCHAR(30),
    Capacite INT,
    Adresse VARCHAR(30)
);

CREATE TABLE Pilote (
    ID_p INT PRIMARY KEY,
    Norn VARCHAR(30),
    Adresse VARCHAR(30)
);

CREATE TABLE Vol (
    ID_V INT PRIMARY KEY,
    ID_A INT,
    ID_p INT,
    VilleDepart VARCHAR(30),
    VilleArrivee VARCHAR(30),
    HeureDepart TIME,
    HeureArrivee TIME,
    FOREIGN KEY (ID_A) REFERENCES Avion(ID_A),
    FOREIGN KEY (ID_p) REFERENCES Pilote(ID_p)
);

INSERT INTO Avion (ID_A, Norn, Capacite) VALUES (100, 'AIRBUS', 300), (101, 'B737', 250), (102, 'B737', 220);

SELECT * FROM Avion ORDER BY Norn ASC;

SELECT Norn, Capacite FROM Avion;

SELECT DISTINCT Adresse FROM Pilote;

SELECT * FROM Avion WHERE Adresse IN ('RABAT', 'CASA');

UPDATE Avion SET Capacite = 220 WHERE ID_A = 101;

DELETE FROM Avion WHERE Capacite < 200;

SELECT MAX(Capacite) AS Capacite_Max, MIN(Capacite) AS Capacite_Min, AVG(Capacite) AS Capacite_Moyenne FROM Avion;

SELECT * FROM Avion WHERE Capacite = (SELECT MIN(Capacite) FROM Avion);

SELECT * FROM Avion WHERE Capacite > (SELECT AVG(Capacite) FROM Avion);

SELECT Pilote.Norn, Pilote.Adresse 
FROM Pilote 
JOIN Vol ON Pilote.ID_p = Vol.ID_p 
WHERE Vol.ID_V IN ('ITIO0', 'IT104');

SELECT ID_p FROM Vol GROUP BY ID_p;

SELECT ID_p FROM Pilote WHERE ID_p NOT IN (SELECT ID_p FROM Vol);

SELECT DISTINCT Pilote.Norn 
FROM Pilote 
JOIN Vol ON Pilote.ID_p = Vol.ID_p 
JOIN Avion ON Vol.ID_A = Avion.ID_A 
WHERE Avion.Norn = 'AIRBUS';







