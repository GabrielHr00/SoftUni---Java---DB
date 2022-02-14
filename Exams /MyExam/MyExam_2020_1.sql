-- DROP DATABASE online_store;
CREATE DATABASE online_store;
USE online_store;


CREATE TABLE customers(
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    phone VARCHAR(30) NOT NULL UNIQUE,
    address VARCHAR(60) NOT NULL,
    discount_card BIT NOT NULL DEFAULT FALSE
);

CREATE TABLE orders(
	id INT AUTO_INCREMENT PRIMARY KEY,
    order_datetime DATETIME NOT NULL,
    customer_id INT NOT NULL,
    CONSTRAINT fk_cust
    FOREIGN KEY (customer_id)
    REFERENCES customers(id)
);


CREATE TABLE reviews(
	id INT AUTO_INCREMENT PRIMARY KEY,
    content TEXT,
    rating DECIMAL(10,2) NOT NULL,
    picture_url VARCHAR(80) NOT NULL,
    published_at DATETIME NOT NULL
);


CREATE TABLE brands(
	id INT AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(40) NOT NULL UNIQUE
);


CREATE TABLE categories(
	id INT AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(40) NOT NULL UNIQUE
);


CREATE TABLE products(
	id INT AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(40) NOT NULL,
    price DECIMAL(19,2) NOT NULL,
    quantity_in_stock INT,
    description TEXT,
    brand_id INT NOT NULL,
    category_id INT NOT NULL,
    review_id INT,
    CONSTRAINT fk_br 
    FOREIGN KEY (brand_id)
    REFERENCES brands(id),
    CONSTRAINT fk_cat 
    FOREIGN KEY (category_id)
    REFERENCES categories(id),
    CONSTRAINT fk_rev 
    FOREIGN KEY (review_id)
    REFERENCES reviews(id)
);

CREATE TABLE orders_products(
	order_id INT,
    product_id INT,
    CONSTRAINT fk_or 
    FOREIGN KEY (order_id)
    REFERENCES orders(id),
	CONSTRAINT fk_pr 
    FOREIGN KEY (product_id)
    REFERENCES products(id)
);



