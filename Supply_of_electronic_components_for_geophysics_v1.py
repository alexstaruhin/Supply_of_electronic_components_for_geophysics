import psycopg2
from psycopg2 import OperationalError

#Пароль пользователя
password = "123456"
#Название базы данных
name_database = "supply_of_electronic_components_for_geophysics_v1"
#Адрес директории проекта
dir_addres = """D:\python\Supply_of_electronic_components_for_geophysics_1\source"""


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

create_architecture_table = """
CREATE TABLE architecture (
    architecture_id bigint NOT NULL PRIMARY KEY,
    architecture character varying(50) NOT NULL,
    CONSTRAINT architecture_constraint UNIQUE(architecture)
)
"""

execute_query(connection, create_architecture_table)


create_component_table = """
CREATE TABLE component (
    component_id bigint NOT NULL PRIMARY KEY,
    component character varying(50) NOT NULL,
    CONSTRAINT component_constraint UNIQUE(component)
)
"""

execute_query(connection, create_component_table)


create_data_interface_table = """
CREATE TABLE data_interface (
    data_interface_id bigint NOT NULL PRIMARY KEY,
    data_interface character varying(50) NOT NULL
)
"""

execute_query(connection, create_data_interface_table)


create_framework_table = """
CREATE TABLE framework (
    framework_id bigint NOT NULL PRIMARY KEY,
    framework character varying(50) NOT NULL
)
"""

execute_query(connection, create_framework_table)


create_production_table = """
CREATE TABLE production (
    production_id bigint NOT NULL PRIMARY KEY,
    production character varying(50) NOT NULL
)
"""

execute_query(connection, create_production_table)


create_type_table = """
CREATE TABLE type (
    type_id bigint NOT NULL PRIMARY KEY,
    type character varying(50)
)
"""

execute_query(connection, create_type_table)


create_unit_table = """
CREATE TABLE unit (
    unit_id bigint NOT NULL PRIMARY KEY,
    unit character varying(50) NOT NULL
)
"""

execute_query(connection, create_unit_table)


create_capacitor_table = """
CREATE TABLE capacitor (
    capacitor_id bigint NOT NULL PRIMARY KEY,
    component_name character varying(100) NOT NULL,
    component_id bigint NOT NULL REFERENCES component(component_id),
    production_id bigint NOT NULL REFERENCES production(production_id),
    operating_voltage integer,
    rated_capacity numeric(9,2),
    unit_id bigint REFERENCES unit(unit_id)
)
"""

execute_query(connection, create_capacitor_table)


create_microchips_table = """
CREATE TABLE microchips (
    microchips_id bigint NOT NULL PRIMARY KEY,
    component_name character varying(100) NOT NULL,
    component_id bigint REFERENCES component(component_id),
    production_id bigint REFERENCES production(production_id),
    architecture_id bigint REFERENCES architecture(architecture_id),
    data_interface_id bigint REFERENCES data_interface(data_interface_id),
    framework_id bigint REFERENCES framework(framework_id)
)
"""

execute_query(connection, create_microchips_table)


create_resistor_table = """
CREATE TABLE resistor (
    resistor_id bigint NOT NULL PRIMARY KEY,
    component_name character varying(100) NOT NULL,
    component_id bigint NOT NULL REFERENCES component(component_id),
    production_id bigint NOT NULL REFERENCES production(production_id),
    type_id bigint REFERENCES type(type_id),
    nominal_resistance numeric(4,1),
    unit_id bigint REFERENCES unit(unit_id),
    accuracy integer,
    rated_power numeric(5,2)
)
"""

execute_query(connection, create_resistor_table)


create_storage_capacitor_table = """
CREATE TABLE storage_capacitor (
    storage_capacitor_id bigint NOT NULL PRIMARY KEY,
    capacitor_id bigint NOT NULL REFERENCES capacitor(capacitor_id),
    amount integer,
    price numeric(9,2)
)
"""

execute_query(connection, create_storage_capacitor_table)


create_storage_microchips_table = """
CREATE TABLE storage_microchips (
    storage_microchip_id bigint NOT NULL PRIMARY KEY,
    microchips_id bigint NOT NULL REFERENCES microchips(microchips_id),
    amount integer,
    price numeric(9,2)
)
"""

execute_query(connection, create_storage_microchips_table)


create_storage_resistor_table = """
CREATE TABLE storage_resistor (
    storage_resistor_id bigint NOT NULL PRIMARY KEY,
    resistor_id bigint NOT NULL REFERENCES resistor(resistor_id),
    amount integer,
    price numeric(9,2)
)
"""

execute_query(connection, create_storage_resistor_table)

###########################  DML ############################

fill_architecture_table = """
COPY architecture from '""" + dir_addres + """\\architecture.csv' DELIMITER ',' CSV HEADER
"""

execute_query(connection, fill_architecture_table)


fill_component_table = """
COPY component from '""" + dir_addres + """\component.csv' DELIMITER ',' CSV HEADER
"""

execute_query(connection, fill_component_table)


fill_data_interface_status_table = """
COPY data_interface from '""" + dir_addres + """\data_interface.csv' DELIMITER ',' CSV HEADER
"""

execute_query(connection, fill_data_interface_status_table)


fill_framework_table = """
COPY framework from '""" + dir_addres + """\\framework.csv' DELIMITER ',' CSV HEADER
"""

execute_query(connection, fill_framework_table)


fill_production_table = """
COPY production from '""" + dir_addres + """\production.csv' DELIMITER ',' CSV HEADER
"""

execute_query(connection, fill_production_table)


fill_type_table = """
COPY type from '""" + dir_addres + """\\type.csv' DELIMITER ',' CSV HEADER
"""

execute_query(connection, fill_type_table)


fill_unit_table = """
COPY unit from '""" + dir_addres + """\\unit.csv' DELIMITER ',' CSV HEADER
"""

execute_query(connection, fill_unit_table)


fill_capacitor_table = """
COPY capacitor from '""" + dir_addres + """\capacitor.csv' DELIMITER ',' CSV HEADER
"""

execute_query(connection, fill_capacitor_table)


fill_microchips_table = """
COPY microchips from '""" + dir_addres + """\microchips.csv' DELIMITER ',' CSV HEADER
"""

execute_query(connection, fill_microchips_table)


fill_resistor_table = """
COPY resistor from '""" + dir_addres + """\\resistor.csv' DELIMITER ',' CSV HEADER
"""

execute_query(connection, fill_resistor_table)


fill_storage_capacitor_table = """
COPY storage_capacitor from '""" + dir_addres + """\storage_capacitor.csv' DELIMITER ',' CSV HEADER
"""

execute_query(connection, fill_storage_capacitor_table)


fill_storage_microchips_table = """
COPY storage_microchips from '""" + dir_addres + """\storage_microchips.csv' DELIMITER ',' CSV HEADER
"""

execute_query(connection, fill_storage_microchips_table)


fill_storage_resistor_table = """
COPY storage_resistor from '""" + dir_addres + """\storage_resistor.csv' DELIMITER ',' CSV HEADER
"""

execute_query(connection, fill_storage_resistor_table)