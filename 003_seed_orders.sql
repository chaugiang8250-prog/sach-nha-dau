-- Sample data: orders, order_item, payment, hold_queue
-- Tổng tiền = tổng unit_price của các order_item + shipping_fee.

INSERT INTO orders (order_id, customer_id, rate_id, recipient_name, recipient_phone, delivery_address, subtotal_amount, shipping_fee, total_amount, order_channel, order_status, deposit_deadline, cancel_reason, carrier, tracking_code, shipped_at, delivered_at, created_at) VALUES
-- Đơn 1: đã giao
(1, 1, 1, 'Nguyễn Thị Lan', '0905123456', '12 Nguyễn Văn Linh, Hải Châu, Đà Nẵng', 15000, 20000, 35000, 'Website', 'Delivered', '2026-10-21 12:00:00', NULL, 'Giao Hàng Nhanh', 'GHN123456789', '2026-10-22 09:00:00', '2026-10-23 15:30:00', '2026-10-20 10:00:00'),
-- Đơn 2: đang chờ cọc (giữ SND-0004)
(2, 2, 2, 'Trần Văn Minh',  '0912345678', '45 Lê Lợi, TP Huế',                       40000, 30000, 70000, 'Website', 'Awaiting Deposit', '2026-11-02 20:00:00', NULL, NULL, NULL, NULL, NULL, '2026-11-01 08:30:00'),
-- Đơn 3: đã cọc, chờ gửi
(3, 3, 3, 'Lê Thị Hương',   '0987654321', '88 Nguyễn Trãi, Thanh Xuân, Hà Nội',      125000, 40000, 165000, 'Website', 'Deposit Confirmed', '2026-10-31 18:00:00', NULL, NULL, NULL, NULL, NULL, '2026-10-30 14:20:00'),
-- Đơn 4: đã hủy do quá hạn cọc
(4, 4, 1, 'Phạm Quốc Bảo',  '0935111222', '5 Trần Phú, Hải Châu, Đà Nẵng',           25000, 20000, 45000, 'Website', 'Cancelled', '2026-10-25 12:00:00', 'Quá hạn thanh toán tiền cọc', NULL, NULL, NULL, NULL, '2026-10-24 09:00:00');

INSERT INTO order_item (order_id, sku, unit_price) VALUES
(1, 'SND-0006', 15000),
(2, 'SND-0004', 40000),
(3, 'SND-0005', 55000),
(3, 'SND-0007', 70000),
(4, 'SND-0003', 25000);

INSERT INTO payment (order_id, deposit_amount, payment_method, transfer_content, confirmed_at, payment_status) VALUES
(1, 35000, 'Bank Transfer', 'SND DH1 NGUYEN THI LAN', '2026-10-20 11:00:00', 'Confirmed'),
(2, 35000, 'Bank Transfer', 'SND DH2 TRAN VAN MINH',  NULL,                  'Pending'),
(3, 82500, 'Bank Transfer', 'SND DH3 LE THI HUONG',   '2026-10-30 16:45:00', 'Confirmed');

INSERT INTO hold_queue (sku, customer_id, joined_at, queue_status) VALUES
('SND-0004', 4, '2026-11-01 09:10:00', 'Waiting'),
('SND-0004', 5, '2026-11-01 10:05:00', 'Waiting'),
('SND-0003', 2, '2026-10-26 18:00:00', 'Waiting');
