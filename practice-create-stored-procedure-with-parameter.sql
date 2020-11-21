USE classicmodels;

-- Xóa PROCEDURE
DROP PROCEDURE `getCustomerCountByCity`;

-- Tạo một PROCEDURE getCustomerById() với tham số là customerId
DELIMITER //
CREATE PROCEDURE getCustomerById(IN customerId INT) 
BEGIN 
	SELECT * FROM customers WHERE customerNumber = customerId;
END//
DELIMITER ;

-- Gọi PROCEDURE getCustomerById() với ID = 175
CALL getCustomerById(175); 

-- Xóa PROCEDURE getCustomerCountByCity()
DROP PROCEDURE `getCustomerCountByCity`;

-- Tạo một PROCEDURE getCustomerCountByCity() với tham số IN VÀ OUT
DELIMITER //
CREATE PROCEDURE getCustomerCountByCity(
	IN cityName varchar(50),
    OUT total SMALLINT
)
BEGIN
	SELECT COUNT(*) INTO total 
	FROM customers 
    WHERE city = cityName;
END //
DELIMITER ;
-- Gọi PROCEDURE
CALL getCustomerCountByCity('Las Vegas', @total);
SELECT @total;