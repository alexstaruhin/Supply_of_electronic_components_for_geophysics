##### Supply_of_electronic_components SQL Project  

###########################  DDL ############################

CREATE TABLE country (
    country_id bigint NOT NULL PRIMARY KEY,
    country character varying(50),
    CONSTRAINT country_constraint UNIQUE(country)
);

CREATE TABLE element (
    element_id bigint NOT NULL PRIMARY KEY,
    element character varying(100),
    CONSTRAINT element_constraint UNIQUE(element)
);

CREATE TABLE order_status (
    order_status_id bigint NOT NULL PRIMARY KEY,
    order_status character varying(50)
);

CREATE TABLE production (
    production_id bigint NOT NULL PRIMARY KEY,
    production character varying(100),
    country_id bigint REFERENCES country(country_id)
);

CREATE TABLE type (
    type_id bigint NOT NULL PRIMARY KEY,
    type character varying(100),
    CONSTRAINT type_constraint UNIQUE(type)
);

CREATE TABLE component (
    component_id bigint NOT NULL PRIMARY KEY,
    component_name character varying(100),
    type_id bigint REFERENCES type(type_id),
    element_id bigint REFERENCES element(element_id),
    price numeric(9,2),
    production_id bigint REFERENCES production(production_id)
);

CREATE TABLE storage (
    storage_id bigint NOT NULL PRIMARY KEY,
    component_id bigint REFERENCES component(component_id),
    amount integer
);

CREATE TABLE supply (
    supply_id bigint NOT NULL PRIMARY KEY,
    component_id bigint REFERENCES component(component_id),
    amount integer,
    order_date date,
    order_status_id bigint REFERENCES order_status(order_status_id),
    delivery_date date
);

###########################  DML ############################

## Importing the Data

COPY country from 'D:\python\Supply_of_electronic_components_for_geophysics\source\country.csv' DELIMITER ',' CSV HEADER;

COPY element from 'D:\python\Supply_of_electronic_components_for_geophysics\source\element.csv' DELIMITER ',' CSV HEADER;

COPY order_status from 'D:\python\Supply_of_electronic_components_for_geophysics\source\order_status.csv' DELIMITER ',' CSV HEADER;

COPY production from 'D:\python\Supply_of_electronic_components_for_geophysics\source\production.csv' DELIMITER ',' CSV HEADER;

COPY type from 'D:\python\Supply_of_electronic_components_for_geophysics\source\type.csv' DELIMITER ',' CSV HEADER;

COPY component from 'D:\python\Supply_of_electronic_components_for_geophysics\source\component.csv' DELIMITER ',' CSV HEADER;

COPY storage from 'D:\python\Supply_of_electronic_components_for_geophysics\source\storage.csv' DELIMITER ',' CSV HEADER;

COPY supply from 'D:\python\Supply_of_electronic_components_for_geophysics\source\supply.csv' DELIMITER ',' CSV HEADER;

#Fetch all records about storage

SELECT component_name AS Наименование, 
	type AS Тип, 
	element AS Элемент, 
	country AS Страна, 
	production AS Производство,
	storage.amount AS Количество, 
	price AS Цена, 
	price * amount AS Стоимость
FROM
	storage
	INNER JOIN component ON storage.component_id = component.component_id
	INNER JOIN type ON type.type_id = component.type_id
	INNER JOIN element ON element.element_id = component.element_id
	INNER JOIN production ON production.production_id = component.production_id
	INNER JOIN country ON production.country_id = country.country_id;

#The cost of items in storage and in supply, the total cost

SELECT component_name AS Наименование,
	price AS Цена,
	storage.amount AS Количество,
	price * storage.amount as Стоимость_склада,
	COALESCE(supply.amount, 0) AS Поставки,
	price * COALESCE(supply.amount, 0) AS Стоимость_поставок,
	COALESCE(supply.amount, 0) + storage.amount AS Общее_количество,
	(COALESCE(supply.amount, 0) + storage.amount) * price AS Общая_стоимость
FROM
	storage
	INNER JOIN component ON storage.component_id = component.component_id
	INNER JOIN type ON type.type_id = component.type_id
	INNER JOIN element ON element.element_id = component.element_id
	INNER JOIN production ON production.production_id = component.production_id
	LEFT JOIN supply ON supply.component_id = component.component_id;

#Top 10 most numerous elements

SELECT component_name AS Наименование, 
	type AS Тип, 
	element AS Элемент, 
	production AS Производство,
	storage.amount AS Количество, 
	price AS Цена, 
	price * amount AS Стоимость
FROM
	storage
	INNER JOIN component ON storage.component_id = component.component_id
	INNER JOIN type ON type.type_id = component.type_id
	INNER JOIN element ON element.element_id = component.element_id
	INNER JOIN production ON production.production_id = component.production_id
ORDER BY 5 DESC
LIMIT 10;

#The cost of different types of elements

SELECT type AS Тип, 
	round(avg(price), 2) AS Средняя_цена, 
	SUM(amount) AS Количество,
	SUM(amount * price) AS Стоимость
FROM
	storage
	INNER JOIN component ON storage.component_id = component.component_id
	INNER JOIN type ON type.type_id = component.type_id
GROUP BY 1
ORDER BY 3 DESC;

#The total cost of the storage

SELECT SUM(amount * price) AS Общая_стоимость
FROM
	storage
	INNER JOIN component ON storage.component_id = component.component_id;

#Delivery tracking

SELECT component_name AS Название_элемента,
	price AS Цена,
	amount AS Количество,
	order_date AS Дата_заказа,
	order_status AS Статус_заказа,
	delivery_date as Дата_доставки,
	price * amount as Сумма_заказа
FROM
	supply
	INNER JOIN component ON supply.component_id = component.component_id
	INNER JOIN order_status ON supply.order_status_id = order_status.order_status_id;