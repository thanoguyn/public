# Tạo vhost

## 1. Copy file id_rsa vào thư mục `~/.ssh/id_rsa` (`~` là thư mục user, trên windows sẽ là thư mục C:/Users/`[tên user]` )

## 2. Chạy lệnh sau để đăng nhập vào vps

```jsx
ssh root@dev.pvmr.vn
```

## 3. Có 2 lựa chọn

### 3.1 Nếu tạo site http thì chạy lệnh sau

```jsx
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/thanoguyn/public/main/http)" sample.vn
```

### 3.2 Nếu site https thì chạy lệnh sau

```jsx
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/thanoguyn/public/main/https)" sample.vn
```

## 4. Dùng cyberduck để up source vào thư mục `/var/www/html/[domain name]/www`

- Nếu là https thì up thêm 3 file certificate vào thư mục này: `/var/www/html/[domain name]/ssl` đặt tên theo cú pháp sau đây: `domain name` `.crt`, `.key`, `.ca-bundle`
    
    ![Untitled](Ta%CC%A3o%20vhost%208b25966d5f1e46418862ba25b0577c9b/Untitled.png)
    

## 5. Test config có đúng sau bằng lệnh, nó hiện như hình là ok

```jsx
service httpd configtest
```

![Untitled](Ta%CC%A3o%20vhost%208b25966d5f1e46418862ba25b0577c9b/Untitled%201.png)

## 6. Apply thay đổi bằng lệnh:

```jsx
sudo service httpd reload
```

# Hướng dẫn tạo database

## 1. Tải dbeaver tại: [https://dbeaver.io/download/](https://dbeaver.io/download/)

## 2. Kết nối database như sau:

Chọn new → mariadb

![Untitled](Ta%CC%A3o%20vhost%208b25966d5f1e46418862ba25b0577c9b/Untitled%202.png)

Tiếp tục kết nối như sau:

![Untitled](Ta%CC%A3o%20vhost%208b25966d5f1e46418862ba25b0577c9b/Untitled%203.png)

![Untitled](Ta%CC%A3o%20vhost%208b25966d5f1e46418862ba25b0577c9b/Untitled%204.png)

Chọn test connection

![Untitled](Ta%CC%A3o%20vhost%208b25966d5f1e46418862ba25b0577c9b/Untitled%205.png)

Như vậy là đã kết nối xong, có thể tạo database và import file sql từ đây

![Untitled](Ta%CC%A3o%20vhost%208b25966d5f1e46418862ba25b0577c9b/Untitled%206.png)
