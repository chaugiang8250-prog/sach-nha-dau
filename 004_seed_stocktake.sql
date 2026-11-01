-- Sample data: stocktake, stocktake_item (Post-MVP)
INSERT INTO stocktake (stocktake_id, created_by, check_date, note) VALUES
(1, 1, '2026-10-31', 'Kiểm kê định kỳ cuối tháng 10');

INSERT INTO stocktake_item (stocktake_id, sku, system_status, actual_status, result) VALUES
(1, 'SND-0001', 'Available', 'Available', 'Match'),
(1, 'SND-0002', 'Available', 'Available', 'Match'),
(1, 'SND-0004', 'Reserved',  'Reserved',  'Match'),
(1, 'SND-0006', 'Sold',      'Missing',   'Mismatch');
