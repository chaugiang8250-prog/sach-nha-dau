-- 007: Bảng ORDER (Đơn hàng)
-- "ORDER" là từ khóa của SQL nên bảng đặt tên là `orders`.
-- Recipient_*, Shipping_Fee, Subtotal_Amount, Total_Amount được lưu trực tiếp để bảo toàn
-- giá trị tại thời điểm đặt hàng (Three-Issue Challenge #1, #2 trong ERD Checklist).
CREATE TABLE IF NOT EXISTS orders (
  order_id         INT           NOT NULL AUTO_INCREMENT,
  customer_id      INT           NOT NULL,
  rate_id          INT           NOT NULL,
  recipient_name   VARCHAR(100)  NOT NULL,
  recipient_phone  VARCHAR(10)   NOT NULL,
  delivery_address VARCHAR(255)  NOT NULL,
  subtotal_amount  DECIMAL(12,2) NOT NULL,
  shipping_fee     DECIMAL(10,2) NOT NULL,
  total_amount     DECIMAL(12,2) NOT NULL,
  order_channel    VARCHAR(20)   NOT NULL DEFAULT 'Website',
  order_status     VARCHAR(30)   NOT NULL DEFAULT 'Awaiting Deposit',
  deposit_deadline DATETIME      NULL,
  cancel_reason    TEXT          NULL,
  carrier          VARCHAR(100)  NULL,
  tracking_code    VARCHAR(100)  NULL,
  shipped_at       DATETIME      NULL,
  delivered_at     DATETIME      NULL,
  created_at       DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (order_id),
  UNIQUE KEY uq_orders_tracking_code (tracking_code),
  KEY idx_orders_customer (customer_id),
  KEY idx_orders_rate (rate_id),
  KEY idx_orders_status (order_status),
  CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
  CONSTRAINT fk_orders_rate     FOREIGN KEY (rate_id)     REFERENCES shipping_rate (rate_id),
  CONSTRAINT chk_orders_amounts CHECK (subtotal_amount >= 0 AND shipping_fee >= 0 AND total_amount >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
