

-- Try a hands-on exercise to test your knowledge of JSON data types.
-- Problem statement

-- You will perform the following tasks to check your understanding of JSON data type.
-- Task 1

-- Create a table cars with two columns and insert the following data:
-- car_id 	car_info
-- 1 	brand: ferrari, model: testarosa
-- 2 	brand: aston martin, model: db2
-- 3 	brand: bentley, model: mulsanne
-- 4 	brand: ford, model: T

-- Expected output

-- When you’re done creating the table and inserting the data in the table, you may see the records in the cars table by using the following query.

-- Select * from cars;

-- It will give the following output.

-- car_id  car_info
-- 1       {"brand": "ferrari", "model": "testarosa"}
-- 2       {"brand": "aston martin", "model": "db2"}
-- 3       {"brand": "bentley", "model": "mulsanne"}
-- 4       {"brand": "ford", "model": "T"}

CREATE TABLE cars (
    car_id SERIAL PRIMARY KEY,
    car_info JSONB
);

INSERT INTO cars (car_info)
VALUES ('{"brand": "ferrari", "model": "testarosa"}');

INSERT INTO cars (car_info)
VALUES ('{"brand": "aston martin", "model": "db2"}');

INSERT INTO cars (car_info)
VALUES ('{"brand": "bentley", "model": "mulsanne"}');

INSERT INTO cars (car_info)
VALUES ('{"brand": "ford", "model": "t"}');

SELECT * FROM cars;


-- Task 2

-- Retrieve the record having the information on Ferrari from the cars table.
-- Expected output

-- The output for task two looks like the following:

-- car_id  car_info
-- 1       {"brand": "ferrari", "model": "testarosa"}



select * from cars where car_info @>'{"brand":"ferrari"}'


-- Task 3

-- Update the record where car_id is 4 and remove the information of the model. Make sure you print the output using the returning clause.
-- Expected output

-- The output for task three looks like the following:
-- car_id  car_info
-- 4      {"brand": "ford"}

update cars set car_info='{"brand": "ford"}' where car_id=1;


UPDATE cars 
   SET car_info = car_info - 'model' 
 WHERE car_id=4 