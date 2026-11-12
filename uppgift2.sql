-- upg 1
SELECT first_name, last_name FROM employees;

-- upg 2
SELECT employees.home_phone
FROM employees
WHERE employees.title = 'Vice President, Sales';

-- upg 3
SELECT suppliers.contact_name
FROM suppliers
WHERE suppliers.company_name = 'Svensk Sjöföda AB'

-- upg 4