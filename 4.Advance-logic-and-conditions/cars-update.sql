/*
	Update the price of Aston Martin brand cars:
		* If the car is a DB5, increase the price by 15%
		* If the model is 'DB' followed by another single character, increase by 10%
		* Increase others by 5%
	Only update unsold cars
*/

UPDATE cars
SET price = price * CASE
WHEN model = 'DB5' THEN 1.15
WHEN model LIKE 'DB_' THEN 1.1
ELSE 1.05
END
WHERE sold IS FALSE
AND brand = 'Aston Martin';


/*
	Alter the price of cars:
		* For cars in Chicago, increase the price by 20%
		* For cars in Detroit, decrease the price by 20%
		* Any other car should keep the same price
	Only update unsold cars
	
	Hint: you can use dealership_id in your update without a JOIN
*/

UPDATE cars
SET price = price * CASE  
WHEN (SELECT city FROM dealerships WHERE  dealerships.id = cars.dealership_id) = 'Chicago' THEN 1.20
WHEN (SELECT city FROM dealerships WHERE dealerships.id = cars.dealership_id ) = 'Detroit' THEN 0.80
ELSE 1.00
END 
WHERE sold IS FALSE;
