CREATE TABLE "Financing"(
    "finance_id" SERIAL NOT NULL,
    "finance_type" VARCHAR(50) NOT NULL,
    "months" INTEGER NOT NULL,
    "down_pay" DECIMAL(7, 2) NOT NULL,
    "int_rate" DECIMAL(3, 2) NOT NULL,
    "promos" DECIMAL(6, 2) NOT NULL,
    "monthly_pay" BIGINT NOT NULL
);
ALTER TABLE
    "Financing" ADD PRIMARY KEY("finance_id");
CREATE TABLE "Service Contract"(
    "servecon_id" SERIAL NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "vehicle_id" INTEGER NOT NULL,
    "service_performed_id" INTEGER NOT NULL
);
ALTER TABLE
    "Service Contract" ADD PRIMARY KEY("servecon_id");
CREATE TABLE "Vehicle_Inventory"(
    "vehicle_inventory_id" SERIAL NOT NULL,
    "vehicle_id" INTEGER NOT NULL,
    "acquired" DATE NOT NULL,
    "options_id" INTEGER NOT NULL,
    "msrp" DECIMAL(9, 2) NOT NULL
);
ALTER TABLE
    "Vehicle_Inventory" ADD PRIMARY KEY("vehicle_inventory_id");
CREATE TABLE "Address"(
    "address_id" SERIAL NOT NULL,
    "staff_id" INTEGER NOT NULL,
    "street_address" VARCHAR(50) NOT NULL,
    "street_address2" VARCHAR(50) NOT NULL,
    "city" VARCHAR(50) NOT NULL,
    "state" VARCHAR(10) NOT NULL,
    "postal_code" INTEGER NOT NULL
);
ALTER TABLE
    "Address" ADD PRIMARY KEY("address_id");
CREATE TABLE "Staff"(
    "staff_id" SERIAL NOT NULL,
    "first_name" VARCHAR(50) NOT NULL,
    "last_name" VARCHAR(50) NOT NULL,
    "hire_date" DATE NOT NULL,
    "department" VARCHAR(20) NOT NULL,
    "phone" INTEGER NOT NULL,
    "address_id" BIGINT NOT NULL
);
ALTER TABLE
    "Staff" ADD PRIMARY KEY("staff_id");
CREATE TABLE "Sales Contract"(
    "salecon_id" SERIAL NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "staff_id" INTEGER NOT NULL,
    "vehicle_id" INTEGER NOT NULL,
    "sale_date" DATE NOT NULL,
    "trade_vehicle_id" INTEGER NOT NULL,
    "final_price" DECIMAL(9, 2) NOT NULL,
    "finance_id" INTEGER NOT NULL
);
ALTER TABLE
    "Sales Contract" ADD PRIMARY KEY("salecon_id");
CREATE TABLE "Service_Performed"(
    "service_performed_id" SERIAL NOT NULL,
    "service_id" INTEGER NOT NULL,
    "staff_id" INTEGER NOT NULL,
    "servecon_id" INTEGER NOT NULL
);
ALTER TABLE
    "Service_Performed" ADD PRIMARY KEY("service_performed_id");
CREATE TABLE "Customer"(
    "customer_id" SERIAL NOT NULL,
    "first_name" VARCHAR(50) NOT NULL,
    "last_name" VARCHAR(50) NOT NULL,
    "company" VARCHAR(50) NOT NULL,
    "phone" INTEGER NOT NULL,
    "email" VARCHAR(50) NOT NULL,
    "first contacted" DATE NOT NULL,
    "address_id" INTEGER NOT NULL,
    "vehicle_id" INTEGER NULL
);
ALTER TABLE
    "Customer" ADD PRIMARY KEY("customer_id");
CREATE TABLE "Vehicle_Options"(
    "option_id" SERIAL NOT NULL,
    "description" VARCHAR(50) NOT NULL,
    "price" DECIMAL(8, 2) NOT NULL
);
ALTER TABLE
    "Vehicle_Options" ADD PRIMARY KEY("option_id");
CREATE TABLE "Vehicle"(
    "vehicle_id" SERIAL NOT NULL,
    "make" VARCHAR(20) NOT NULL,
    "model" VARCHAR(20) NOT NULL,
    "year" INTEGER NOT NULL,
    "last_mileage" INTEGER NOT NULL,
    "last_service" DATE NOT NULL,
    "color" VARCHAR(20) NOT NULL,
    "customer_id" INTEGER NULL,
    "vehicle_inventory_id" INTEGER NOT NULL
);
ALTER TABLE
    "Vehicle" ADD PRIMARY KEY("vehicle_id");
CREATE TABLE "Services"(
    "service_id" SERIAL NOT NULL,
    "service_type" VARCHAR(30) NOT NULL,
    "price" BIGINT NOT NULL,
    "part_id" INTEGER NULL
);
ALTER TABLE
    "Services" ADD PRIMARY KEY("service_id");
CREATE TABLE "Parts_Inventory"(
    "part_id" SERIAL NOT NULL,
    "type" VARCHAR(30) NOT NULL,
    "msrp" DECIMAL(6, 2) NOT NULL,
    "stock" INTEGER NOT NULL,
    "ppu" VARCHAR(20) NOT NULL
);
ALTER TABLE
    "Parts_Inventory" ADD PRIMARY KEY("part_id");
ALTER TABLE
    "Service Contract" ADD CONSTRAINT "service contract_customer_id_foreign" FOREIGN KEY("customer_id") REFERENCES "Customer"("customer_id");
ALTER TABLE
    "Sales Contract" ADD CONSTRAINT "sales contract_vehicle_id_foreign" FOREIGN KEY("vehicle_id") REFERENCES "Vehicle"("vehicle_id");
ALTER TABLE
    "Vehicle_Inventory" ADD CONSTRAINT "vehicle_inventory_vehicle_id_foreign" FOREIGN KEY("vehicle_id") REFERENCES "Vehicle"("make");
ALTER TABLE
    "Vehicle_Inventory" ADD CONSTRAINT "vehicle_inventory_options_id_foreign" FOREIGN KEY("options_id") REFERENCES "Vehicle_Options"("option_id");
ALTER TABLE
    "Service_Performed" ADD CONSTRAINT "service_performed_service_id_foreign" FOREIGN KEY("service_id") REFERENCES "Staff"("staff_id");
ALTER TABLE
    "Customer" ADD CONSTRAINT "customer_customer_id_foreign" FOREIGN KEY("customer_id") REFERENCES "Address"("address_id");
ALTER TABLE
    "Sales Contract" ADD CONSTRAINT "sales contract_finance_id_foreign" FOREIGN KEY("finance_id") REFERENCES "Financing"("finance_id");
ALTER TABLE
    "Service_Performed" ADD CONSTRAINT "service_performed_service_performed_id_foreign" FOREIGN KEY("service_performed_id") REFERENCES "Services"("service_id");
ALTER TABLE
    "Service Contract" ADD CONSTRAINT "service contract_vehicle_id_foreign" FOREIGN KEY("vehicle_id") REFERENCES "Vehicle"("vehicle_id");
ALTER TABLE
    "Sales Contract" ADD CONSTRAINT "sales contract_sale_date_foreign" FOREIGN KEY("sale_date") REFERENCES "Staff"("staff_id");
ALTER TABLE
    "Services" ADD CONSTRAINT "services_part_id_foreign" FOREIGN KEY("part_id") REFERENCES "Parts_Inventory"("part_id");
ALTER TABLE
    "Vehicle" ADD CONSTRAINT "vehicle_vehicle_id_foreign" FOREIGN KEY("vehicle_id") REFERENCES "Customer"("customer_id");
ALTER TABLE
    "Service Contract" ADD CONSTRAINT "service contract_service_performed_id_foreign" FOREIGN KEY("service_performed_id") REFERENCES "Service_Performed"("service_performed_id");
ALTER TABLE
    "Sales Contract" ADD CONSTRAINT "sales contract_customer_id_foreign" FOREIGN KEY("customer_id") REFERENCES "Customer"("phone");