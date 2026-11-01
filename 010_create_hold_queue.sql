-- 010: Bảng HOLD_QUEUE (Hàng chờ sách)
CREATE TABLE IF NOT EXISTS hold_queue (
  queue_id    INT         NOT NULL AUTO_INCREMENT,
  sku         VARCHAR(30) NOT NULL,
  customer_id INT         NOT NULL,
  joined_at   DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  queue_status VARCHAR(20) NOT NULL DEFAULT 'Waiting',
  PRIMARY KEY (queue_id),
  KEY idx_hold_queue_sku (sku),
  KEY idx_hold_queue_customer (customer_id),
  CONSTRAINT fk_hold_queue_book     FOREIGN KEY (sku)         REFERENCES book (sku),
  CONSTRAINT fk_hold_queue_customer FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
