CREATE DATABASE procedure_db;
USE procedure_db;
-- Tạo bảng `sumofall`
CREATE TABLE sumofall (
	amount int
);
INSERT INTO sumofall (amount) VALUES 
	(100), (330), (450), (400);
SELECT * FROM sumofall;

DELIMITER //
CREATE PROCEDURE sp_CheckValue (IN value1 INT, OUT value2 INT)
	BEGIN
		SET value2 = (SELECT amount FROM sumofall WHERE amount=value1);
	END;
    //
DELIMITER ;
-- Xóa thủ tục `sp_CheckValue`
DROP PROCEDURE sp_CheckValue;
-- Gọi thủ tục `sp_CheckValue` với giá trị 300 và lưu trữ đầu ra vào biến @isPresent 
CALL sp_CheckValue(300, @isPresent);
-- Kiểm tra giá trị trong biến @isPresent
SELECT @isPresent;

-- Gọi thủ tục `sp_CheckValue` với giá trị 330 và lưu trữ đầu ra vào biến @isPresent 
CALL sp_CheckValue(330, @isPresent);
-- Kiểm tra giá trị trong biến @isPresent
SELECT @isPresent;

-- Tạo thủ tục `sp_allrecords`
DELIMITER //
CREATE PROCEDURE sp_allrecords() 
	BEGIN
		SELECT * FROM `sumofall`;
	END;
    //
DELIMITER ;
CALL sp_allrecords();