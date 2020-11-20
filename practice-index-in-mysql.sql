USE classicmodels;
-- Mức độ từ tốt nhất đến chậm nhất như sau: system, const, eq_ref, ref, range, index, all
-- Theo dõi kết quả sử dụng EXPLAIN
EXPLAIN SELECT * FROM customers WHERE customerNumber = 175;
--  Theo dõi kết quả sử dụng EXPLAIN
EXPLAIN SELECT * FROM customers WHERE contactFirstName = 'Julie' OR contactLastName = 'King';
-- Thêm chỉ mục cho bảng `customers`
ALTER TABLE customers 
	ADD INDEX idx_full_name (contactFirstName, contactLastName);
EXPLAIN SELECT * FROM customers WHERE contactFirstName = 'Julie' OR contactLastName = 'King';