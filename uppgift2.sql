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


-- Beräkning och villkor --

-- upg 8
SELECT product_name, 
    unit_price,
    unit_price * 1.07
AS new_price
FROM products;

-- upg 9
SELECT product_name,
    unit_price * units_in_stock
AS total_price
FROM products;

-- upg 10
SELECT units_in_stock, reorder_level
FROM products
WHERE units_in_stock < reorder_level;

-- upg 11
SELECT units_in_stock, reorder_level
FROM products
WHERE units_on_order + units_in_stock < reorder_level;

-- upg 12
SELECT products.product_name, products.category_id, category_name
FROM products, categories
WHERE products.product_name ='Lakkalikööri'
AND categories.category_id ='1';

-- alternativ
SELECT product_name, category_name
FROM products
JOIN categories ON (categories.category_id = products.category_id)
WHERE product_name = 'Lakkalikööri'
