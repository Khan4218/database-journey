-- SELECT * FROM cars;
-- SELECT brand,model,condition,year FROM cars;
-- SELECT brand,model,color,price FROM cars
-- WHERE color = 'black';
-- SELECT brand,color,condition,model FROM cars
-- WHERE condition = 0;
-- SELECT brand,model,condition,price FROM cars
-- WHERE price < 60000;
/*
	Filter out cars from 1965
		Select the brand, model, year and price
*/

-- SELECT brand,model,year,price FROM cars
-- WHERE year != 1965;

/*
	Find cars which are not yellow
		Select the brand, model, price and color
*/

-- SELECT brand,model,price,color FROM cars
-- WHERE color != 'yellow'

/*
	Select the brand, model, color and year
		find any car where the color includes 'green'
*/

-- SELECT brand,model,color,year FROM cars
-- WHERE color NOT LIKE '%green%';

/*
	Select the brand, model, color and year for cars
		where the model is 'DB' followed by any other single character
*/

-- SELECT brand,model,year,color FROM cars
-- WHERE model LIKE 'DB_';

/*
	Select the brand, model, color and year from cars
		exclude any green car
		show models which are 'DB' followed by any other single character
		and the year is after 1964
*/

-- SELECT brand,model,color,year FROM cars
-- WHERE color NOT LIKE '%green%'
-- AND model LIKE 'DB_'
-- AND year >= 1965;

/*
	Select the brand, model, year, condition and price from cars
		where the condition is 3 or higher
		and the year is before 1970
*/

-- SELECT brand,model,year,condition,price FROM cars
-- WHERE condition >= 3
-- AND year < 1970
-- AND price < 100000;

/*
	Select cars made between 1980 and 1989
		show the brand, model, year and price
*/

-- SELECT brand,model,year,price FROM cars
-- WHERE year >= 1980
-- AND year <= 1989; 

/*
	Select cars made between 1980 and 1989
		show the brand, model, year and price
*/

-- SELECT brand,model,year,price FROM cars
-- WHERE year BETWEEN 1980 AND 1989;

/*
	Select brand, model, condition, color and price from cars
		where the price is between $20,000 and $60,000
		and the condition is between 1 and 3
		and the color contains red
*/

-- SELECT brand,model,condition,color,price FROM cars
-- WHERE price BETWEEN 20000 AND 60000 
-- AND condition BETWEEN 1 AND 3 
-- AND color LIKE '%red%';

/*
	Search for columns: brand, model, color, year, price, sold
		from the table cars
		where the color is a shade of red
		or the year is between 1960 and 1969
		and sold is false
*/

-- SELECT brand, model, color, year, price, sold FROM cars
-- 	WHERE (color LIKE '%red%'
-- 	OR year BETWEEN 1960 AND 1969)
-- 	AND sold IS FALSE;

/*
	Select the brand, model, price and sold columns from cars
		the brand can be 'Ford', 'Chevrolet' or 'Ferrari'
		sold must be false
*/

-- SELECT brand, model, price, sold FROM cars
-- 	WHERE brand IN ('Ford', 'Chevrolet', 'Ferrari')
-- 	AND sold IS FALSE;


/*
	Select brand, model, price and sold from cars
		filter out any cars which are sold
		show cars where the brand is none of ('Ford', 'Triumph', 'Chevrolet', 'Dodge')
		or the price is less than $50000
*/

-- SELECT brand, model, price, sold FROM cars
-- 	WHERE (
-- 		brand NOT IN ('Ford', 'Triumph', 'Chevrolet', 'Dodge')
-- 		OR price < 50000
-- 	) AND sold IS FALSE;

--- EXERCISES

/*
	Select brand, model, and color from cars
		where the color is 'red'
		and the brand is not 'Ferrari'
		and the car has not been sold
*/

-- SELECT brand, model, color FROM cars
--   WHERE color LIKE '%red%'
--   AND brand != 'Ferrari'
--   AND sold IS FALSE;


  /*
	Select brand, model, and color from cars
		where the color is not red, blue, or white
		and the brand is none of: Aston Martin, Bentley or Jaguar
		and sold is false
*/

-- SELECT brand, model, color FROM cars
--   WHERE color NOT IN ('red', 'blue', 'white')
--   AND brand NOT IN ('Aston Martin', 'Bentley', 'Jaguar')
--   AND sold IS FALSE;

/*
		Select the brand, model, condition and price from cars
		where the car is not sold
		and the condition is not 5
		order the table by condition in descending order
		and by price in ascending order
*/

-- SELECT brand, model, condition, price FROM cars
-- 	WHERE sold IS FALSE
-- 	AND condition != 5
-- 	ORDER BY condition DESC, price;

/*
	Select the brand, model, year and price from the cars table
		order the results by the price in descending order
		limit the results to 1
*/

-- SELECT brand, model, year, price FROM cars
-- 	ORDER BY price DESC
-- 	LIMIT 1;


/*
	Select the brand, model, color and price from cars
		where the color is a shade of 'red'
		and sold is false
		order by price
		limit the results to 5
*/

-- SELECT brand,model,color,price FROM cars
-- WHERE color LIKE '%red%'
-- AND sold IS false
-- ORDER BY price
-- LIMIT 5;

/*
	Count the number of cars
		where sold is true
*/

-- SELECT COUNT(*) AS total_sold FROM cars
-- 	WHERE sold IS TRUE;

-- /*
-- 	Sum the price of cars
-- 		where sold is true
-- 	Use the alias total_earnings in your output
-- */

-- SELECT SUM(price) AS total_earnings FROM cars
-- 	WHERE sold IS TRUE;

/*
	Select the maximum retail price
		where sold is true
	Use most_expensive as an alias
*/

-- SELECT MAX(price) AS most_expensive FROM cars
-- 	WHERE sold IS TRUE;

-- /*
-- 	Use the AVG aggregate function to find the average price
-- 		where the brand is Bentley
		
-- 		We can use FLOOR and CEIL to round the average down or up
-- 			to the nearest whole number
-- */

-- SELECT FLOOR(AVG(price)) AS average FROM cars
-- 	WHERE brand = 'Bentley';



-- /*
-- 	Select the average, minimum and maximum price from cars
-- 		where sold is true
-- 	Round the average up to the nearest whole number
-- 		and use 'avg' as the alias for that result	
-- */


-- SELECT CEIL(AVG(price)) AS avg,
-- MIN(price) AS min,
-- MAX(price) AS max
-- FROM cars
-- WHERE sold IS TRUE;


/*
	Select the brand, and a count of the brand from cars
		alias the count as brand_count
		group by the brand column
*/

SELECT brand, count(brand) AS brand_count FROM cars
	GROUP BY brand;


/*
	Select the condition, and a count of the condition from cars
		group by the condition column
*/

SELECT condition, count(condition) FROM cars
GROUP BY condition;


/*
	Select:
		* the brand
		* a count of the brand
		* and an average of the price for each brand
		* round the average down to the nearest number
		* alias the average as 'AVG' in your output
	From cars where
		the car has not been sold
	Group the table by brand.
*/

SELECT brand, COUNT(brand),
FLOOR(AVG(price)) AS AVG FROM cars
WHERE sold IS FALSE 
GROUP BY brand