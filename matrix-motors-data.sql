INSERT INTO parts_inventory (type, msrp, stock, ppu )
VALUES('tire', '2000.00', '3', '1'), 
		('headlight bulb', '800.00', '15', '1'),
		('motor oil', '5000.00', '80', '1'),
		('air freshener', '200.00', '10', '1');

INSERT INTO vehicle_options (option, price)
VALUES ('sunroof', '10000.00'), ('autopilot', '3.00'), ('heated seats', '999999.99'); 

INSERT INTO vehicle_options (OPTION, price)
VALUES ('flux capacitor', '0.99');

SELECT * FROM vehicle_options;

--INSERT INTO financing (finance_type, months, down_pay, int_rate, monthly_pay)
--VALUES ('finance', '5', '10.00', '0.35', '');

INSERT INTO address (street_address, street_address2, city, state, postal_code)
VALUES ('123 Cool Breeze Lane', 'Apt 1', 'Chicago', 'IL', '08345'),
	('122 Cool Breeze Lane', 'Apt 1', 'Chicago', 'IL', '08345'),
	('666 Satan Road', 'Apt 0', 'Helltown', 'CA', '90019'),
	('159 Celestial Ave', 'Apt 7', 'Superheaven', 'AL', '35749'),
	('777 Limbo Road', 'Apt B', 'Voidstown', 'PA', '19128');


INSERT INTO staff (first_name, last_name, hire_date, department, phone, address_id)
VALUES ('Todd', 'Camnitz', '4/3/2023', 'pottery', '2123431234', '1'),
	-- Todd has been living on Sean's couch since the cohort started.
	('Sean', 'Currie', '3/31/1999', 'kitchen', '9991114242', '1'),
	('Dylan', 'Smith', '3/3/2003', 'kitchen', '7178283546', '2');

INSERT INTO vehicle (make, model, YEAR, last_mileage, last_service, color, option_id)
VALUES ('Volkswagen', 'Jetta', '2019', '50000', '2/28/2023', 'white', NULL),
	('Tesla', 'Model S', '2023', '600', NULL, 'matte black', '2'),
	('Audi', 'R8', '2023', '600', NULL, 'hot pink', '2'),
	('Ford', 'Pinto', '1971', '300000', '11/5/1982', 'schoolbus yellow', '3'),
	('DMC', 'DeLorean', '1983', '800000', '12/25/2045', 'gray', '4' );

INSERT INTO vehicle_inventory (vehicle_id, acquired, msrp)
VALUES ('1', '4/3/2023', '50000'), ('2', '4/3/2023', '70000'), ('3', '4/3/2023', '120000'), ('4', '4/3/2023', '300.99'), ('5', '4/3/2023', '2');

INSERT INTO services (service_type, price, part_id)
VALUES ('oil change', '300.00', '3'),
	('change headlights', '200.00', '2'),
	('tire repair', '350.00', '1'),
	('tire replacement', '2000.00', '1'),
	('make car smell flowery', '7000.00', '4');
	
INSERT INTO customer (first_name, last_name, company, phone, email, first_contacted, address_id, vehicle_id)
VALUES ('Dylan', 'Smith', 'Matrix Motors', '7178283546', 'dsmith@mm.com', '3/3/2003', '2', '3'), ('Sean', 'Currie', 'Matrix Motors', '9991114242', 'scurrie@mm.com', '3/31/1999', '1', '2'), ('David', 'Park', 'Freelance', '6667771212', 'dp@aol.com', '4/3/2023', '5', '1'), ('Nope Old', 'Kim', 'H Mart', '01019472836', 'yyk@kakao.co.kr', '4/3/2023', '3', '4'), ('John', 'Burgess', 'Unemployed', '5555555555', 'outtatime@netscape.net', '4/3/2040', '4', '5');

-- service_performed as function
-- service_contract as function
-- sales contract as function
