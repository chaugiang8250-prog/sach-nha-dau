-- 011: Bảng STOCKTAKE (Phiếu kiểm kê) - Post-MVP
-- created_by tham chiếu auth_user của Django; FK thêm ở 900_add_django_user_fk.sql.
CREATE TABLE IF NOT EXISTS stocktake (
  stocktake_id INT  NOT NULL AUTO_INCREMENT,
  created_by   INT  NOT NULL,
  check_date   DATE NOT NULL DEFAULT (CURRENT_DATE),
  note         TEXT NULL,
  PRIMARY KEY (stocktake_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
