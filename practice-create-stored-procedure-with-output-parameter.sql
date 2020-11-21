USE classicmodels;

-- Xóa PROCEDURE
DROP PROCEDURE `getCustomerCountByCity`;

-- Tạo một PROCEDURE getCustomerById()
DELIMITER //
CREATE PROCEDURE getCustomerById(IN customerId INT) 
BEGIN 
	SELECT * FROM customers WHERE customerNumber = customerId;
END//
DELIMITER ;

-- Gọi PROCEDURE getCustomerById()
CALL getCustomerById(175); 

-- Xóa PROCEDURE getCustomerCountByCity()
DROP PROCEDURE `getCustomerCountByCity`;
-- Tạo một PROCEDURE getCustomerCountByCity()
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

-- Tham số loại INOUT
-- Tạo một PROCEDURE setCounter()
DELIMITER //
CREATE PROCEDURE setCounter(
	INOUT counter INT,
    IN inc INT
)
BEGIN 
	SET counter = counter + inc;
END //
DELIMITER ;
-- Gọi store procedure
SET @counter = 1;
CALL SetCounter(@counter,1); -- 2
CALL SetCounter(@counter,1); -- 3
CALL SetCounter(@counter,5); -- 8
SELECT @counter; -- 8