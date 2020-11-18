CREATE DATABASE qldiemthi;
DROP DATABASE qldiemthi;
USE qldiemthi;
-- Tạo bảng `student`
CREATE TABLE `student` (
	`rn` INT UNSIGNED NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `age` TINYINT NULL DEFAULT NULL,
    `gender` TINYINT NULL DEFAULT NULL
);
-- Tạo bảng `subject`
CREATE TABLE `subject` (
	`sid` INT UNSIGNED NOT NULL,
    `sname` VARCHAR(50) NOT NULL
);
-- Tạo bảng `studentsubject`
CREATE TABLE `studentsubject` (
	`rn` INT UNSIGNED NOT NULL,
    `sid` INT UNSIGNED NOT NULL,
    `mark` TINYINT NULL DEFAULT NULL
);
-- 3. Sửa các bảng
-- a. Đặt khóa chính cho các bảng
-- Thêm khóa cho bảng `student`
ALTER TABLE `student` 
	ADD PRIMARY KEY (`rn`);
-- Thêm khóa cho bảng `subject`
ALTER TABLE `subject`
	ADD PRIMARY KEY (`sid`);
-- b. Đặt ràng buộc để trường Mark chỉ nhận các giá trị trong khoảng [0->10]
ALTER TABLE `studentsubject` 
	ADD CONSTRAINT CHK_Mark CHECK (mark>=0 AND mark<=10);
    
-- c. Thêm ràng buộc cho bảng `mark`
ALTER TABLE `studentsubject` 
	ADD CONSTRAINT `studentsubject_rn_fk`
		FOREIGN KEY (`rn`) 
			REFERENCES `student` (`rn`),
	ADD CONSTRAINT `studentsubject_sid_fk`
		FOREIGN KEY (`sid`) 
			REFERENCES `subject` (`sid`);

-- 4. Thêm cột Date vào bảng Student Subject
ALTER TABLE `studentsubject`
	ADD COLUMN `date` date NOT NULL;
-- 5. Nhập dữ liệu vào bảng
-- a. Thêm dữ liệu vào bảng `student`
INSERT INTO `student` (`rn`, `name`, `age`, `gender`) VALUES 
	(1, 'Mỹ Linh', 18, 0),
    (2, 'Đàm Vĩnh Hưng', 19, 1),
    (3, 'Kim Tử Long', 20, 1),
    (4, 'Tài Linh', 21, 0),
    (5, 'Mỹ Lệ', 22, 0),
    (6, 'Ngọc Oanh', 23, NULL);

-- b. Thêm dữ liệu vào bảng `subject`
INSERT INTO `subject` (`sid`, `sname`) VALUES 
	(1, 'SQL'),
    (2, 'LGC'),
    (3, 'HTML'),
    (4, 'CF');
-- c. Thêm dữ liệu vào bảng `studentsubject`
INSERT INTO `studentsubject` (`rn`, `sid`, `mark`, `date`) VALUES 
	(1, 1, 8, '2005/07/28'),
    (2, 2, 3, '2005/07/29'),
    (3, 3, 9, '2005/07/31'),
    (4, 1, 5, '2005/07/30'),
    (5, 4, 10, '2005/07/19'),
    (6, 1, 9, '2005/07/25');

-- 6. Cập nhật giới tính vào bảng `student`
UPDATE `student` SET `gender` = 0 WHERE `rn` = 1;
UPDATE `student` SET `gender` = 1 WHERE `rn` = 2;
UPDATE `student` SET `gender` = 1 WHERE `rn` = 3;
UPDATE `student` SET `gender` = 0 WHERE `rn` = 4;
UPDATE `student` SET `gender` = 0 WHERE `rn` = 5;
UPDATE `student` SET `gender` = NULL WHERE `rn` = 6;
-- 7. Nhập thêm các môn học vào bảng `subject`
INSERT INTO `subject` (`sid`, `sname`) VALUES 
	(5, 'Core Java'),
    (6, 'VB.NET');
-- 8. Cập nhật tuổi cho các học viên
UPDATE `student` SET `age` = 19 WHERE `rn` = 1 AND `rn` = 3;
UPDATE `student` SET `age` = 20 WHERE `rn` = 2 AND `rn` = 4;
UPDATE `student` SET `age` = 21 WHERE `rn` = 5 AND `rn` = 6;
-- 9. Hiển thị danh sách tất cả sinh viên
SELECT * FROM `student`;
-- 10. Đếm xem có bao nhiêu bạn sinh viên
SELECT COUNT(*) AS `totalStudent` FROM `student`;
-- 11. Hiển thị danh sách các môn học
SELECT * FROM `subject`;
-- 12. Hiển thị điểm thi cao nhất
SELECT MAX(`mark`) FROM `studentsubject`;
-- 13. Đếm xem có bao nhiêu học viên có điểm thi cao hơn 5.
SELECT COUNT(*) FROM `studentsubject` WHERE `mark` > 5; 
-- 14. Tính trung bình điểm thi của các học viên.
SELECT AVG(`mark`) FROM `studentsubject`;
-- 15. Hiển thị danh sách các học viên Nam có tuổi >=20
SELECT * FROM `student` WHERE `gender` = 1 AND `age` >= 20;
-- 16. Hiển thị số hiệu sinh viên và mã môn có điểm thi cao nhất với yêu cầu: RN hiển thị là ‘So hieu sinh vien’, SID hiển thị là ‘Mã môn học’
SELECT `rn` AS 'So hieu sinh vien', `sid` AS 'Mã môn học', MAX(`mark`) 
	FROM `studentsubject`;
-- 17. Hiển thị chi tiết bảng StudentSubject của 2 môn học có điểm thi cao nhất.
SELECT `mark`
	FROM `studentsubject` ORDER BY `mark` DESC LIMIT 0,2;
-- 18. Hiển thị ngày thi có điểm thi cao nhất.
SELECT `date`, MAX(`mark`) FROM `studentsubject`;
SELECT `date`, `mark` FROM `studentsubject` ORDER BY `mark` DESC LIMIT 0,1;