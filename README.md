# Database

Thư mục lưu các tài liệu và thành phần liên quan đến cơ sở dữ liệu của hệ thống (MySQL 8.0).

## Danh sách bảng (12 bảng)

| # | Bảng | Mô tả | Migration |
|---|---|---|---|
| 1 | `customer` | Khách hàng | 001 |
| 2 | `category` | Thể loại sách | 002 |
| 3 | `book_batch` | Lô nhập sách | 003 |
| 4 | `book` | Sách (PK là `sku`) | 004 |
| 5 | `book_image` | Hình ảnh sách | 005 |
| 6 | `shipping_rate` | Phí vận chuyển theo khu vực | 006 |
| 7 | `orders` | Đơn hàng | 007 |
| 8 | `order_item` | Chi tiết đơn (bảng liên kết Order–Book) | 008 |
| 9 | `payment` | Thanh toán / tiền cọc | 009 |
| 10 | `hold_queue` | Hàng chờ sách | 010 |
| 11 | `stocktake` | Phiếu kiểm kê (Post-MVP) | 011 |
| 12 | `stocktake_item` | Chi tiết kiểm kê (Post-MVP) | 012 |

## Quyết định thiết kế cần lưu ý

- **Bảng `orders`** (không phải `order`): `ORDER` là từ khóa SQL.
- **Lưu `subtotal_amount`, `shipping_fee`, `total_amount`, `unit_price`, `recipient_*`** trong đơn hàng để bảo toàn giá trị tại thời điểm đặt, không bị đổi khi giá sách / thông tin khách thay đổi.
- **`created_by`** (book_batch, stocktake) trỏ tới `auth_user.id` của Django. Bảng này do Django tạo, nên FK được thêm bằng `optional/900_add_django_user_fk.sql` sau khi chạy `python manage.py migrate`.
- Chưa có bảng `Book_Status_Log` (DS10 trong DFD–ERD Matrix đang ghi *Missing in ERD*) – cần nhóm quyết định.
- Các giá trị trạng thái (`book_status`, `order_status`, `payment_status`, `queue_status`) hiện là `VARCHAR`; cần thống nhất với Data Dictionary.

## Chạy migration

**Tự động (Docker):** các file trong `migrations/` được mount vào `docker-entrypoint-initdb.d`, MySQL tự chạy theo thứ tự tên file khi `docker compose up -d` lần đầu.

**Thủ công:**

```bash
for f in database/migrations/*.sql; do
  mysql -uroot -p sach_nha_dau < "$f"
done
```

## Nạp dữ liệu mẫu

```bash
bash database/seed.sh
```

Trên Windows PowerShell (không có bash):

```powershell
Get-ChildItem database\sample_data\*.sql | ForEach-Object {
  Get-Content $_ -Raw -Encoding UTF8 | docker compose exec -T db mysql -uroot -p"<mật_khẩu>" --default-character-set=utf8mb4 sach_nha_dau
}
```

Thứ tự bắt buộc (do khóa ngoại): `001_seed_reference` → `002_seed_books` → `003_seed_orders` → `004_seed_stocktake`.

## Kiểm tra nhanh

```sql
SHOW TABLES;
SELECT COUNT(*) FROM book;
SELECT o.order_id, c.full_name, o.order_status, o.total_amount
FROM orders o JOIN customer c ON c.customer_id = o.customer_id;
```
