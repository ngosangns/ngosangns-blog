---
title: "Hướng dẫn setup CI/CD cho dự án Golang với Github Actions và Docker"
date: 2021-12-26T00:00:00+07:00
tags: ['vps', 'software', 'ssh']
---
## 1. Chuẩn bị các môi trường, công cụ

-   Repository đựng dự án Golang mình dùng tạm con API của mình
-   VPS mình dùng là Ubuntu 20.02 (cài đặt sẵn Docker)
-   Github Actions để setup tự động thực hiện các công việc khi có sự kiện từ pepository
-   Các râu ria như Make (Makefile), GIT

![](image.png)  
_Chuẩn bị các môi trường, công cụ_

## 2. Github Actions - Tạo event và job

Trong trang chính repository, bấm vào tab Actions → Workflow nhấn vào New workflow. Ở đây có các config sẵn cho các loại dự án khác nhau. Ở đây mình chọn Go để xem config mặc định.

![](image-1.png)  
_Github Actions - Tạo event và job_

Do config mặc định chỉ phù hợp để chạy Golang trong khi mình cần kết hợp Golang và Docker nên chúng ta sẽ thay đổi một chút để cho phù hợp.

![](image-2.png)  
_Github Actions - Tạo event và job_

Chúng ta tạo job chạy khi có sự kiện push lên nhánh **_master_**. Do mình sẽ tự host Runner ở bước sau nên phần _**jobs.build.runs-on**_ chúng ta sẽ để là **_self-hosted_**. Job có các step lần lượt là: checkout code, sử dụng file chứa biến môi trường .env để sử dụng cho production và bước cuối cùng là build Docker image và chạy Docker container.

Nhấn Start commit sau khi kiểm tra file config. Repository sẽ thêm vào một commit mới để add job mới vừa tạo.

## 3. Tạo các file config sử dụng cho Docker

Trong thư mục gốc của dự án tạo file _Dockerfile_, _Makefile_ và **_docker-compose.yml_** với nội dung như sau:

Dockerfile:

```dockerfile
FROM golang:1.17.5
RUN mkdir src/app
WORKDIR /src/app
COPY . .
RUN go build -o app .
ENTRYPOINT ./app
```

Makefile:

```makefile
default:
	docker build -f ./Dockerfile -t ns-english . --rm
up: default
	docker-compose up -d
	docker system prune -f
	docker volume prune -f
```

docker-compose.yml:

```yml
version: '3.6'
services:
  api:
    image: ns-english:latest
    ports:
      - "${PORT}:${PORT}"
    extra_hosts:
      - "host.docker.internal:${HOST_IP}"
    # volumes:
    #   - /home/ngosangns/Github/ns-english-api:/src/app
```

Bạn có thể thay đổi các thông số như phiên bản Golang (1.17.5), mã dự án (ns-english) để phù hợp với dự án của mình.

Ngoài ra trong file .env bạn cần định nghĩa các biến môi trường như **_PORT_** và _HOST_IP_ để sử dụng trong quá trình đóng gói Docker image.

Các file config trên sẽ định nghĩa các bước cần thực hiện trước và sau khi đóng gói Docker image.

-   **_Dockerfile_** sẽ định nghĩa các bước cần thực hiện trước khi build Docker image: Copy source code vào trong container và tiến hành tải các dependencies và build chương trình.
-   **_Makefile_** định nghĩa các câu lệnh rút gọn để thực hiện các câu lệnh dài hay một tập các câu lệnh một cách thuận tiện hơn
-   **docker-compose.yml** hỗ trợ nhiều thứ đa dạng hơn như map các cổng port và IP, mount ổ đĩa,...
-   **_extra_hosts_** mình sử dụng để map external IP từ host vào local IP bên trong container do container của mình không thể sử dụng được local IP của host

## 4. Cài đặt Runner lên VPS

Runner của Github Action là công cụ giúp lắng nghe các sự kiện xảy ra trong repository của bạn và từ đó thực hiện các công việc đã được setup trong file .yaml ở bước 2.

Ở trang chính của repository bấm vào tab Setting → Action → Runners → New self-hosted runner.

Chọn loại OS, kiến trúc OS của VPS sau đó login vào VPS và làm theo các bước đã được Github hướng dẫn. Khi cài Runner tốt nhất nên cài ở thư mục gốc của ổ đĩa.

![](image-3.png)  
_Cài đặt Runner lên VPS_

Ngoài ra chúng ta có thể chạy Runner ở dạng service để tự khởi động cùng VPS ở [đây](https://docs.github.com/en/actions/hosting-your-own-runners/configuring-the-self-hosted-runner-application-as-a-service).

## 5. Test thử

Kết quả sau các bước setup:

![](image-4.png)  
_Test thử_