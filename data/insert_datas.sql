-- ------------------------------------------------
-- Table oc_pizza.access
-- ------------------------------------------------
INSERT INTO access (access_name, comment) VALUES
('no access', 'No access authorized'),
('access right', "The user can read the informations and create it. He can't delete."),
('all access', 'The user has all access. He can read, write and delete the informations.');

-- ------------------------------------------------
-- Table oc_pizza.point_of_sale
-- ------------------------------------------------
INSERT INTO point_of_sale (pos_name) VALUES
('Restaurant de Lille'),
('Restaurant de Paris'),
('Restaurant de Lyon'),
('Restaurant de Strasbourg');

-- ------------------------------------------------
-- Table oc_pizza.company
-- ------------------------------------------------
INSERT INTO company (company_name, email, phone_number) VALUES
('Le légumier', 'legumier@legumier.fr', '024355636765'),
('Fruitis', 'fruitis@fruitis.com', '024355636765'),
('Le laitier', 'laitier@laitier.fr', '024355636765'),
('Poissonerie', 'poissonerie@poissonnerie.com', '024355636765');

-- ------------------------------------------------
-- Table oc_pizza.user_oc
-- ------------------------------------------------

INSERT INTO user_oc (user_name, user_firstname, email, phone_number, user_pass, is_customer, is_supplier, is_employee, company_id, pos_id, sale_access, purchase_access, detail_pos_access) VALUES
-- Customer
('Dupont', 'Franck', 'fd@dupont.fr', '0233281712', '9cf95dacd226dcf43da376cdb6cbba7035218921', 1, 0, 0, NULL, 2, 1, 1, 1),
('Dupont', 'Elodie', 'ed@dupont.fr', '0233243712', '9cf95dacd226dcf43da432cdb6cbba7035218456', 1, 0, 0, NULL, 2, 1, 1, 1),
('Dupont', 'Antoine', 'ad@dupont.fr', '0233243712', '9cf95dacd226dcf43da432cdb6cbba7035218456', 1, 0, 0, NULL, 4, 1, 1, 1),
('Dupont', 'Mélanie', 'mela@dupont.fr', '0233243712', '9cf95dacd226dcf43da432cdb6cbba7035218456', 1, 0, 0, NULL, 4, 1, 1, 1),
('Bolieu', 'Aurélie', 'aurelie@bolieu.fr', '0233243712', '9cf95dacd226dcf43da432cdb6cbba7035218456', 1, 0, 0, NULL, 4, 1, 1, 1),
('Bolieu', 'Eden', 'eden@bolieu.fr', '0233243712', '9cf95dacd226dcf43da432cdb6cbba7035218456', 1, 0, 0, NULL, 4, 1, 1, 1),
('Dupont', 'Cyril', 'mela@dupont.fr', '0233243712', '9cf95dacd226dcf43da432cdb6cbba7035218456', 1, 0, 0, NULL, 4, 1, 1, 1),
('Dupont', 'Julie', 'mela@dupont.fr', '0233243712', '9cf95dacd226dcf43da432cdb6cbba7035218456', 1, 0, 0, NULL, 4, 1, 1, 1),

-- Employee - POS : Paris
('Dupont', 'Étienne', 'etienned@dupont.fr', '0233243712', '9cf95dacd226dcf43da432cdb6cbba7035218456', 0, 0, 1, NULL, 2, 2, 1, 1),
('Dupont', 'Jean', 'jeand@dupont.fr', '0233243712', '9cf95dacd226dcf43da432cdb6cbba7035218456', 0, 0, 1, NULL, 2, 2, 1, 1),
('Dupont', 'Julie', 'julied@dupont.fr', '0233243712', '9cf95dacd226dcf43da432cdb6cbba7035218456', 0, 0, 1, NULL, 2, 3, 3, 2),
('Dupont', 'Sébastien', 'sd@dupont.fr', '0233243712', '9cf95dacd226dcf43da432cdb6cbba7035218456', 0, 0, 1, NULL, 2, 3, 3, 3),
-- Employee - POS : Strasbourg
('Dupont', 'Fabrice', 'fd@dupont.fr', '0233243712', '9cf95dacd226dcf43da432cdb6cbba7035218456', 0, 0, 1, NULL, 4, 2, 1, 1),
('Dupont', 'Magalie', 'md@dupont.fr', '0233243712', '9cf95dacd226dcf43da432cdb6cbba7035218456', 0, 0, 1, NULL, 4, 2, 1, 1),
('Dupont', 'Fabien', 'fabiend@dupont.fr', '0233243712', '9cf95dacd226dcf43da432cdb6cbba7035218456', 0, 0, 1, NULL, 4, 3, 3, 2),
('Dupont', 'Chris', 'chrisd@dupont.fr', '0233243712', '9cf95dacd226dcf43da432cdb6cbba7035218456', 0, 0, 1, NULL, 4, 3, 3, 3),
-- Employee - POS : Lyon
('Dupont', 'Coralie', 'coralied@dupont.fr', '0233243712', '9cf95dacd226dcf43da432cdb6cbba7035218456', 0, 0, 1, NULL, 3, 2, 1, 1),
('Dupont', 'Martin', 'martin@dupont.fr', '0233243712', '9cf95dacd226dcf43da432cdb6cbba7035218456', 0, 0, 1, NULL, 3, 2, 1, 1),
('Dupont', 'Chloé', 'chloe@dupont.fr', '0233243712', '9cf95dacd226dcf43da432cdb6cbba7035218456', 0, 0, 1, NULL, 3, 3, 3, 2),
('Dupont', 'Pauline', 'pauline@dupont.fr', '0233243712', '9cf95dacd226dcf43da432cdb6cbba7035218456', 0, 0, 1, NULL, 3, 3, 3, 3),
-- Supplier
('Raton', 'Coralie ', 'coralied@raton.fr', '0233243712', '9cf95dacd226dcf43da432cdb6cbba7035218456', 0, 0, 1, 3, 3, 2, 1, 1),
('Raton', 'Martin', 'martin@raton.fr', '0233243712', '9cf95dacd226dcf43da432cdb6cbba7035218456', 0, 0, 1, 2, 3, 2, 1, 1),
('Brache', 'Chloé', 'chloe@raton.fr', '0233243712', '9cf95dacd226dcf43da432cdb6cbba7035218456', 0, 0, 1, 4, 3, 3, 3, 2),
('Resta', 'Pauline', 'pauline@raton.fr', '0233243712', '9cf95dacd226dcf43da432cdb6cbba7035218456', 0, 0, 1, 1, 3, 3, 3, 3);

-- ------------------------------------------------
-- Table oc_pizza.address
-- ------------------------------------------------

INSERT INTO address_oc (address_way, city, country, zip, user_id, pos_id) VALUES
-- For Point of sale
('20 rue de la visite', 'Strasbourg', 'France', '67000', NULL, 4),
('20 rue de la visite', 'Paris', 'France', '01000', NULL, 2),
('20 rue de la visite', 'Lille', 'France', '59000', NULL, 1),
('20 rue de la visite', 'Lyon', 'France', '69000', NULL, 3),
-- For Customer
('10 rue de la bastille', 'Paris', 'France', '01000', 1, NULL),
('20 rue de la visite', 'Lille', 'France', '59000', 2, NULL),
('20 rue de la visite', 'Lyon', 'France', '69000', 3, NULL),
('20 rue des champs', 'Lyon', 'France', '69000', 4, NULL),
-- For Supplier
('20 rue de la visite', 'Paris', 'France', '01000', 17, NULL),
('20 rue de la visite', 'Lille', 'France', '59000', 18, NULL),
('20 rue de la visite', 'Lyon', 'France', '69000', 19, NULL),
('20 rue de la visite', 'Paris', 'France', '01000', 20, NULL);

-- ------------------------------------------------
-- Table oc_pizza.category
-- ------------------------------------------------
INSERT INTO category (category_name) VALUES
('Pizza'),
('Boisson'),
('Dessert'),
('Ingrédient');

-- ------------------------------------------------
-- Table oc_pizza.origin
-- ------------------------------------------------
INSERT INTO origin (origin_name) VALUES
('Site web'),
('Téléphone'),
('Boutique');

-- ------------------------------------------------
-- Table oc_pizza.payment
-- ------------------------------------------------
INSERT INTO payment (payment_method, api_token, is_available) VALUES
('Espèces', NULL, 1),
('Paypal', 'fdstrojfsepadjvfiggrozerjknfsl432j', 1),
('Stripe', NULL, 0),
('Paygreen', 'Fdsfkjrgihsaepfj4325fdsfojg34fdf', 1),
('Virement Bancaire', NULL, 1),
('Carte Bancaire', NULL, 1);

-- ------------------------------------------------
-- Table oc_pizza.sale_order
-- ------------------------------------------------
INSERT INTO sale_order (reference, order_date, order_state, home_delivery, pos_id, payment_id, user_id, origin_id) VALUES
-- 4 states = draft : Panier, confirmed : En prepa, done: ready, canceled
('W43633', '2019-12-04 12:25:35', 'done', 1, 3, 1, 3, 1),
('W43634', '2019-12-05 12:25:35', 'done', 1, 3, 1, 3, 1),
('W43635', '2019-12-06 12:20:35', 'done', 1, 3, 1, 3, 1),
('W43636', '2019-12-06 12:25:35', 'done', 1, 3, 1, 5, 1),
('W43637', '2019-12-22 12:25:35', 'done', 1, 3, 1, 5, 1),
('W43638', '2020-01-02 11:25:35', 'done', 1, 3, 1, 5, 1),
('W43639', '2020-01-02 12:25:35', 'done', 1, 3, 1, 6, 1),
('W43640', '2020-01-03 12:25:35', 'done', 1, 3, 1, 6, 1),
('W43641', '2020-01-04 11:25:35', 'done', 1, 3, 1, 7, 1),
('W43642', '2020-01-04 12:25:35', 'done', 1, 3, 1, 7, 1),
('W43643', '2020-01-05 12:25:35', 'done', 1, 3, 1, 8, 1),
('W43644', '2020-01-06 12:25:35', 'done', 1, 3, 1, 8, 1),
('W43645', '2020-02-06 12:35:35', 'draft', 1, 3, 1, 3, 1),
('W43646', '2020-02-08 12:45:35', 'done', 0, 2, 5, 1, 2),
('W43647', '2020-02-10 20:25:35', 'done', 1, 1, 2, 2, 1),
('W43648', '2020-02-11 21:34:35', 'done', 1, 3, 2, 4, 1),
('W43649', '2020-02-11 20:45:35', 'confirmed', 0, 2, 1, 1, 3);

-- ------------------------------------------------
-- Table oc_pizza.package
-- ------------------------------------------------
INSERT INTO package (package_name, sale_order_id) VALUES
-- The package is create when de sale_order state is done
('COLIS0001', 1),
('COLIS0002', 2),
('COLIS0003', 3),
('COLIS0004', 4),
('COLIS0005', 5),
('COLIS0006', 6),
('COLIS0007', 7),
('COLIS0008', 8),
('COLIS0009', 9),
('COLIS0010', 10),
('COLIS0011', 11),
('COLIS00012', 12),
('COLIS00013', 14),
('COLIS00014', 15),
('COLIS00015', 17);

-- ------------------------------------------------
-- Table oc_pizza.delivery
-- ------------------------------------------------
INSERT INTO delivery (delivery_date, delivery_state, package_id) VALUES
-- 4 states = draft : No validate, confirmed : Validate, done: Delivery, canceled
('2019-12-04 12:45:35', 'done', 1),
('2019-12-05 13:00:35', 'done', 2),
('2019-12-06 13:00:35', 'done', 3),
('2019-12-06 13:03:35', 'done', 4),
('2019-12-22 13:00:35', 'done', 5),
('2020-01-02 13:01:35', 'done', 6),
('2020-01-02 13:00:35', 'done', 7),
('2020-01-03 13:00:35', 'done', 8),
('2020-01-04 13:00:35', 'done', 9),
('2020-01-04 13:02:35', 'done', 10),
('2020-01-05 13:00:35', 'done', 11),
('2020-01-06 12:45:35', 'canceled', 12),
('2020-02-08 13:00:35', 'done', 13),
('2020-02-10 20:35:35', 'confirmed', 14),
('2020-02-11 21:49:35', 'draft', 15);

-- ------------------------------------------------
-- Table oc_pizza.invoice
-- ------------------------------------------------
-- The invoice is create when the delivery form state is confirmed
INSERT INTO invoice (invoice_date, delivery_id) VALUES
('2019-12-04 13:01:35', 1),
('2019-12-05 13:01:35', 2),
('2019-12-06 13:01:35', 3),
('2019-12-06 13:04:35', 4),
('2019-12-22 13:01:35', 5),
('2020-01-02 13:01:35', 6),
('2020-01-02 13:02:35', 7),
('2020-01-03 13:01:35', 8),
('2020-01-04 13:01:35', 9),
('2020-01-04 13:03:35', 10),
('2020-01-05 13:01:35', 11),
('2020-02-08 13:01:35', 13),
('2020-02-10 20:36:35', 14);

-- ------------------------------------------------
-- Table oc_pizza.product
-- ------------------------------------------------
INSERT INTO product (product_name, unit_price, product_description, unit_of_measure, category_id) VALUES
('Pizza Norvégienne', 9.30, 'Pizza au saumon', 'Unité', 1),
('Pizza Napolitaine', 7.20, 'Pizza Italienne classique', 'Unité', 1),
('Coca-cola', 3.10, 'Boisson gazeuse', 'Unité', 2),
('Pizza Savoyarde', 10.30, 'Pizza au fromage', 'Unité', 1),
('Tarte au citron', 3.50, 'Tarte légère au citron et sa meringue', 'Unité', 3),
('Orangina', 3.10, 'Boisson gazeuse', 'Unité', 2),
('Mozzarella', NULL, 'Base des pizzas', 'Gramme', 4),
('Sauce tomate', NULL, 'Base des pizzas', 'Gramme', 4),
('Champignons', NULL, 'Ingrédient pour pizza', 'Gramme', 4),
('Anchois', NULL, 'Ingrédient pour pizza', 'Gramme', 4),
('Jus de pomme', 2.30, 'Jus de pomme frais', 'Unité', 2),
('Saumon fumé', NULL, 'Ingrédient pour pizza', 'Gramme', 4),
('Thon', NULL, 'Ingrédient pour pizza', 'Gramme', 4),
('Crevette', NULL, 'Ingrédient pour pizza', 'Unité', 4),
('Viande haché', NULL, 'Ingrédient pour pizza', 'Gramme', 4),
('Olive', NULL, 'Ingrédient pour pizza', 'Gramme', 4),
('Lait', NULL, 'Ingrédient pour pizza', 'Litre', 4),
('Pizza Neptune', 7.20, 'Pizza au thon', 'Unité', 1);

-- ------------------------------------------------
-- Table oc_pizza.purchase_order
-- ------------------------------------------------
-- 4 states = draft : In create, confirmed : Validate, done: ready, canceled 
INSERT INTO purchase_order (reference, purchase_date, purchase_state, pos_id, user_id) VALUES
('S32542', '2020-02-01 15:12:35', 'draft', 2, 17),
('S32543', '2020-02-02 15:12:35', 'confirmed', 2, 17),
('S32544', '2020-02-05 15:12:35', 'done', 3, 19),
('S32545', '2020-02-06 15:18:35', 'canceled', 3, 19);

-- ------------------------------------------------
-- Table oc_pizza.receipt
-- ------------------------------------------------
-- 4 states = draft : No validate, confirmed : Validate, done: Delivery, canceled
INSERT INTO receipt (receipt_date, receipt_state, purchase_order_id) VALUES
('2020-02-05 15:30:35', 'done', 3),
('2020-02-06 15:25:35', 'draft', 4);

-- ------------------------------------------------
-- Table oc_pizza.product_topping
-- ------------------------------------------------
INSERT INTO product_topping (product_id, topping_id, topping_qty_used_for_pizza, unit_of_measure) VALUES 
(2, 10, 2, 'Gramme'),
(1, 12, 3, 'Gramme'),
(1, 8, 1, 'Cuillière'),
(2, 8, 1, 'Cuillière'),
(4, 8, 1, 'Cuillière'),
(1, 9, 1, 'Poignée'),
(2, 9, 8, 'Poignée'),
(1, 7, 2, 'Gramme'),
(2, 7, 2, 'Gramme'),
(4, 7, 2, 'Gramme'),
(18, 13, 2, 'Poignée'),
(18, 9, 2, 'Poignée'),
(18, 8, 2, 'Cuillère'),
(18, 7, 2, 'Gramme');


-- ------------------------------------------------
-- Table oc_pizza.pos_product
-- ------------------------------------------------
INSERT INTO pos_product (pos_id, product_id, qty_in_pos) VALUES
(1, 3, 30),
(1, 5, 50),
(1, 6, 20),
(1, 8, 11),
(1, 11, 5),
(1, 16, 5),
(1, 15, 9),
(2, 3, 30),
(2, 5, 30),
(2, 6, 30),
(2, 8, 13),
(2, 11, 3),
(2, 16, 3),
(2, 17, 2),
(3, 3, 30),
(3, 5, 30),
(3, 6, 30),
(3, 8, 6),
(3, 11, 3),
(3, 16, 9),
(3, 15, 5),
(4, 3, 30),
(4, 5, 30),
(4, 6, 30),
(4, 8, 3),
(4, 11, 3),
(4, 16, 3),
(4, 15, 3);

-- ------------------------------------------------
-- Table oc_pizza.purchase_orderline
-- ------------------------------------------------
INSERT INTO purchase_orderline (purchase_order_id, product_id, qty, tax_rate) VALUES
(1, 17, 20, 10.0),
(1, 16, 3000, 10.0),
(2, 17, 8, 10.0),
(2, 15, 4000, 10.0),
(2, 14, 100, 10.0),
(3, 12, 2000, 10.0),
(3, 11, 10, 10.0),
(4, 11, 30, 10.0),
(4, 12, 1000, 10.0),
(4, 13, 1000, 10.0);

-- ------------------------------------------------
-- Table oc_pizza.sale_orderline
-- ------------------------------------------------
INSERT INTO sale_orderline (sale_order_id, product_id, qty, tax_rate) VALUES
(1, 2, 2, 10.0),
(1, 2, 2, 10.0),
(1, 5, 2, 10.0),
(2, 2, 2, 10.0),
(3, 2, 2, 10.0),
(4, 5, 2, 10.0),
(5, 2, 2, 10.0),
(6, 2, 2, 10.0),
(6, 2, 2, 10.0),
(6, 2, 2, 10.0),
(7, 2, 2, 10.0),
(7, 5, 2, 10.0),
(7, 2, 2, 10.0),
(8, 2, 2, 10.0),
(9, 2, 2, 10.0),
(9, 2, 2, 10.0),
(10, 2, 2, 10.0),
(10, 2, 2, 10.0),
(11, 2, 2, 10.0),
(11, 5, 2, 10.0),
(12, 2, 2, 10.0),
(12, 3, 5, 10.0),
(12, 1, 3, 10.0),
(13, 2, 4, 10.0),
(14, 18, 1, 10.0),
(15, 1, 4, 10.0),
(15, 2, 4, 10.0),
(14, 3, 4, 10.0),
(13, 6, 4, 10.0),
(16, 2, 3, 10.0),
(16, 3, 3, 10.0),
(17, 1, 4, 10.0),
(17, 6, 4, 10.0);