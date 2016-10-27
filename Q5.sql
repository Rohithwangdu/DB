CREATE TABLE CHEFS(
  Chef VARCHAR(10),
  Dish VARCHAR(50)
  );

INSERT INTO CHEFS VALUES
('A','Mint chocolate brownie'),
('B','Upside down pineapple cake'),
('B','Creme brulee'),
('B','Mint chocolate brownie'),
('C','Upside down pineapple cake'),
('C','Creme brulee'),
('D','Apple pie'),
('D','Upside down pineapple cake'),
('D','Creme brulee'),
('E','Apple pie'),
('E','Upside down pineapple cake'),
('E','Creme brulee'),
('E','Bananas Foster');

SELECT Chef from CHEFS 
WHERE Dish IN ('Apple pie','Upside down pineapple cake','Creme brulee')
GROUP BY Chef 
HAVING COUNT(*) = 3; 
