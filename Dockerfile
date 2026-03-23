# Build stage
FROM maven:3.9-eclipse-temurin-21-alpine AS build
WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline -B

COPY src ./src
RUN mvn package -DskipTests -B

# Run stage
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

# Tớ tạm comment 2 dòng này lại vì user 'spring' không có quyền mở port 80 trên Linux.
# Nếu hệ thống cấp quyền sẵn thì cậu có thể mở lại sau nhé.
# RUN addgroup -S spring && adduser -S spring -G spring
# USER spring:spring

COPY --from=build /app/target/*.jar app.jar

# Đổi thông báo port cho Docker biết
EXPOSE 80

# Ép Spring Boot chạy ở port 80 bằng tham số --server.port=80
ENTRYPOINT ["java", "-jar", "app.jar", "--server.port=80"]
