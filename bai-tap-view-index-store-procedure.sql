CREATE DATABASE demo;
USE demo;

CREATE TABLE products (
	id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    productCode VARCHAR(10) NOT NULL,
    productName VARCHAR(50) NOT NULL,
    productPrice DECIMAL(10,2) NOT NULL,
    productAmount DECIMAL(10,2) NULL DEFAULT NULL,
    productDescription VARCHAR(255) NULL DEFAULT NULL,
    productStatus BOOLEAN NULL DEFAULT TRUE,
    PRIMARY KEY (id)
);
-- Thêm ràng buộc UNIQUE cho bảng `products`
ALTER TABLE products
    ADD CONSTRAINT uc_productCode UNIQUE (productCode);
-- Thêm ràng buộc INDEX cho bảng `products`
CREATE INDEX idx_productNamePrice ON products (productName, productPrice);
-- Xóa INDEX của bảng `products`
ALTER TABLE products
DROP INDEX idx_productNamePrice;
-- Đổ dữ liệu mẫu cho bảng `products`
INSERT INTO products (productCode, productName, productPrice) VALUES 
	('111', 'iPhone 11 ProMax', 29999999),
    ('222', 'iPhone 8 Plus', 13999999),
    ('333', 'iPhone 6s Plus', 9999999),
    ('444', 'Samsung S20', 19999999);
-- Bước 4: Tạo view lấy các thông tin trong bảng `products`
CREATE VIEW product_views AS
SELECT 
	productCode, 
    productName, 
    productPrice, 
    productStatus
FROM products;
-- Lấy dữ liệu từ view
SELECT * FROM product_views;
-- Sửa đổi view
CREATE OR REPLACE VIEW product_views AS
SELECT * FROM products;
-- Xóa view
DROP VIEW product_views;

-- Bước 5: Tạo store procedure lấy tất cả thông tin sản phẩm trong bảng products
DELIMITER //
CREATE PROCEDURE getAllProducts()
BEGIN
	SELECT * FROM products;
END//
DELIMITER ;
-- Lấy dữ liệu từ trong STORE PROCEDURE
CALL getAllProducts();
-- Tạo STORE PROCEDURE thêm một sản phẩm mới 
DELIMITER //
CREATE PROCEDURE addProduct(
	IN pCode VARCHAR(10),
    IN pName VARCHAR(50),
    IN pPrice DECIMAL(10,2)
)
BEGIN
	INSERT INTO products (productCode, productName, productPrice) 
    VALUES (pCode, pName, pPrice);
END //
DELIMITER ;
-- Gọi PROCEDURE để thêm sản phẩm mới
CALL addProduct('555', 'Loa JBL', 4000000);

-- Tạo STORE PROCEDURE sửa thông tin sản phẩm theo ID
DELIMITER //
CREATE PROCEDURE updateProduct(
	IN pId INT,
    IN pCode VARCHAR(10),
    IN pName VARCHAR(50),
    IN pPrice DECIMAL(10,2),
    OUT msg VARCHAR(50)
)
BEGIN 
	UPDATE products 
    SET productCode = pCode,
    productName = pName,
    productPrice = pPrice
    WHERE id = pId;
    SET msg = 'Updated successfully.';
END//
DELIMITER ;
-- Cập nhật dữ liệu với ID = 1
CALL updateProduct(1, '000', 'IPHONE 11 PROMAX 2020', 30000000, @msg);
SELECT @msg;
-- Tạo STORE PROCEDURE xóa sản phẩm theo id
DELIMITER //
CREATE PROCEDURE removeProduct(
	IN pId INT
)
BEGIN 
	DELETE FROM products WHERE id = pId;
END//
DELIMITER ;
-- Gọi STORE PROCEDURE removeProduct()
CALL removeProduct(5);