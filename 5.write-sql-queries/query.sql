-- SELECT * FROM cars;
-- SELECT brand,model,condition,year FROM cars;
-- SELECT brand,model,color,price FROM cars
-- WHERE color = 'black';
-- SELECT brand,color,condition,model FROM cars
-- WHERE condition = 0;
SELECT brand,model,condition,price FROM cars
WHERE price < 60000;