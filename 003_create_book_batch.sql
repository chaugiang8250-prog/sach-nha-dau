-- 003: Bảng BOOK_BATCH (Lô nhập sách)
-- created_by tham chiếu bảng auth_user của Django (do Django tạo bằng `python manage.py migrate`).
-- Vì vậy FK này KHÔNG khai báo ở đây; xem 900_add_django_user_fk.sql (chạy sau khi Django migrate).
CREATE TABLE IF NOT EXISTS book_batch (
  batch_id    INT           NOT NULL AUTO_INCREMENT,
  import_date DATE          NOT NULL DEFAULT (CURRENT_DATE),
  source_name VARCHAR(150)  NOT NULL,
  total_cost  DECIMAL(12,2) NOT NULL DEFAULT 0,
  created_by  INT           NOT NULL,
  PRIMARY KEY (batch_id),
  CONSTRAINT chk_book_batch_total_cost CHECK (total_cost >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
