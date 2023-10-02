
-- SQL schema for OMS application

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
    osoite_id INT AUTO_INCREMENT PRIMARY KEY,
    asiakas_id INT,
    address_type ENUM('Shipping', 'Billing'), 
    katu_osoite VARCHAR(255),
    kaupunki VARCHAR(255),
    state VARCHAR(255),
    postal_code VARCHAR(10),
    maa VARCHAR(255)
);

-- products table 
CREATE TABLE IF NOT EXISTS Products (
    tuote_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255),
    product_description TEXT,
    price DECIMAL(10, 2) 
);

-- orders table 
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    asiakas_id INT,
    tuote_id INT,
    order_date DATE,
    maara INT,
    total_price DECIMAL(10, 2), 
    FOREIGN KEY (client_id) REFERENCES Clients(client_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- payment transactions table 
CREATE TABLE IF NOT EXISTS PaymentTransactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    tilaus_id INT,
    payment_date DATE,
    payment_amount DECIMAL(10, 2), 
    payment_method VARCHAR(255)
);

- billing addresses table
CREATE TABLE IF NOT EXISTS BillingAddresses (
    billing_address_id INT AUTO_INCREMENT PRIMARY KEY,
    asiakas_id INT,
    katu_osoite VARCHAR(255),
    kaupunki VARCHAR(255),
    state VARCHAR(255),
    postal_code VARCHAR(10),
    maa VARCHAR(255),
    FOREIGN KEY (client_id) REFERENCES Clients(client_id)
);
