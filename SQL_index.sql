use hcs5Store

create SCHEMA production;
Go

create SCHEMA sales;
Go


CREATE TABLE production.parts(
    part_id   INT NOT NULL, 
    part_name VARCHAR(100)
);


INSERT INTO 
    production.parts(part_id, part_name)
VALUES (1,'Frame'),
    (2,'Head Tube'),
    (3,'Handlebar Grip'),
    (4,'Shock Absorber'),
    (5,'Fork')


select* from production.parts where part_id=

select part_id,part_name from production.parts where part_id = 5


CREATE TABLE production.part_prices(
    part_id int,
    valid_from date,
    price decimal(18,4) not null,
    PRIMARY KEY(part_id, valid_from) 
);


CREATE CLUSTERED INDEX ix_parts_id
ON production.parts (part_id); 


SELECT 
    part_id, 
    part_name
FROM 
    production.parts
WHERE 
    part_id = 5;

///////non-clustered_indexes

SELECT 
    customer_id, 
    city
FROM 
    sales.customers
WHERE 
    city = 'Atwater';


CREATE INDEX ix_customers_city
ON sales.customers(city);


SELECT 
    customer_id, 
    first_name, 
    last_name
FROM 
    sales.customers
WHERE 
    last_name = 'Berg' AND 
    first_name = 'Monika';

CREATE INDEX ix_customers_name 
ON sales.customers(last_name, first_name);



SELECT 
    customer_id, 
    first_name, 
    last_name
FROM 
    sales.customers
WHERE 
    last_name = 'Berg' AND 
    first_name = 'Monika';

SELECT 
    customer_id, 
    first_name, 
    last_name
FROM 
    sales.customers
WHERE 
    last_name = 'Albert';

SELECT 
    customer_id, 
    first_name, 
    last_name
FROM 
    sales.customers
WHERE 
    first_name = 'Adam';

///// uniquee

CREATE UNIQUE INDEX ix_customers_city
ON sales.customers(city);

SELECT
    customer_id, 
    email 
FROM
    sales.customers
WHERE 
    email = 'caren.stephens@msn.com';

SELECT 
    email, 
    COUNT(email)
FROM 
    sales.customers
GROUP BY 
    email
HAVING 
    COUNT(email) > 1;

CREATE UNIQUE INDEX ix_cust_email 
ON sales.customers(email);

CREATE TABLE t1 (
    a INT, 
    b INT
);

CREATE UNIQUE INDEX ix_uniq_ab 
ON t1(a, b);

INSERT INTO t1(a,b) VALUES(1,1);
INSERT INTO t1(a,b) VALUES(1,2);

























