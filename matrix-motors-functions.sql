SELECT * FROM sales_contract ;
SELECT * FROM financing ;

INSERT INTO financing(finance_type, months)
values('lease', '12');


select * FROM vehicle;
SELECT * FROM vehicle_inventory ;
SELECT * FROM vehicle_options ;

SELECT * FROM vehicle 
JOIN vehicle_options ON vehicle_options.option_id = vehicle.option_id 
JOIN vehicle_inventory ON vehicle_inventory.vehicle_id = vehicle.vehicle_id ;

SELECT (msrp + price) AS total_price FROM vehicle AS v
JOIN vehicle_options AS vo ON vo.option_id = v.option_id 
JOIN vehicle_inventory AS vi ON vi.vehicle_id = v.vehicle_id
WHERE v.vehicle_id = 3;

CREATE OR REPLACE PROCEDURE assign_service(
	_service_name varchar(100),
	_staff_first_name varchar(100),
	_staff_last_name varchar(100)
)
LANGUAGE plpgsql
AS $$
	BEGIN 
		INSERT INTO service_performed(service_id, staff_id)
		VALUES(
			(SELECT service_id FROM services
			WHERE service_type = _service_name),
			(SELECT staff_id FROM staff
			WHERE first_name = _staff_first_name AND last_name = _staff_last_name
			));
		DELETE FROM service_performed
		WHERE staff_id IS NULL;
		DELETE FROM service_performed
		WHERE service_id  IS NULL;
	COMMIT;
	END;
$$
	
CALL assign_service('oil change', 'Todd', 'Camnitz');
CALL assign_service('tire repair', 'Sean', 'Currie');
-- if we create a typo in staff's name or service, it will automatically delete the row
CALL assign_service('oil change', 'Tod', 'Camnitz');


CREATE OR REPLACE FUNCTION calculate_total_price(
	_vehicle_id INTEGER
)
RETURNS decimal(10, 2) AS
$$
	BEGIN 
		-- We were able to calculate the total price, but was unsure how to store it in a variable to ultimately return.
		SELECT (msrp + price) AS t_price FROM vehicle AS v
		JOIN vehicle_options AS vo ON vo.option_id = v.option_id 
		JOIN vehicle_inventory AS vi ON vi.vehicle_id = v.vehicle_id
		WHERE v.vehicle_id = _vehicle_id ;

		RETURN t_price AS total_price;
	END;
$$
LANGUAGE plpgsql;

SELECT calculate_total_price(2, 2);