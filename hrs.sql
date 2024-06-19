USE projects;

SELECT*
FROM hrs;

ALTER TABLE hrs
CHANGE COLUMN ï»¿id emp_id varchar(20)NULL;

DESCRIBE hrs;

SELECT birthdate FROM hrs;

SET sql_safe_updates = 0;

UPDATE hrs
SET birthdate = CASE
   WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
   WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
   ELSE NULL 
END;

ALTER TABLE hrs
MODIFY COLUMN birthdate DATE;

UPDATE hrs
SET hire_date = CASE
   WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
   WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
   ELSE NULL 
END;
;

ALTER TABLE hrs
MODIFY COLUMN hire_date DATE;

UPDATE hrs
SET termdate = IF(termdate IS NOT NULL AND termdate != '', date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
WHERE true;

SELECT termdate from hrs;

SET sql_mode = 'ALLOW_INVALID_DATES';

ALTER TABLE hrs
MODIFY COLUMN termdate DATE;

ALTER TABLE hrs ADD COLUMN age INT;

UPDATE hrs
SET age = timestampdiff(YEAR, birthdate, CURDATE());

SELECT birthdate, age
FROM hrs;




