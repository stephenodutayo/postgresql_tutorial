SELECT
	*
FROM lecturer;

SELECT
	*
FROM student;

INSERT INTO lecturer(full_name, age)
VALUES
('Jane Smith', 49),
('Tobi Joseph', 52),
('Chucks Eze', 51),
('Charlse Harry', 35),
('Adamu Ali',40)

INSERT INTO student(full_name, age)
VALUES
('Yemi Jack', 20),
('Johnson Rivers', 21),
('Sandra James', 19),
('Emeka Paul', 37),
('Chinedu Stephen',57)

-- find a student older than all the lecturer

SELECT
	*
FROM 
	student
WHERE
	age > ALL(
	SELECT
		age
	FROM 
		lecturer);

-- find a student older than any the lecturer
SELECT
	*
FROM 
	student
WHERE
	age > ANY(
	SELECT
		age
	FROM 
		lecturer);