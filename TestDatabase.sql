CREATE TABLE IF NOT EXISTS accounts(
	user_id SERIAL PRIMARY KEY,
	username VARCHAR(50) UNIQUE NOT NULL,
	password VARCHAR(50) NOT NULL,
	email VARCHAR(250) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
	last_login TIMESTAMP
);

CREATE TABLE IF NOT EXISTS role_table(
	role_id SERIAL PRIMARY KEY,
	role_name VARCHAR (50) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS account_roles(
	user_id INT NOT NULL,
	role_id INT NOT NULL,
	grant_date TIMESTAMP,
	PRIMARY KEY(user_id, role_id),
	FOREIGN KEY (role_id) 
		REFERENCES role_table (role_id),
	FOREIGN KEY (user_id) 
		REFERENCES accounts (user_id)
);

CREATE TABLE IF NOT EXISTS customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	age INT NOT NULL
	);

INSERT INTO customer(customer_id,first_name,last_name,age)
VALUES(1, 'David', 'Benjamin', 24);

SELECT *
	FROM customer;

INSERT INTO customer(first_name,last_name,age)
VALUES
('Mary', 'Eniola', 26),
('David', 'Paul', 30),
('Stephen', 'Wilson', 20),
('Samson', 'Richard', 35)
;













	