-- upg 1
SELECT first_name, last_name FROM employees;

-- upg 2
SELECT employees.home_phone
FROM employees
WHERE employees.title = 'Vice President, Sales';

-- upg 3
SELECT suppliers.contact_name
FROM suppliers
WHERE suppliers.company_name = 'Svensk Sjöföda AB';

-- upg 4
SELECT first_name, last_name, birth_date
FROM employees
ORDER BY birth_date;

-- upg 5
SELECT * 
FROM customers
ORDER BY customers.country, customers.city;

-- upg 6
SELECT last_name
FROM employees
WHERE employees.last_name LIKE '%an';

-- upg 7
SELECT *
FROM employees
WHERE employees.title LIKE '%Vice%' 
OR employees.title LIKE '%President%' 
OR employees.title LIKE '%Manager%';


-- Beräkning och vollkor --

-- upg 8
