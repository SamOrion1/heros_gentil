DROP TABLE IF EXISTS Armes, Competences, CompHero, Héros;

CREATE TABLE `Armes` (
  `ID` tinyint(1) NOT NULL,
  `HerosID` tinyint(1) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `Degat` tinyint(2) NOT NULL
);

INSERT INTO `Armes` (`ID`, `HerosID`, `Nom`, `Type`, `Degat`) VALUES
(1, 0, 'Batte en mousse', 'mousse', 0),
(2, 0, 'Vanne de Liujen', 'destabilisante', 10),
(3, 0, 'Microsoft', 'effrayant', 20),
(4, 0, 'Feuille', 'tranchant', 5),
(5, 0, 'Caillou', 'contondant', 5),
(6, 0, 'Ciseau', 'perçant', 5);


CREATE TABLE `Competences` (
  `ID` tinyint(1) NOT NULL,
  `Type` enum('Statut','PV','Defense','Bonus','ArmeEnMain','Immunite'),
  `Effet` varchar(50)
); 

INSERT INTO `Competences` (`ID`, `Type`, `Effet`) VALUES
(1, 'Bonus', 'Attaque tranchante de PHP'),
(2, 'Bonus', 'Attaque effrayante de JS'),
(3, 'Bonus', 'Attaque perçante de Fullstack');


CREATE TABLE `CompHero` (
  `CompetencesID` tinyint(1) NOT NULL,
  `HerosID` tinyint(1) NOT NULL
);


CREATE TABLE `Héros` (
  `ID` tinyint(1) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `PV` tinyint(2) NOT NULL,
  `Bonus` tinyint(2) NOT NULL,
  `Defense` tinyint(2) NOT NULL,
  `ArmeEnMain` tinyint(2) DEFAULT NULL,
  `Statut` varchar(100) NOT NULL,
  `Immunite` varchar(20) NOT NULL
);

INSERT INTO `Héros` (`ID`, `Nom`, `PV`, `Bonus`, `Defense`, `ArmeEnMain`, `Statut`, `Immunite`) VALUES
(1, 'Comar', 40, 2, 15, NULL, 'Joyeux', 'Degat de mousse'),
(2, 'Kirderf', 35, 14, 5, NULL, 'Combatif', 'Rien'),
(3, 'Liujen', 45, 5, 8, NULL, 'Flegme', 'Degat destabilisant');


ALTER TABLE `Armes`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `Competences`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `Héros`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `Armes`
  ADD CONSTRAINT `Armes` FOREIGN KEY (`HerosID`) REFERENCES `Héros` (`ID`);

ALTER TABLE `CompHero`
  ADD CONSTRAINT `CompHero` FOREIGN KEY (`CompetencesID`) REFERENCES `Competences` (`ID`);
ALTER TABLE `CompHero`
  ADD CONSTRAINT `competenceHero` FOREIGN KEY (`HerosID`) REFERENCES `Héros` (`ID`);


