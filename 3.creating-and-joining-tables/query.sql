/*
	Select the brand, model, price, sold, sold_price columns
		from sold_cars
	Left join with cars
		matching sold_cars.cars_id to cars.id
*/

-- SELECT brand, model, price, sold, sold_price 
--   FROM sold_cars SC
--   RIGHT JOIN cars C ON SC.cars_id = C.id;
  -- 💡

-- EXPLANATION
--  In plain English
-- You’re saying:
-- “Show me every car, and if that car has a record in sold_cars, include the sale info like sold_price too.”
-- LEFT JOIN → focus on what’s in sold_cars.
-- RIGHT JOIN → focus on what’s in cars.


/*
	Select name, role, city, state
		From the staff table
	Left join with the dealerships table where the dealership_id in staff
			matches with the id in dealerships
*/

-- SELECT name, role, city, state FROM staff
--   RIGHT JOIN dealerships ON dealership_id = dealerships.id;

-- SELECT * FROM dealerships;
/*
	Select name, role from staff and city, state from dealerships
	Join the staff table to dealerships using full join
		match the staff.dealership_id to dealerships.id
*/

-- FULL JOIN
-- SELECT name, role, city, state FROM staff
-- 	FULL JOIN dealerships ON dealership_id = dealerships.id;

---INNER JOIN
-- SELECT name, role, city, state FROM staff
-- 	INNER JOIN dealerships ON dealership_id = dealerships.id;

-- SELECT * FROM staff;

/*
	Select name, role, sold_price from staff
	Inner join with sold_cars
		matching seller with staff.id	
*/

-- SELECT name, role, sold_price FROM staff
-- 	INNER JOIN sold_cars ON staff.id = seller;


  /*
	Use full join to show the name, role and sold_price
		from staff
	Full join with sold_cars
		matching seller with staff.id	
*/

SELECT name,role,sold_price FROM staff
FULL JOIN sold_cars ON seller = staff.id;