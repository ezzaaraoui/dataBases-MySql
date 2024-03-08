CREATE DATABASE Cheval;

USE Cheval;
CREATE TABLE cheval (
    num_cheval INT PRIMARY KEY,
    nom_cheval VARCHAR(45),
    num_tatouage VARCHAR(45),
    couleur_cheval VARCHAR(45),
    num_chevalPere INT,
    num_chevalMere INT, 
    num_persElveur INT,
    nomRace VARCHAR(20),
    FOREIGN KEY (num_chevalPere) REFERENCES cheval (num_cheval),
    FOREIGN KEY (num_chevalMere) REFERENCES cheval (num_cheval), 
    FOREIGN KEY (num_persElveur) REFERENCES person (num_person),
    FOREIGN KEY (nomRace) REFERENCES race(nomRace)
);


CREATE Table person (
    num_person int PRIMARY KEY,
    nom VARCHAR(45),
    prenom VARCHAR(45),
    telephon VARCHAR(45),
    adresse VARCHAR(45),
    fonction VARCHAR(45),
    num_personSup int,
    Foreign Key (num_personSup) REFERENCES person (num_person)
);

CREATE Table race(
    nomRace VARCHAR(20) PRIMARY key,
    poidType decimal(10,2),
    tailleType decimal(10,2)
);

CREATE TABLE croissance (
    ID_CROISSANCE INT PRIMARY KEY,
    mois INT,
    tailleMois VARCHAR(45),
    poidsMois VARCHAR(45),
    num_cheval INT,
    FOREIGN KEY(num_cheval) REFERENCES cheval(num_cheval)
);

CREATE Table proprietaire (
    num_person int,
    num_cheval int,
    dateAchat date PRIMARY KEY,
    prix_Achat DOUBLE, 
    Foreign Key (num_person) REFERENCES person (num_person),
    Foreign Key (num_cheval) REFERENCES cheval (num_cheval)
);

CREATE table concour(
    nomConcour VARCHAR(45)  ,
    anneeConcour int,
    nbrParticipant int,
    PRIMARY KEY (nomConcour, anneeConcour) 
);

CREATE TABLE participationConcour (
    num_cheval INT,
    nom_concour VARCHAR(45),
    anneeConcour INT,
    placeConcour VARCHAR(45),
    FOREIGN KEY (num_cheval) REFERENCES cheval(num_cheval),
    FOREIGN KEY (nom_concour, anneeConcour) REFERENCES concour(nomConcour, anneeConcour)
);

show tables 
