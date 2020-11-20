USE employees;
SELECT * FROM users;
ALTER TABLE users 
	ADD COLUMN age TINYINT NOT NULL;
-- Đổ dữ liệu vào bảng `users`
INSERT INTO users (username, password, age) VALUES 
	('Tuấn Anh', 'tuananh123', 20),
    ('Tuấn', 'tuan456', 25),
    ('Anh', 'anh321', 26);
-- Tạo view từ bảng `users`
CREATE VIEW users_view AS
	SELECT id, username, password 
    FROM users;
-- Cập nhật cột `age` vào view `users_view`
ALTER VIEW users_view AS 
	SELECT id, username, password, age 
		FROM users
			WHERE age IS NOT NULL
				WITH CHECK OPTION;
-- Xóa view `users_view`
DROP VIEW users_view;

-- Lấy dữ liệu từ view `users_view`
SELECT * FROM users_view;
-- Chèn thêm dữ liệu vào view `users_view`
INSERT INTO users_view (username, password, age) VALUE ('Khoai', 'khoai123');
-- Cập nhật bản ghi có id = 1
UPDATE users_view SET age = 22 WHERE id = 1;
UPDATE users_view SET age = 23 WHERE id = 3;
UPDATE users_view SET age = 24 WHERE id = 5;
-- Xóa bản ghi có id = 2
DELETE FROM users_view WHERE id = 2;