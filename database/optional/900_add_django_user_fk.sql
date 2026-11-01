-- 900: (TÙY CHỌN) Thêm FK created_by -> auth_user(id) của Django.
-- CHỈ chạy SAU KHI backend Django đã chạy `python manage.py migrate` (để có bảng auth_user),
-- và các bản ghi hiện có phải có created_by trùng một id có thật trong auth_user.
-- File này nằm ngoài docker-entrypoint tự động; chạy tay khi cần:
--   mysql -u root -p sach_nha_dau < database/optional/900_add_django_user_fk.sql
ALTER TABLE book_batch
  ADD CONSTRAINT fk_book_batch_created_by FOREIGN KEY (created_by) REFERENCES auth_user (id);

ALTER TABLE stocktake
  ADD CONSTRAINT fk_stocktake_created_by FOREIGN KEY (created_by) REFERENCES auth_user (id);
