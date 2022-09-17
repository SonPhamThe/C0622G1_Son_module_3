-- thực hành store procedure
DELIMITER //
DROP PROCEDURE IF EXISTS `findAllCustomers`//

CREATE PROCEDURE findAllCustomers()

BEGIN

SELECT * FROM customers where customerNumber = 175;

END //

-- truyền tham số và store prodecure
-- tham số loại in 
DELIMITER //

CREATE PROCEDURE getCusById

(IN cusNum INT(11))

BEGIN

  SELECT * FROM customers WHERE customerNumber = cusNum;

END //

DELIMITER ;
call getCusById(175);

-- tham số loại out
DELIMITER //

CREATE PROCEDURE GetCustomersCountByCity(

    IN  in_city VARCHAR(50),

    OUT total INT

)

BEGIN

    SELECT COUNT(customerNumber)

    INTO total

    FROM customers

    WHERE city = in_city;

END//

DELIMITER ;
CALL GetCustomersCountByCity('Lyon',@total);

SELECT @total;