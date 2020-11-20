USE classicmodels;
-- Tạo một thủ tục mới
DELIMITER //
CREATE PROCEDURE findAllCustomers()
BEGIN
	SELECT * FROM customers;
END //
DELIMITER ;

-- Gọi thủ tục findAllCustomer()
CALL findAllCustomers();

-- Sửa thủ tục. Vì MySQL không có lệnh sửa nên thông thường sẽ xóa đi và tạo lại 

DROP PROCEDURE IF EXISTS `findAllCustomers`;
DELIMITER //
CREATE PROCEDURE findAllCustomers()
BEGIN
	SELECT * FROM customers WHERE customerNumber = 175;
END//
DELIMITER ;