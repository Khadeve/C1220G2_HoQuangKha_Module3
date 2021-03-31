delimiter //
CREATE PROCEDURE get_customer_by_id (IN cus_number INT)
BEGIN
	SELECT * FROM customers
		WHERE customer_number = cus_number;
END //
delimiter ;

CALL get_customer_by_id (175);

delimiter //
CREATE PROCEDURE get_customer_count_by_city (IN in_city VARCHAR(50), OUT total INT)
BEGIN

	SET total = (
		SELECT COUNT(customer_number)
			FROM customers
            WHERE city = in_city
    );
	
END;
// delimiter ;

CALL get_customer_count_by_city('Lyon', @total);
SELECT @total;