--CREATE customer table 
CREATE TABLE customer (
	customer_key number(6) NOT NULL,
	clinic_name varchar(15) NOT NULL,
	license_number varchar(10) NOT NULL,
	dentist_name varchar(10) NOT NULL,
	phone_number varchar(15),
	PRIMARY KEY(customer_key)
);

--ADD colum
ALTER TABLE customer ADD (order_amount NUMBER(10));

SELECT *
FROM customer;



