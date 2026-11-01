-- 005: Bảng BOOK_IMAGE (Hình ảnh sách)
CREATE TABLE IF NOT EXISTS book_image (
  image_id   INT          NOT NULL AUTO_INCREMENT,
  sku        VARCHAR(30)  NOT NULL,
  image_url  VARCHAR(500) NOT NULL,
  image_type VARCHAR(30)  NOT NULL,
  PRIMARY KEY (image_id),
  KEY idx_book_image_sku (sku),
  CONSTRAINT fk_book_image_book FOREIGN KEY (sku) REFERENCES book (sku) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
