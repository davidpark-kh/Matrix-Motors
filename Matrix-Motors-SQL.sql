-- This Executing this script when first creating the database will load all the tables and columns. Foreign keys have been referenced to respective primary keys.

CREATE TABLE Parts_Inventory(
    part_id SERIAL PRIMARY KEY,
    type VARCHAR(30),
    msrp DECIMAL(6, 2),
    stock INTEGER,
    ppu VARCHAR(20)
);


CREATE TABLE Vehicle_Options(
    option_id SERIAL PRIMARY KEY,
    description VARCHAR(50),
    price DECIMAL(8, 2)
);

ALTER TABLE vehicle_options
RENAME COLUMN description TO OPTION;

SELECT * FROM vehicle_options;

CREATE TABLE Financing(
    finance_id SERIAL PRIMARY KEY,
    total_price DECIMAL(10,2)
    finance_type VARCHAR(50),
    months INTEGER,
    down_pay DECIMAL(7, 2),
    int_rate DECIMAL(3, 2),
    promos DECIMAL(6, 2),
    monthly_pay BIGINT

);

CREATE TABLE Address(
    address_id SERIAL PRIMARY KEY,
    street_address VARCHAR(50),
    street_address2 VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(10),
    postal_code INTEGER
);

CREATE TABLE Staff(
    staff_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hire_date DATE,
    department VARCHAR(20),
    phone VARCHAR(16),
    address_id BIGINT,
    Foreign key (address_id) references Address(address_id)
);

CREATE TABLE Vehicle(
    vehicle_id SERIAL PRIMARY KEY,
    make VARCHAR(20),
    model VARCHAR(20),
    year INTEGER,
    last_mileage INTEGER,
    last_service DATE,
    color VARCHAR(20),
    option_id INTEGER,
    Foreign key (option_id) references Vehicle_Options(option_id)
);

CREATE TABLE Vehicle_Inventory(
    vehicle_inventory_id SERIAL PRIMARY KEY,
    vehicle_id INTEGER,
    acquired DATE,
    options_id INTEGER,
    msrp DECIMAL(9, 2),
    FOREIGN key (vehicle_id) references Vehicle(vehicle_id)
);

ALTER TABLE vehicle_inventory
DROP COLUMN options_id;

CREATE TABLE Services(
    service_id SERIAL,
    service_type VARCHAR(30),
    price DECIMAL(6, 2),
    part_id INTEGER,
    FOREIGN KEY (part_id) references Parts_Inventory(part_id)
);
-- Included an alter table clause to show variariaton in our code
ALTER TABLE Services
ADD PRIMARY KEY(service_id);

CREATE TABLE Customer(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    company VARCHAR(50),
    phone VARCHAR(16),
    email VARCHAR(50),
    first_contacted DATE,
    address_id INTEGER,
    vehicle_id INTEGER,
    FOREIGN key (address_id) references Address(address_id),
    FOREIGN key (vehicle_id) references Vehicle(vehicle_id)
);

CREATE TABLE Service_Performed(
    service_performed_id SERIAL PRIMARY KEY,
    service_id INTEGER,
    staff_id INTEGER,
    FOREIGN key (service_id) references Services(service_id),
    FOREIGN key (staff_id) references Staff(staff_id)
);

-- Possible use for functions

CREATE TABLE Service_Contract(
    servecon_id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    vehicle_id INTEGER,
    service_performed_id INTEGER,
    FOREIGN KEY (customer_id) references Customer(customer_id),
    FOREIGN key (vehicle_id) references Vehicle(vehicle_id),
    FOREIGN KEY (service_performed_id) references Service_Performed(service_performed_id)
);
ALTER TABLE service_contract
ADD COLUMN part_units INTEGER;

-- Maybe we can create a function that calculates the total price and returns a receipt of some sort like "Total financed sis x Your total monthly payment is y"
CREATE TABLE Sales_Contract(
    salecon_id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    staff_id INTEGER,
    vehicle_id INTEGER,
    sale_date DATE,
    final_price DECIMAL(9, 2),
    finance_id INTEGER,
    FOREIGN KEY (customer_id) references customer(customer_id),
    FOREIGN key (staff_id)references Staff(staff_id),
    FOREIGN key (vehicle_id) references Vehicle(vehicle_id),
    FOREIGN KEY (finance_id) references Financing(finance_id)
);
