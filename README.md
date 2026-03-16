# Demo GitHub Action — Bài 7 CI/CD

Dự án Spring Boot kết hợp CI/CD với GitHub Actions và Docker.

## Chạy local

```bash
mvn spring-boot:run
```

Mở trình duyệt: http://localhost:8080

## Build & chạy bằng Docker

```bash
docker build -t demo-github-action .
docker run -p 8080:8080 demo-github-action
```

## CI/CD

- Push lên nhánh `main` → GitHub Actions tự động build image và push lên Docker Hub.
- Cần cấu hình Secrets: `DOCKER_USERNAME`, `DOCKER_PASSWORD` (Access Token Docker Hub).
