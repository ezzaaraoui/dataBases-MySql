CREATE DATABASE Djallaba;

USE Djallaba;

CREATE TABLE Emp (
    NumE INT PRIMARY KEY,
    NomE VARCHAR(50),
    Fonction VARCHAR(50),
    NumS INT,
    Embauche DATE,
    Salaire DECIMAL(10, 2),
    Comm DECIMAL(10, 2),
    NumD INT,
    FOREIGN KEY (NumD) REFERENCES Dept(NumD)
);

CREATE TABLE Dept (
    NumD INT PRIMARY KEY,
    NomD VARCHAR(50),
    Lieu VARCHAR(50)
);

SELECT * FROM Emp WHERE Comm IS NOT NULL ORDER BY Comm DESC;

SELECT NomE FROM Emp WHERE Embauche >= '2020-09-01';

SELECT * FROM Emp JOIN Dept ON Emp.NumD = Dept.NumD WHERE Lieu = 'Azli';

SELECT * FROM Emp WHERE NumS IN (SELECT NumE FROM Emp WHERE NomE = 'Kbbour');

SELECT AVG(Salaire) AS Moyenne_Salaires FROM Emp;

SELECT COUNT(Comm) AS Nombre_Commissions_Non_Null FROM Emp WHERE Comm IS NOT NULL;

SELECT * FROM Emp WHERE Salaire > (SELECT AVG(Salaire) FROM Emp);









