# Sách Nhà Đậu – Website bán sách cũ tích hợp quản trị tồn kho

> Nhóm 42 – Module 6: Data Design & System Environment

Website bán sách cũ cho trẻ em, tích hợp quản lý lô nhập, tồn kho (trạng thái từng cuốn theo SKU), đơn hàng, tiền cọc, hàng chờ và kiểm kê.

## Cấu trúc thư mục

```
sach-nha-dau/
├── backend/            # Source backend (Django) – skeleton
├── database/
│   ├── migrations/     # 001–012: tạo bảng theo Relational Schema
│   ├── sample_data/    # Dữ liệu mẫu
│   ├── optional/       # Script chạy tay (FK tới auth_user của Django)
│   ├── seed.sh         # Nạp sample data vào container MySQL
│   └── README.md
├── docs/               # ERD, System Architecture, tài liệu đề cương, bằng chứng chạy DB
├── docker-compose.yml  # MySQL 8 cho môi trường phát triển
├── .env.example        # Mẫu biến môi trường
└── README.md
```

## Technology Stack

| Thành phần | Công nghệ |
|---|---|
| Database | MySQL 8.0 |
| Backend | Django (Python) |
| Môi trường | Docker / Docker Compose |
| Quản lý mã nguồn | Git, GitHub |

## Hướng dẫn chạy database

Yêu cầu: cài [Docker Desktop](https://www.docker.com/products/docker-desktop/).

```bash
# 1. Tạo file biến môi trường
cp .env.example .env        # sau đó mở .env và đổi MYSQL_ROOT_PASSWORD

# 2. Khởi động MySQL – các migration 001–012 tự chạy ở lần khởi tạo đầu tiên
docker compose up -d

# 3. Nạp dữ liệu mẫu
bash database/seed.sh

# 4. Kiểm tra
docker compose exec db mysql -uroot -p sach_nha_dau -e "SHOW TABLES;"
```

Khởi tạo lại từ đầu (xóa toàn bộ dữ liệu): `docker compose down -v && docker compose up -d`

## Tài liệu thiết kế

- ERD: [`docs/ERD.png`](docs/ERD.png)
- Kiến trúc hệ thống: [`docs/System Architecture.pdf`](docs/System%20Architecture.pdf)
- Chi tiết database: [`database/README.md`](database/README.md)

## Thành viên nhóm

| Họ tên | Vai trò |
|---|---|
| Bùi Thị Châu Giang | Repository & README, Database/Migration, Môi trường |
| Phan Thị Minh Nguyệt | ERD & Relational Schema |
| Phan Thị Minh Nguyệt | DFD–ERD Consistency Matrix |
| Trần Nhật Lệ  | Architecture & Wireframes |

## Quy ước làm việc

- Làm việc trên branch riêng, tạo Pull Request vào `main`.
- Commit message rõ ràng, ví dụ: `Add orders migration`.
- Không commit `.env` hoặc mật khẩu thật.