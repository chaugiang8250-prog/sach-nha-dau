-- 009: Bảng PAYMENT (Thanh toán / tiền cọc)
CREATE TABLE IF NOT EXISTS payment (
  payment_id       INT           NOT NULL AUTO_INCREMENT,
  order_id         INT           NOT NULL,
  deposit_amount   DECIMAL(12,2) NOT NULL,
  payment_method   VARCHAR(30)   NOT NULL DEFAULT 'Bank Transfer',
  transfer_content VARCHAR(255)  NOT NULL,
  confirmed_at     DATETIME      NULL,
  payment_status   VARCHAR(20)   NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (payment_id),
  KEY idx_payment_order (order_id),
  CONSTRAINT fk_payment_order FOREIGN KEY (order_id) REFERENCES orders (order_id),
  CONSTRAINT chk_payment_amount CHECK (deposit_amount >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
