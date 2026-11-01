-- Sample data: bảng tham chiếu (category, shipping_rate, customer, book_batch)
-- Lưu ý: book_batch.created_by = 1 giả định tài khoản admin Django có id = 1.

INSERT INTO category (category_id, category_name, description) VALUES
('TRUYEN',  'Truyện tranh',        'Truyện tranh, manga, comic cho thiếu nhi'),
('KYNANG',  'Kỹ năng sống',        'Sách rèn luyện kỹ năng cho trẻ'),
('KHOAHOC', 'Khoa học',            'Sách khoa học, khám phá thế giới'),
('NGOAINGU','Ngoại ngữ',           'Sách học tiếng Anh và ngoại ngữ khác'),
('TRUYENCT','Truyện cổ tích',      'Truyện cổ tích, truyện kể trước giờ đi ngủ');

INSERT INTO shipping_rate (rate_id, region_name, fee_amount, is_active) VALUES
(1, 'Đà Nẵng',        20000, TRUE),
(2, 'Miền Trung',     30000, TRUE),
(3, 'Miền Bắc/Nam',   40000, TRUE),
(4, 'Nội thành HCM (cũ)', 35000, FALSE);

INSERT INTO customer (customer_id, full_name, phone) VALUES
(1, 'Nguyễn Thị Lan',   '0905123456'),
(2, 'Trần Văn Minh',    '0912345678'),
(3, 'Lê Thị Hương',     '0987654321'),
(4, 'Phạm Quốc Bảo',    '0935111222'),
(5, 'Võ Ngọc Anh',      '0978333444');

INSERT INTO book_batch (batch_id, import_date, source_name, total_cost, created_by) VALUES
(1, '2026-09-15', 'Thanh lý thư viện trường tiểu học', 600000, 1),
(2, '2026-10-05', 'Thu mua sách cũ phụ huynh',          450000, 1),
(3, '2026-10-20', 'Nhà sách thanh lý cuối mùa',         900000, 1);
