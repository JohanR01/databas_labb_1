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

-- första 4 19.845
--20.9475
--11.025
--24.255001

-- upg 3

CREATE VIEW oversikt
AS
SELECT product_name, category_name,unit_price
FROM products
JOIN categories ON(products.product_id = categories.category_id);

