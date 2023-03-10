import psycopg2
from psycopg2 import OperationalError

#Пароль пользователя
password = "123456"
#Название базы данных
name_database = "supply_of_electronic_components_for_geophysics"
#Адрес директории проекта
dir_addres = """D:\python\Supply_of_electronic_components_for_geophysics\source"""


#Функция подключения к базе данных
def create_connection(db_name, db_user, db_password, db_host, db_port):
    connection = None
    try:
        connection = psycopg2.connect(
            database=db_name,
            user=db_user,
            password=db_password,
            host=db_host,
            port=db_port,
        )
        print("Connection to PostgreSQL DB successful")
    except OperationalError as e:
        print(f"The error '{e}' occurred")
    return connection

#Подключение к базе данных
connection = create_connection(
    "postgres", "postgres", password, "127.0.0.1", "5432"
)


#Функция создания базы данных
def create_database(connection, query):
    connection.autocommit = True
    cursor = connection.cursor()
    try:
        cursor.execute(query)
        print("Query executed successfully")
    except OperationalError as e:
        print(f"The error '{e}' occurred")

#Создание базы данных
create_database_query = "CREATE DATABASE " + name_database
create_database(connection, create_database_query)


#Подключение к созданной базе данных
connection = create_connection(
    name_database, "postgres", password, "127.0.0.1", "5432"
)


#Функция для организации таблиц
def execute_query(connection, query):
    connection.autocommit = True
    cursor = connection.cursor()
    try:
        cursor.execute(query)
        print("Query executed successfully")
    except OperationalError as e:
        print(f"The error '{e}' occurred")

###########################  DDL ############################

create_country_table = """
CREATE TABLE country (
    country_id bigint NOT NULL PRIMARY KEY,
    country character varying(50),
    CONSTRAINT country_constraint UNIQUE(country)
)
"""

execute_query(connection, create_country_table)


create_element_table = """
CREATE TABLE element (
    element_id bigint NOT NULL PRIMARY KEY,
    element character varying(100),
    CONSTRAINT element_constraint UNIQUE(element)
)
"""

execute_query(connection, create_element_table)


create_order_status_table = """
CREATE TABLE order_status (
    order_status_id bigint NOT NULL PRIMARY KEY,
    order_status character varying(50)
)
"""

execute_query(connection, create_order_status_table)


create_production_table = """
CREATE TABLE production (
    production_id bigint NOT NULL PRIMARY KEY,
    production character varying(100),
    country_id bigint REFERENCES country(country_id)
)
"""

execute_query(connection, create_production_table)


create_type_table = """
CREATE TABLE type (
    type_id bigint NOT NULL PRIMARY KEY,
    type character varying(100),
    CONSTRAINT type_constraint UNIQUE(type)
)
"""

execute_query(connection, create_type_table)


create_component_table = """
CREATE TABLE component (
    component_id bigint NOT NULL PRIMARY KEY,
    component_name character varying(100),
    type_id bigint REFERENCES type(type_id),
    element_id bigint REFERENCES element(element_id),
    price numeric(9,2),
    production_id bigint REFERENCES production(production_id)
)
"""

execute_query(connection, create_component_table)


create_storage_table = """
CREATE TABLE storage (
    storage_id bigint NOT NULL PRIMARY KEY,
    component_id bigint REFERENCES component(component_id),
    amount integer
)
"""

execute_query(connection, create_storage_table)


create_supply_table = """
CREATE TABLE supply (
    supply_id bigint NOT NULL PRIMARY KEY,
    component_id bigint REFERENCES component(component_id),
    amount integer,
    order_date date,
    order_status_id bigint REFERENCES order_status(order_status_id),
    delivery_date date
)
"""

execute_query(connection, create_supply_table)

###########################  DML ############################

fill_country_table = """
COPY country from '""" + dir_addres + """\country.csv' DELIMITER ',' CSV HEADER
"""

execute_query(connection, fill_country_table)


fill_element_table = """
COPY element from '""" + dir_addres + """\element.csv' DELIMITER ',' CSV HEADER
"""

execute_query(connection, fill_element_table)


fill_order_status_table = """
COPY order_status from '""" + dir_addres + """\order_status.csv' DELIMITER ',' CSV HEADER
"""

execute_query(connection, fill_order_status_table)


fill_production_table = """
COPY production from '""" + dir_addres + """\production.csv' DELIMITER ',' CSV HEADER
"""

execute_query(connection, fill_production_table)


fill_type_table = """
COPY type from '""" + dir_addres + """\\type.csv' DELIMITER ',' CSV HEADER
"""

execute_query(connection, fill_type_table)


fill_component_table = """
COPY component from '""" + dir_addres + """\component.csv' DELIMITER ',' CSV HEADER
"""

execute_query(connection, fill_component_table)


fill_storage_table = """
COPY storage from '""" + dir_addres + """\storage.csv' DELIMITER ',' CSV HEADER
"""

execute_query(connection, fill_storage_table)


fill_supply_table = """
COPY supply from '""" + dir_addres + """\supply.csv' DELIMITER ',' CSV HEADER
"""

execute_query(connection, fill_supply_table)