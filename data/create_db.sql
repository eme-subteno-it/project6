SET NAMES UTF8MB4;

-- ------------------------------------------------
-- Database oc_pizza
-- ------------------------------------------------

CREATE DATABASE IF NOT EXISTS oc_pizza;
USE oc_pizza;

-- ------------------------------------------------
-- Table oc_pizza.access
-- ------------------------------------------------

CREATE TABLE IF NOT EXISTS access (
    id INT NOT NULL AUTO_INCREMENT,
    access_name VARCHAR(45) NOT NULL,
    comment TEXT NOT NULL,
    PRIMARY KEY (id)
)
ENGINE=InnoDB;

-- ------------------------------------------------
-- Table oc_pizza.point_of_sale
-- ------------------------------------------------

CREATE TABLE IF NOT EXISTS point_of_sale (
    id INT NOT NULL AUTO_INCREMENT,
    pos_name VARCHAR(45) NOT NULL,
    PRIMARY KEY (id)
)
ENGINE=InnoDB;

-- ------------------------------------------------
-- Table oc_pizza.company
-- ------------------------------------------------

CREATE TABLE IF NOT EXISTS company (
    id INT NOT NULL AUTO_INCREMENT,
    company_name VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    PRIMARY KEY (id)
)
ENGINE=InnoDB;

-- ------------------------------------------------
-- Table oc_pizza.user_oc
-- ------------------------------------------------

CREATE TABLE IF NOT EXISTS user_oc (
    id INT NOT NULL AUTO_INCREMENT,
    user_name VARCHAR(45) NOT NULL,
    user_firstname VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    user_pass VARCHAR(255) NOT NULL,
    is_customer BOOLEAN NOT NULL,
    is_supplier BOOLEAN NOT NULL,
    is_employee BOOLEAN NOT NULL,
    company_id INT NULL,
    pos_id INT NOT NULL,
    sale_access INT NOT NULL,
    purchase_access INT NOT NULL,
    detail_pos_access INT NOT NULL,
    CONSTRAINT fk_user_company_id
        FOREIGN KEY (company_id)
        REFERENCES company(id),
    CONSTRAINT fk_user_pos_id
        FOREIGN KEY (pos_id)
        REFERENCES point_of_sale(id),
    CONSTRAINT fk_user_sale_access_id
        FOREIGN KEY (sale_access)
        REFERENCES access(id),
    CONSTRAINT fk_user_purchase_access_id
        FOREIGN KEY (purchase_access)
        REFERENCES access(id),
    CONSTRAINT fk_user_detail_pos_access_id
        FOREIGN KEY (detail_pos_access)
        REFERENCES access(id),
    PRIMARY KEY (id)
)
ENGINE=InnoDB;

-- ------------------------------------------------
-- Table oc_pizza.address_oc
-- ------------------------------------------------

CREATE TABLE IF NOT EXISTS address_oc (
    id INT NOT NULL AUTO_INCREMENT,
    address_way VARCHAR(45) NOT NULL,
    city VARCHAR(45) NOT NULL,
    country VARCHAR(45) NOT NULL,
    zip VARCHAR(45) NOT NULL,
    user_id INT NULL,
    pos_id INT NULL,
    CONSTRAINT fk_address_user_id
        FOREIGN KEY (user_id)
        REFERENCES user_oc(id),
    CONSTRAINT fk_address_pos_id
        FOREIGN KEY (pos_id)
        REFERENCES point_of_sale(id),
    PRIMARY KEY (id)
)
ENGINE=InnoDB;

-- ------------------------------------------------
-- Table oc_pizza.category
-- ------------------------------------------------

CREATE TABLE IF NOT EXISTS category (
    id INT NOT NULL AUTO_INCREMENT,
    category_name VARCHAR(45) NOT NULL,
    PRIMARY KEY (id)
)
ENGINE=InnoDB;

-- ------------------------------------------------
-- Table oc_pizza.origin
-- ------------------------------------------------

CREATE TABLE IF NOT EXISTS origin (
    id INT NOT NULL AUTO_INCREMENT,
    origin_name VARCHAR(20) NOT NULL,
    PRIMARY KEY (id)
)
ENGINE=InnoDB;

-- ------------------------------------------------
-- Table oc_pizza.payment
-- ------------------------------------------------

CREATE TABLE IF NOT EXISTS payment (
    id INT NOT NULL AUTO_INCREMENT,
    payment_method VARCHAR(45) NOT NULL,
    api_token VARCHAR(255) NULL,
    is_available BOOLEAN NOT NULL,
    PRIMARY KEY (id)
)
ENGINE=InnoDB;

-- ------------------------------------------------
-- Table oc_pizza.sale_order
-- ------------------------------------------------

CREATE TABLE IF NOT EXISTS sale_order (
    id INT NOT NULL AUTO_INCREMENT,
    reference VARCHAR(45) NOT NULL,
    order_date TIMESTAMP NOT NULL,
    order_state VARCHAR(20) NOT NULL,
    home_delivery BOOLEAN NOT NULL,
    pos_id INT NOT NULL,
    payment_id INT NOT NULL,
    user_id INT NOT NULL,
    origin_id INT NOT NULL,
    CONSTRAINT fk_sale_pos_id
        FOREIGN KEY (pos_id)
        REFERENCES point_of_sale(id),
    CONSTRAINT fk_sale_payment_id
        FOREIGN KEY (payment_id)
        REFERENCES payment(id),
    CONSTRAINT fk_sale_user_id
        FOREIGN KEY (user_id)
        REFERENCES user_oc(id),
    CONSTRAINT fk_sale_origin_id
        FOREIGN KEY (origin_id)
        REFERENCES origin(id),
    PRIMARY KEY (id)
)
ENGINE=InnoDB;

-- ------------------------------------------------
-- Table oc_pizza.package
-- ------------------------------------------------

CREATE TABLE IF NOT EXISTS package (
    id INT NOT NULL AUTO_INCREMENT,
    package_name VARCHAR(45) NOT NULL,
    sale_order_id INT NOT NULL,
    CONSTRAINT fk_package_sale_order_id
        FOREIGN KEY (sale_order_id)
        REFERENCES sale_order(id),
    PRIMARY KEY (id)
)
ENGINE=InnoDB;

-- ------------------------------------------------
-- Table oc_pizza.delivery
-- ------------------------------------------------

CREATE TABLE IF NOT EXISTS delivery (
    id INT NOT NULL AUTO_INCREMENT,
    delivery_date TIMESTAMP NOT NULL,
    delivery_state VARCHAR(20) NOT NULL,
    package_id INT NOT NULL,
    CONSTRAINT fk_delivery_package_id
        FOREIGN KEY (package_id)
        REFERENCES package(id),
    PRIMARY KEY (id)
)
ENGINE=InnoDB;

-- ------------------------------------------------
-- Table oc_pizza.invoice
-- ------------------------------------------------

CREATE TABLE IF NOT EXISTS invoice (
    id INT NOT NULL AUTO_INCREMENT,
    invoice_date TIMESTAMP NOT NULL,
    delivery_id INT NOT NULL,
    CONSTRAINT fk_invoice_delivery_id
        FOREIGN KEY (delivery_id)
        REFERENCES delivery(id),
    PRIMARY KEY (id)
)
ENGINE=InnoDB;

-- ------------------------------------------------
-- Table oc_pizza.product
-- ------------------------------------------------

CREATE TABLE IF NOT EXISTS product (
    id INT NOT NULL AUTO_INCREMENT,
    product_name VARCHAR(45) NOT NULL,
    unit_price DECIMAL(10, 2) NULL,
    product_description TEXT NOT NULL,
    unit_of_measure VARCHAR(20) NOT NULL,
    category_id INT NOT NULL,
    CONSTRAINT fk_product_category_id
        FOREIGN KEY (category_id)
        REFERENCES category(id),
    PRIMARY KEY (id)
)
ENGINE=InnoDB;

-- ------------------------------------------------
-- Table oc_pizza.purchase_order
-- ------------------------------------------------

CREATE TABLE IF NOT EXISTS purchase_order (
    id INT NOT NULL AUTO_INCREMENT,
    reference VARCHAR(45) NOT NULL,
    purchase_date TIMESTAMP NOT NULL,
    purchase_state VARCHAR(20) NOT NULL,
    pos_id INT NOT NULL,
    user_id INT NOT NULL,
    CONSTRAINT fk_purchase_pos_id
        FOREIGN KEY (pos_id)
        REFERENCES point_of_sale(id),
    CONSTRAINT fk_purchase_user_id
        FOREIGN KEY (user_id)
        REFERENCES user_oc(id),
    PRIMARY KEY (id)
)
ENGINE=InnoDB;

-- ------------------------------------------------
-- Table oc_pizza.receipt
-- ------------------------------------------------

CREATE TABLE IF NOT EXISTS receipt (
    id INT NOT NULL AUTO_INCREMENT,
    receipt_date TIMESTAMP NOT NULL,
    receipt_state VARCHAR(20) NOT NULL,
    purchase_order_id INT NOT NULL,
    CONSTRAINT fk_receipt_purchase_order_id
        FOREIGN KEY (purchase_order_id)
        REFERENCES purchase_order(id),
    PRIMARY KEY (id)
)
ENGINE=InnoDB;

-- ------------------------------------------------
-- Table oc_pizza.product_topping
-- ------------------------------------------------

CREATE TABLE IF NOT EXISTS product_topping (
    product_id INT NOT NULL,
    topping_id INT NOT NULL,
    topping_qty_used_for_pizza INT NOT NULL,
    unit_of_measure VARCHAR(20) NOT NULL,
    CONSTRAINT fk_product_product_id
        FOREIGN KEY (product_id)
        REFERENCES product(id),
    CONSTRAINT fk_topping_product_id
        FOREIGN KEY (topping_id)
        REFERENCES product(id)
)
ENGINE=InnoDB;

-- ------------------------------------------------
-- Table oc_pizza.pos_product
-- ------------------------------------------------

CREATE TABLE IF NOT EXISTS pos_product (
    pos_id INT NOT NULL,
    product_id INT NOT NULL,
    qty_in_pos DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_p_product_pos_id
        FOREIGN KEY (pos_id)
        REFERENCES point_of_sale(id),
    CONSTRAINT fk_p_product_product_id
        FOREIGN KEY (product_id)
        REFERENCES product(id)
)
ENGINE=InnoDB;

-- ------------------------------------------------
-- Table oc_pizza.purchase_orderline
-- ------------------------------------------------

CREATE TABLE IF NOT EXISTS purchase_orderline (
    purchase_order_id INT NOT NULL,
    product_id INT NOT NULL,
    qty DECIMAL(10, 2) NOT NULL,
    tax_rate DECIMAL(6, 4) NOT NULL,
    CONSTRAINT fk_purchase_orderline_orderline_id
        FOREIGN KEY (purchase_order_id)
        REFERENCES purchase_order(id),
    CONSTRAINT fk_purchase_orderline_product_id
        FOREIGN KEY (product_id)
        REFERENCES product(id)
)
ENGINE=InnoDB;

-- ------------------------------------------------
-- Table oc_pizza.sale_orderline
-- ------------------------------------------------

CREATE TABLE IF NOT EXISTS sale_orderline (
    sale_order_id INT NOT NULL,
    product_id INT NOT NULL,
    qty DECIMAL(10, 2) NOT NULL,
    tax_rate DECIMAL(6, 4) NOT NULL,
    CONSTRAINT fk_sale_orderline_orderline_id
        FOREIGN KEY (sale_order_id)
        REFERENCES sale_order(id),
    CONSTRAINT fk_sale_orderline_product_id
        FOREIGN KEY (product_id)
        REFERENCES product(id)
)
ENGINE=InnoDB;
