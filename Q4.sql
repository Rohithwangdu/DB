CREATE TABLE JunkMail(
  Name VARCHAR(30),
  Address VARCHAR(10),
  ID INTEGER,
  SameFam INTEGER
  );
  
INSERT INTO JunkMail VALUES
('Alice','A',10,NULL),
('Bob','B',15,NULL),
('Carmen','C',22,NULL),
('Diego','A',9,10),
('Ella','B',3,15),
('Farkhad','D',11,NULL);


DELETE p FROM JunkMail p INNER JOIN JunkMail q
ON p.ID = q.SameFam WHERE p.SameFam IS NULL;

SELECT * FROM JunkMail;