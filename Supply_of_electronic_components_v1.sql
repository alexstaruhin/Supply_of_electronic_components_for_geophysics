##### Supply_of_electronic_components SQL Project  

###########################  DDL ############################

CREATE TABLE architecture (
    architecture_id bigint NOT NULL PRIMARY KEY,
    architecture character varying(50) NOT NULL,
    CONSTRAINT architecture_constraint UNIQUE(architecture)
);

CREATE TABLE component (
    component_id bigint NOT NULL PRIMARY KEY,
    component character varying(50) NOT NULL,
    CONSTRAINT component_constraint UNIQUE(component)
);

CREATE TABLE data_interface (
    data_interface_id bigint NOT NULL PRIMARY KEY,
    data_interface character varying(50) NOT NULL
);

CREATE TABLE framework (
    framework_id bigint NOT NULL PRIMARY KEY,
    framework character varying(50) NOT NULL
);

CREATE TABLE production (
    production_id bigint NOT NULL PRIMARY KEY,
    production character varying(50) NOT NULL
);

CREATE TABLE type (
    type_id bigint NOT NULL PRIMARY KEY,
    type character varying(50)
);

CREATE TABLE unit (
    unit_id bigint NOT NULL PRIMARY KEY,
    unit character varying(50) NOT NULL
);

CREATE TABLE capacitor (
    capacitor_id bigint NOT NULL PRIMARY KEY,
    component_name character varying(100) NOT NULL,
    component_id bigint NOT NULL REFERENCES component(component_id),
    production_id bigint NOT NULL REFERENCES production(production_id),
    operating_voltage integer,
    rated_capacity numeric(9,2),
    unit_id bigint REFERENCES unit(unit_id)
);

CREATE TABLE microchips (
    microchips_id bigint NOT NULL PRIMARY KEY,
    component_name character varying(100) NOT NULL,
    component_id bigint REFERENCES component(component_id),
    production_id bigint REFERENCES production(production_id),
    architecture_id bigint REFERENCES architecture(architecture_id),
    data_interface_id bigint REFERENCES data_interface(data_interface_id),
    framework_id bigint REFERENCES framework(framework_id)
);

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
);

CREATE TABLE storage_capacitor (
    storage_capacitor_id bigint NOT NULL PRIMARY KEY,
    capacitor_id bigint NOT NULL REFERENCES capacitor(capacitor_id),
    amount integer,
    price numeric(9,2)
);

CREATE TABLE storage_microchips (
    storage_microchip_id bigint NOT NULL PRIMARY KEY,
    microchips_id bigint NOT NULL REFERENCES microchips(microchips_id),
    amount integer,
    price numeric(9,2)
);

CREATE TABLE storage_resistor (
    storage_resistor_id bigint NOT NULL PRIMARY KEY,
    resistor_id bigint NOT NULL REFERENCES resistor(resistor_id),
    amount integer,
    price numeric(9,2)
);

###########################  DML ############################

## Importing the Data

COPY architecture from 'D:\python\Supply_of_electronic_components_for_geophysics_1\source\architecture.csv' DELIMITER ',' CSV HEADER;

COPY component from 'D:\python\Supply_of_electronic_components_for_geophysics_1\source\component.csv' DELIMITER ',' CSV HEADER;

COPY data_interface from 'D:\python\Supply_of_electronic_components_for_geophysics_1\source\data_interface.csv' DELIMITER ',' CSV HEADER;

COPY framework from 'D:\python\Supply_of_electronic_components_for_geophysics_1\source\framework.csv' DELIMITER ',' CSV HEADER;

COPY production from 'D:\python\Supply_of_electronic_components_for_geophysics_1\source\production.csv' DELIMITER ',' CSV HEADER;

COPY type from 'D:\python\Supply_of_electronic_components_for_geophysics_1\source\type.csv' DELIMITER ',' CSV HEADER;

COPY unit from 'D:\python\Supply_of_electronic_components_for_geophysics_1\source\unit.csv' DELIMITER ',' CSV HEADER;

COPY capacitor from 'D:\python\Supply_of_electronic_components_for_geophysics_1\source\capacitor.csv' DELIMITER ',' CSV HEADER;

COPY microchips from 'D:\python\Supply_of_electronic_components_for_geophysics_1\source\microchips.csv' DELIMITER ',' CSV HEADER;

COPY resistor from 'D:\python\Supply_of_electronic_components_for_geophysics_1\source\resistor.csv' DELIMITER ',' CSV HEADER;

COPY storage_capacitor from 'D:\python\Supply_of_electronic_components_for_geophysics_1\source\storage_capacitor.csv' DELIMITER ',' CSV HEADER;

COPY storage_microchips from 'D:\python\Supply_of_electronic_components_for_geophysics_1\source\storage_microchips.csv' DELIMITER ',' CSV HEADER;

COPY storage_resistor from 'D:\python\Supply_of_electronic_components_for_geophysics_1\source\storage_resistor.csv' DELIMITER ',' CSV HEADER;