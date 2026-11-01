-- 012: Bảng STOCKTAKE_ITEM (Chi tiết kiểm kê) - Post-MVP
CREATE TABLE IF NOT EXISTS stocktake_item (
  stocktake_item_id INT         NOT NULL AUTO_INCREMENT,
  stocktake_id      INT         NOT NULL,
  sku               VARCHAR(30) NOT NULL,
  system_status     VARCHAR(20) NOT NULL,
  actual_status     VARCHAR(20) NOT NULL,
  result            VARCHAR(20) NOT NULL DEFAULT 'Match',
  PRIMARY KEY (stocktake_item_id),
  KEY idx_stocktake_item_stocktake (stocktake_id),
  KEY idx_stocktake_item_sku (sku),
  CONSTRAINT fk_stocktake_item_stocktake FOREIGN KEY (stocktake_id) REFERENCES stocktake (stocktake_id) ON DELETE CASCADE,
  CONSTRAINT fk_stocktake_item_book      FOREIGN KEY (sku)          REFERENCES book (sku)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
