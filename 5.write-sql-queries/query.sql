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

SELECT brand,model,year,condition,price FROM cars
WHERE condition >= 3
AND year < 1970
AND price < 100000;