ALTER TABLE string_manipulation
	ALTER COLUMN "Phone_number" TYPE "numeric",
	ALTER COLUMN "Card_number" TYPE "numeric";

ALTER TABLE string_manipulation
	ALTER COLUMN "Card_number" TYPE "varchar"(50);

SELECT
	*
FROM
	string_manipulation;

SELECT
	"First_name",
	"Last_name",
	CONCAT("First_name", ' ', "Last_name") AS full_name,
	CONCAT("First_name", ' ', 'is living in', ' ', "Address") sentence
FROM
	string_manipulation;

SELECT
	"First_name",
	UPPER("First_name"),
	"Last_name",
	LOWER("Last_name")
FROM
	string_manipulation;

SELECT
	"First_name",
	LENGTH("First_name") no_of_characters
FROM
	string_manipulation;

SELECT
	"Gender",
	LENGTH("Gender"),
	BTRIM("Gender", ' ') cleaned_data,
	LENGTH(BTRIM("Gender", ' '))
FROM
	string_manipulation;

SELECT
	"First_name",
	REPLACE("First_name", 'e', 'z')
FROM
	string_manipulation;

SELECT
	"First_name",
	"Last_name",
	REPLACE("Last_name", 'Eze', 'Dayo') new_surname
FROM
	string_manipulation;

SELECT
	"Address",
	SUBSTRING("Address", 9, 5) state,
	LEFT("Address", 6) city,
	REPLACE(RIGHT("Address", 8), '.', '') country
FROM
	string_manipulation;








	