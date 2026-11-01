-- 002: Bảng CATEGORY (Danh mục sách)
CREATE TABLE IF NOT EXISTS category (
  category_id   VARCHAR(10)  NOT NULL,
  category_name VARCHAR(100) NOT NULL,
  description   TEXT         NULL,
  PRIMARY KEY (category_id),
  UNIQUE KEY uq_category_name (category_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
