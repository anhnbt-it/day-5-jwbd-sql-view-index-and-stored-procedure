USE classicmodels;

-- Tạo một view 
CREATE VIEW customer_views AS
SELECT customerNumber, customerName, phone
FROM customers;

-- Lấy dữ liệu từ view
SELECT * FROM customer_views;
-- Cập nhật view customer_view
CREATE OR REPLACE VIEW customer_views AS
SELECT customerNumber, customerName, contactFirstName, contactLastName, phone
FROM customers
WHERE city = 'Nantes';
-- Xóa view
DROP VIEW customer_views;