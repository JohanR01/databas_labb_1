-- upg 1
CREATE PROCEDURE update_price()
LANGUAGE plpgsql
AS $$
BEGIN

UPDATE products
SET unit_price = unit_price * 1.05;

END;
$$;

CALL update_price();

select unit_price FROM products;

-- första 4 
--19.845
--20.9475
--11.025
--24.255001

-- upg 2
CREATE PROCEDURE update_price_category(p_category_id INT)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE products
    SET unit_price = unit_price * 1.05
    WHERE category_id = p_category_id;
END;
$$;

CALL update_price_category(1);

SELECT product_id, unit_price FROM products WHERE category_id = 1;


SELECT product_id, unit_price FROM products WHERE category_id = 2;




-- upg 3

CREATE VIEW oversikt
AS
SELECT product_name, category_name,unit_price
FROM products
JOIN categories ON(products.categoryt_id = categories.category_id);

-- upg 4

CREATE VIEW overview_sek
AS
SELECT product_name, category_name, unit_price,
       ROUND((unit_price * 10):: numeric, 2) AS price_sek
FROM products
JOIN categories ON (products.category_id = categories.category_id);



-- upg 5

--BEGIN TRANSACTION
SELECT product_id, unit_price FROM products
WHERE product_id = 1 OR product_id = 2;

BEGIN;
UPDATE products 
SET unit_price = unit_price * 0.95 
WHERE product_id = 1 OR product_id = 2;
ROLLBACK;

--COMMIT TRANSACTION

--Starta en ny transaktion.¨
BEGIN;
--Genomför först en korrekt UPDATE.
UPDATE products 
SET unit_price = unit_price * 0.95 
WHERE product_id = 1;
--Kör därefter en felaktig UPDATE, exempelvis genom att använda ett kolumnnamn som inte finns.
UPDATE products 
SET unit_price = unit_pris * 0.95 
WHERE product_id = 1;
--Undersök vad som händer med transaktionen och med den första ändringen.
SELECT product_id, unit_price FROM products
WHERE product_id = 1 OR product_id = 2;
--Använd ROLLBACK för att avsluta den misslyckade transaktionen innan du fortsätter arbeta.
ROLLBACK;
