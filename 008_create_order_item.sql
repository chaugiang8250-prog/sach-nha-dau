-- 008: Bảng ORDER_ITEM (Chi tiết đơn hàng) - bảng liên kết M:N giữa ORDER và BOOK
-- unit_price lưu giá tại thời điểm đặt (không phụ thuộc book.selling_price hiện tại).
CREATE TABLE IF NOT EXISTS order_item (
  item_id    INT           NOT NULL AUTO_INCREMENT,
  order_id   INT           NOT NULL,
  sku        VARCHAR(30)   NOT NULL,
  unit_price DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (item_id),
  UNIQUE KEY uq_order_item_order_sku (order_id, sku),
  KEY idx_order_item_sku (sku),
  CONSTRAINT fk_order_item_order FOREIGN KEY (order_id) REFERENCES orders (order_id) ON DELETE CASCADE,
  CONSTRAINT fk_order_item_book  FOREIGN KEY (sku)      REFERENCES book (sku),
  CONSTRAINT chk_order_item_price CHECK (unit_price >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
