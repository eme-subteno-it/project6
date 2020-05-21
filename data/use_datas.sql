-- Get  users from the Paris's point of sale 
SELECT user_name, user_firstname FROM user_oc WHERE pos_id = 2

-- Get all sales
SELECT 
d.delivery_date,
d.delivery_state,
SUM(l.qty * p.unit_price) AS HT,
SUM(l.qty * p.unit_price / 100 * l.tax_rate) AS tax_amount,
SUM(l.qty * p.unit_price + l.qty * p.unit_price / 100 * l.tax_rate) AS total
FROM sale_order AS o
INNER JOIN sale_orderline AS l ON l.sale_order_id = o.id
INNER JOIN product AS p ON p.id = l.product_id
INNER JOIN package AS k ON k.sale_order_id = o.id
INNER JOIN delivery AS d ON d.package_id = k.id
GROUP BY d.delivery_date, d.delivery_state


SELECT 
u.user_name,
u.user_firstname,
d.delivery_date,
d.delivery_state,
SUM(l.qty * p.unit_price) AS HT,
SUM(l.qty * p.unit_price / 100 * l.tax_rate) AS tax_amount,
SUM(l.qty * p.unit_price + l.qty * p.unit_price / 100 * l.tax_rate) AS total
FROM sale_order AS o
INNER JOIN sale_orderline AS l ON l.sale_order_id = o.id
INNER JOIN product AS p ON p.id = l.product_id
INNER JOIN package AS k ON k.sale_order_id = o.id
INNER JOIN delivery AS d ON d.package_id = k.id
INNER JOIN user_oc AS u ON u.id = o.user_id
GROUP BY d.delivery_date, d.delivery_state, u.user_name, u.user_firstname

-- Les 5 meilleurs clients (le + de commande)

-- Get all sales for the product category pizza
SELECT SUM(l.qty * p.unit_price) AS HT,
SUM(l.qty * p.unit_price / 100 * l.tax_rate) AS tax_amount,
SUM(l.qty * p.unit_price + l.qty * p.unit_price / 100 * l.tax_rate) AS total
FROM sale_order AS o
INNER JOIN sale_orderline AS l ON l.sale_order_id = o.id
INNER JOIN product AS p ON p.id = l.product_id
INNER JOIN package AS k ON k.sale_order_id = o.id
INNER JOIN delivery AS d ON d.package_id = k.id
INNER JOIN category AS c ON c.id = p.category_id
WHERE d.delivery_state = 'done' AND c.category_name = 'Pizza'

-- Get all sales for the product category drink
SELECT SUM(l.tax_rate), SUM(l.qty * p.unit_price)
FROM sale_order AS o
INNER JOIN sale_orderline AS l ON l.sale_order_id = o.id
INNER JOIN product AS p ON p.id = l.product_id
INNER JOIN package AS k ON k.sale_order_id = o.id
INNER JOIN delivery AS d ON d.package_id = k.id
INNER JOIN category AS c ON c.id = p.category_id
WHERE d.delivery_state = 'done' AND c.category_name = 'Boisson'

-- Get all sales for the product category Dessert
SELECT SUM(l.tax_rate), SUM(l.qty * p.unit_price)
FROM sale_order AS o
INNER JOIN sale_orderline AS l ON l.sale_order_id = o.id
INNER JOIN product AS p ON p.id = l.product_id
INNER JOIN package AS k ON k.sale_order_id = o.id
INNER JOIN delivery AS d ON d.package_id = k.id
INNER JOIN category AS c ON c.id = p.category_id
WHERE d.delivery_state = 'done' AND c.category_name = 'Dessert'

-- View all employees
SELECT user_name FROM user_oc WHERE is_employee = 1

-- View all Customers 
SELECT user_name FROM user_oc WHERE is_customer = 1

-- View all suppliers
SELECT user_name FROM user_oc WHERE is_supplier = 1

-- View all orders in preparation
SELECT reference, order_date FROM sale_order WHERE order_state = 'confirmed'

-- View all orders ready to delivery
SELECT reference, order_date FROM sale_order WHERE order_state = 'done'

-- View all orders in delivery
SELECT reference, order_date FROM sale_order AS o
INNER JOIN package AS k ON k.sale_order_id = o.id
INNER JOIN delivery AS d ON d.package_id = k.id
WHERE d.delivery_state = 'confirmed'

-- View all orders delivery
SELECT reference, order_date FROM sale_order AS o 
INNER JOIN package AS k ON k.sale_order_id = o.id
INNER JOIN delivery AS d ON d.package_id = k.id
WHERE d.delivery_state = 'done'

-- See all orders canceled
SELECT reference, order_date FROM sale_order AS o 
INNER JOIN package AS k ON k.sale_order_id = o.id
INNER JOIN delivery AS d ON d.package_id = k.id
WHERE d.delivery_state = 'canceled' OR o.order_state = 'canceled'

-- See products in stock if the quantity is less than 10 in point of sale's Lille
SELECT product_name, q.qty_in_pos FROM product AS p
INNER JOIN pos_product AS q ON q.product_id = p.id
WHERE q.pos_id = 1 AND qty_in_pos < 10 AND p.category_id != 1

-- See all stocks
SELECT product_name, q.qty_in_pos, pos.pos_name FROM product as p 
INNER JOIN pos_product AS q ON q.product_id = p.id 
INNER JOIN point_of_sale AS pos ON pos.id = q.pos_id
WHERE p.category_id != 1

-- See the delivery address if home_delivery
SELECT u.user_name, u.user_firstname, a.address_way, a.zip, a.city, a.country, u.phone_number FROM address_oc AS a
INNER JOIN user_oc AS u ON u.id = a.user_id
INNER JOIN sale_order AS s ON s.user_id = a.user_id
INNER JOIN package AS k ON k.sale_order_id = s.id
INNER JOIN delivery AS d ON d.package_id = k.id
WHERE s.home_delivery = 1 AND d.delivery_state = 'confirmed'

-- View access for employees
SELECT u.user_name, u.user_firstname, a.access_name, a.comment FROM user_oc AS u
INNER JOIN access AS a
WHERE u.is_employee = 1

-- View sale access for employees in a specific point of sale (Paris)
SELECT u.user_name, u.user_firstname, a.access_name, a.comment FROM user_oc AS u
INNER JOIN access AS a ON u.sale_access = a.id
WHERE u.pos_id = 2 AND u.is_employee = 1

-- View purchase access for employees in a specific point of sale (Paris)
SELECT u.user_name, u.user_firstname, a.access_name, a.comment FROM user_oc AS u
INNER JOIN access AS a ON u.purchase_access = a.id
WHERE u.pos_id = 2 AND u.is_employee = 1

-- View detail point of sale access for employees in a specific point of sale (Paris)
SELECT u.user_name, u.user_firstname, a.access_name, a.comment FROM user_oc AS u
INNER JOIN access AS a ON u.detail_pos_access = a.id
WHERE u.pos_id = 2 AND u.is_employee = 1

-- View the number of customer in a pos (Paris)
SELECT COUNT(*) FROM user_oc WHERE is_customer = 1 AND pos_id = 2

-- View the number of customer in all points of sale
SELECT COUNT(*) FROM user_oc WHERE is_customer = 1

-- View the number of employees in all points of sale
SELECT COUNT(*) FROM user_oc WHERE is_employee = 1

-- View the recipe's pizza Norvégienne (id = 1)
SELECT p.product_name, pt.topping_qty_used_for_pizza, pt.unit_of_measure FROM product AS p
INNER JOIN product_topping AS pt ON pt.topping_id = p.id AND pt.product_id = 1
