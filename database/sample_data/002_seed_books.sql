-- Sample data: book, book_image
INSERT INTO book (sku, batch_id, category_id, title, author, age_min, age_max, language, condition_level, defect_description, original_price, selling_price, cost_price, book_status, is_hidden, short_description) VALUES
('SND-0001', 1, 'TRUYEN',   'Doraemon - Tập 1',            'Fujiko F. Fujio',   6, 12, 'Tiếng Việt', 'Tốt',      NULL,                        20000,  12000,  6000, 'Available', FALSE, 'Truyện tranh Doraemon tập đầu tiên'),
('SND-0002', 1, 'TRUYEN',   'Thám tử lừng danh Conan - 5', 'Gosho Aoyama',     8, 14, 'Tiếng Việt', 'Khá',      'Gáy sách hơi cong',         22000,  13000,  7000, 'Available', FALSE, 'Tập 5 của series Conan'),
('SND-0003', 1, 'KYNANG',   'Bé học cách chia sẻ',         'Nhiều tác giả',     3,  7, 'Tiếng Việt', 'Rất tốt',  NULL,                        45000,  25000, 12000, 'Available', FALSE, 'Truyện dạy trẻ biết chia sẻ'),
('SND-0004', 2, 'KHOAHOC',  'Vì sao? Cơ thể con người',    'Nhiều tác giả',     7, 12, 'Tiếng Việt', 'Tốt',      'Có vài nét bút chì bên trong', 80000, 40000, 20000, 'Reserved',  FALSE, 'Bách khoa nhỏ về cơ thể'),
('SND-0005', 2, 'NGOAINGU', 'English for Kids - Level 1',  'Oxford Press',      5,  9, 'Tiếng Anh', 'Khá',      'Bìa góc bị sờn',            120000, 55000, 25000, 'Reserved', FALSE, 'Sách học tiếng Anh cho trẻ cấp độ 1'),
('SND-0006', 2, 'TRUYENCT', 'Tấm Cám',                     'Dân gian',          4,  9, 'Tiếng Việt', 'Tốt',      NULL,                        30000,  15000,  8000, 'Sold',      FALSE, 'Truyện cổ tích Tấm Cám có tranh minh họa'),
('SND-0007', 3, 'KHOAHOC',  'Khám phá vũ trụ',             'DK Publishing',     8, 14, 'Tiếng Việt', 'Rất tốt',  NULL,                        150000, 70000, 35000, 'Reserved', FALSE, 'Sách khổ lớn, nhiều hình ảnh'),
('SND-0008', 3, 'TRUYENCT', 'Cô bé quàng khăn đỏ',         'Charles Perrault',  3,  8, 'Tiếng Việt', 'Khá',      'Trang cuối có vết ố nhẹ',   35000,  18000,  9000, 'Available', TRUE,  'Đang ẩn để chụp lại ảnh');

INSERT INTO book_image (sku, image_url, image_type) VALUES
('SND-0001', '/media/books/SND-0001-cover.jpg',  'Cover'),
('SND-0001', '/media/books/SND-0001-back.jpg',   'Back'),
('SND-0002', '/media/books/SND-0002-cover.jpg',  'Cover'),
('SND-0002', '/media/books/SND-0002-defect.jpg', 'Defect'),
('SND-0003', '/media/books/SND-0003-cover.jpg',  'Cover'),
('SND-0004', '/media/books/SND-0004-cover.jpg',  'Cover'),
('SND-0005', '/media/books/SND-0005-cover.jpg',  'Cover'),
('SND-0006', '/media/books/SND-0006-cover.jpg',  'Cover'),
('SND-0007', '/media/books/SND-0007-cover.jpg',  'Cover');
