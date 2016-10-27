CREATE TABLE Enrollment(
  SID INTEGER NOT NULL,
  ClassName VARCHAR(10) NOT NULL,
  GRADE CHAR(1) NOT NULL
);

INSERT INTO Enrollment VALUES
(123,'ART123','A'),
(123,'BUS456','B'),
(666,'REL100','D'),
(666,'ECO966','A'),
(666,'BUS456','B'),
(345,'BUS456','A'),
(345,'ECO966','F');

CREATE VIEW VW_Enrollment AS
(SELECT 
 ClassName, 
 COUNT(SID) AS Total 
 FROM Enrollment 
 GROUP BY ClassName 
 ORDER BY ToTal);
 
 select * from VW_Enrollment