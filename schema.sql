CREATE DATABASE IF NOT EXISTS ClientRegistryDB;
USE ClientRegistryDB;

-- clients table 
CREATE TABLE IF NOT EXISTS Clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    etuNimi VARCHAR(255),
    sukuNimi VARCHAR(255),
    puhelinNumero VARCHAR(15),
    osoite VARCHAR(255)
);

-- addresses table 
CREATE TABLE IF NOT EXISTS Addresses (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    address_type ENUM('Shipping', 'Billing'), 
    street_address VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    postal_code VARCHAR(10),
    country VARCHAR(255)
);

-- Products table 
CREATE TABLE IF NOT EXISTS Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255),
    product_description TEXT,
    price DECIMAL(10, 2) 
);

-- orders table 
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    total_price DECIMAL(10, 2), 
    FOREIGN KEY (client_id) REFERENCES Clients(client_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- payment transactions table 
CREATE TABLE IF NOT EXISTS PaymentTransactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    payment_amount DECIMAL(10, 2), 
    payment_method VARCHAR(255)
);

- billing addresses table
CREATE TABLE IF NOT EXISTS BillingAddresses (
    billing_address_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    street_address VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    postal_code VARCHAR(10),
    country VARCHAR(255),
    FOREIGN KEY (client_id) REFERENCES Clients(client_id)
);
