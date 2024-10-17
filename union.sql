SELECT
	*
FROM
	"January_class";

SELECT
	*
FROM
	"February_class";

SELECT
	*
FROM
	"January_class"
UNION
SELECT
	*
FROM
	"February_class";

SELECT
	*
FROM
	"January_class"
UNION ALL
SELECT
	*
FROM
	"February_class";

SELECT
	*
FROM
	"January_class"
INTERSECT
SELECT
	*
FROM
	"February_class";	

SELECT
	*
FROM
	"January_class"
EXCEPT
SELECT
	*
FROM
	"February_class";
	