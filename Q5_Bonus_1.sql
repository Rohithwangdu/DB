SELECT DISTINCT Chef
FROM   CHEFS
WHERE  Chef IN (SELECT Chef FROM CHEFS WHERE Dish = 'Apple pie')
AND Chef IN (SELECT Chef FROM CHEFS WHERE Dish = 'Upside down pineapple cake')
AND Chef IN (SELECT Chef FROM CHEFS WHERE Dish = 'Creme brulee')