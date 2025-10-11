/*
	Select the brand, model and price from cars
		where the price is greater than the sold price
			of any car that was sold by Frankie Fender
		and the car has not been sold
*/

-- SELECT brand, model, price FROM cars
--   WHERE price > ANY (
--     SELECT SC.sold_price FROM sold_cars SC
--       JOIN staff S ON SC.seller = S.id
--       WHERE S.name = 'Frankie Fender'
--   ) AND sold IS FALSE;

/*
	Select the brand, model and price where
		* the price is lower than any Ford
		* the brand is Volkswagen
*/

-- SELECT brand,model,price FROM cars
-- WHERE brand = 'Volkswagen'
-- AND price < ANY(
-- 	SELECT price FROM cars
-- 	WHERE brand = 'Ford'
-- )

/*
	Select the name, and sold price
		from the staff table, joined with sold_cars
		on matches between staff(id) and sold_cars(seller)
	Where the seller has sold a car for a price greater than
		any sum of a salesperson's total sales
*/
-- SELECT S.name, SC.sold_price
--   FROM staff S
--   JOIN sold_cars SC ON S.id = SC.seller
-- WHERE SC.sold_price > ANY (
-- SELECT SUM(sold_price) FROM sold_cars
--   GROUP BY seller
-- );


/*
	Select the brand, model and price from cars
	Where the price of the car is greater
		than the total sales of any dealership
*/

-- SELECT brand, model, price FROM cars 
--   WHERE price > ANY (
--     SELECT SUM(sold_price) FROM sold_cars
--     JOIN staff ON staff.id = sold_cars.seller
--       GROUP BY staff.dealership_id
--   );

-- ALL

/*
	Select brand, model, condition and price from cars
		where the price is less than all cars which are in average condition (3)
*/

-- SELECT brand, model, condition, price
--   FROM cars
-- WHERE price < ALL (
--   SELECT price FROM cars
--     WHERE condition = 3
-- );


/*
	Select the brand, model and year from cars
	Where the year is before all cars with a brand of 'Ford'
	Order the results by year
*/

-- SELECT brand,model,year FROM cars
-- WHERE year < ALL(
--   SELECT year FROM cars 
--   WHERE brand = 'Ford'
 
-- ) ORDER BY year;


/*
	Select the brand, model, city, and price from cars
		joined with dealerships where cars(dealership_id) matches dealerships(id)
	where the price is greater than the price of all sold cars
	order the results by city
*/

-- SELECT brand,model,city,price FROM cars C
-- JOIN dealerships D ON C.dealership_id = D.id
-- WHERE price > ALL (
--   SELECT sold_price FROM sold_cars
-- )
-- ORDER BY city;

/*
	Select colors of car where there has been a sale of that color car
*/
-- SELECT * FROM sold_cars;
-- SELECT DISTINCT color FROM cars
-- WHERE EXISTS (
-- 	SELECT 1 FROM sold_cars WHERE cars_id = cars.id
-- );


/*
	Select the city, state and date established of dealerships
		Where there are no existing cars in stock
		
	Format the date in 'YYYY-MM-DD' format using TO_CHAR()
		and alias it as 'est'
*/

-- SELECT city, state, TO_CHAR(established, 'YYYY-MM-DD') AS est
--   FROM dealerships D
--   WHERE NOT EXISTS (
--     SELECT 1 FROM cars WHERE dealership_id = D.id
--   );

	/*
	Select the city and state of dealerships
	Where there exists a car priced at more than $50,000
	
	Hint: you'll need to match cars(dealership_id) with dealerships(id)
	and then check for car price in your subquery
*/

-- SELECT city, state
-- FROM dealerships D
-- WHERE EXISTS (
-- SELECT 1 FROM cars
-- WHERE cars.dealership_id = D.id
-- AND price > 50000
-- )AND EXISTS (
--     SELECT 1 FROM sold_cars SC where seller = s.id
--   );

-- CASE 

/*
	Select the brand, model, condition from cars
		Based on the car's condition level, output the following:
			* 'Excellent' when 4 or greater
			* 'Fair' when 3 or greater
			* 'Poor' when 1 or greater
			* 'Wrecked' for all other cases
		Aliased as 'condition label'
	From cars
	Order by the condition in descending order
*/

-- SELECT brand,model,condition,
-- CASE 
-- WHEN condition >= 4 THEN 'Excellent'
-- WHEN condition >= 3 THEN 'Fair'
-- WHEN condition >=1 THEN 'Poor'
-- ELSE 'Wrecked'
-- END AS condition_label
-- FROM cars
-- ORDER BY condition DESC;

/*
	Rodney is assigning bonuses for his staff on the following terms:
		- Salespeople who have made more than $100,000 in sales receive $10,000
		- Salespeople who have made more than $75,000 in sales receive $5,000
		- Every other staff member gets a bonus of $1,000
	
	Select from the sold_cars table, joined with staff where
		sold_cars(seller) = staff(id)
	Show all staff, even if they have made no sales
	
	Select:
		* staff(name)
		* staff(role)
		* staff(dealership_id)
		* the sum of the staff member's sales - alias as total_sales
	
	Use CASE to select the correct value, as defined above, aliased as bonus
	
	Use GROUP BY to format the output, and ORDER BY bonus then dealership_id
*/
-- SELECT S.name,
-- S.role,
-- S.dealership_id,
-- SUM(sold_price) AS total_sales,
-- CASE
-- WHEN role = 'Salesperson' AND SUM(sold_price) >100000 THEN 10000
-- WHEN role = 'Salesperson' AND SUM(sold_price) > 75000 THEN 5000
-- ELSE 1000
-- END AS bonus
-- FROM sold_cars SC
-- RIGHT JOIN staff S ON SC.seller = S.id
-- GROUP BY name,role,dealership_id
-- ORDER BY bonus,dealership_id;

/*
	Select brand, model, condition, year and price from cars
	Only select cars which have not been sold, and:
		* If the year is 1960 or earlier, the condition must be 4 or greater
		* If the year is 1970 or earlier, the condition must be 3 or greater
		* If the year is 1980 or earlier, the condition must be 2 or greater
		* If the year is 1990 or earlier, the condition must be 1 or greater
		* and any other cars (ELSE TRUE)
	Order by year then condition
*/

-- SELECT brand,model,condition,year,price FROM cars
-- WHERE sold IS FALSE 
-- AND CASE 
-- WHEN year <= 1960 THEN condition >= 4
-- WHEN year <= 1970 THEN condition >= 3
-- WHEN year <= 1980 THEN condition >= 2
-- WHEN year <= 1990 THEN condition >= 1
-- ELSE TRUE
-- END
-- ORDER BY year,condition;

-- SELECT brand, model, price FROM cars WHERE brand = 'Aston Martin' ORDER BY id;
SELECT brand, model, city, dealership_id AS d_id, price
	FROM cars
	INNER JOIN dealerships ON dealerships.id = cars.dealership_id
ORDER BY city;

