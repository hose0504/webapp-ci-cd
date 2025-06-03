# ✅ 베이스 이미지: Ubuntu 24.04
FROM ubuntu:24.04

# ✅ 패키지 업데이트 및 필수 도구 설치 (curl 포함)
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# ✅ 작업 디렉터리 설정
WORKDIR /app

# ✅ JAR 복사
COPY target/*.jar app.jar

# ✅ 실행
ENTRYPOINT ["java", "-jar", "app.jar"]
