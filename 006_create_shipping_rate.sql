-- 006: Bảng SHIPPING_RATE (Phí vận chuyển)
CREATE TABLE IF NOT EXISTS shipping_rate (
  rate_id     INT           NOT NULL AUTO_INCREMENT,
  region_name VARCHAR(100)  NOT NULL,
  fee_amount  DECIMAL(10,2) NOT NULL,
  is_active   BOOLEAN       NOT NULL DEFAULT TRUE,
  PRIMARY KEY (rate_id),
  CONSTRAINT chk_shipping_fee CHECK (fee_amount >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
