# 베이스 이미지: 우분투 24.04
FROM ubuntu:24.04

# 패키지 업데이트 및 OpenJDK 17 설치
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk && \
    apt-get clean

# 작업 디렉터리 생성
WORKDIR /app

# jar 파일 복사 (GitHub Actions에서 Maven 빌드 후 생성된 파일)
COPY target/*.jar app.jar

# jar 실행
ENTRYPOINT ["java", "-jar", "app.jar"]
