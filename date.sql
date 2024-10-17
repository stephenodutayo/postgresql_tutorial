CREATE TABLE IF NOT EXISTS employees(
	employee_id SERIAL PRIMARY KEY,
	first_name VARCHAR(25),
	last_name VARCHAR(25),
	birth_date date NOT NULL,
	hire_date date NOT NULL
);

INSERT INTO employees(first_name, last_name, birth_date, hire_date)
VALUES
('Shannon', 'Freeman', '1980-01-01', '2005-01-01'),
('Sheila', 'Wells', '1978-02-05', '2003-01-01'),
('Ethel', 'Webbs', '1975-01-01', '2001-01-01')
;

SELECT
	*
FROM
	employees;
-- getting the current date
SELECT NOW();
SELECT NOW():: date;
SELECT NOW():: time;
SELECT NOW():: timestamp;
SELECT NOW():: timestamptz;

--output selected date to another format

SELECT TO_CHAR(NOW():: date, 'dd-mm-yyyy');

-- getting interval btw 2 dates

SELECT
	*
FROM
	employees;

SELECT
	first_name,
	last_name,
	NOW() - hire_date duration,
	NOW() - birth_date age
FROM
	employees;

SELECT
	CONCAT(first_name, ' ', last_name) full_name,
	hire_date,
	AGE(hire_date) duration,
	AGE(birth_date) age,
	EXTRACT( YEAR FROM AGE(birth_date)) age_year
FROM
	employees;

SELECT
	CONCAT(first_name, ' ', last_name) full_name,
	EXTRACT( YEAR FROM hire_date) employment_year,
	EXTRACT( YEAR FROM birth_date) birth_year,
	EXTRACT( MONTH FROM birth_date) birth_monty
FROM
	employees;