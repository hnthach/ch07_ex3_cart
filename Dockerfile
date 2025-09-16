# Dùng Tomcat 9 với JDK 17 (giống môi trường bạn đang chạy local)
FROM tomcat:9.0-jdk17-temurin

# Xóa webapps mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file WAR của bạn vào container và rename thành ROOT.war
COPY ch07_ex3_cart_war.war /usr/local/tomcat/webapps/ROOT.war

# Mở port 8080
EXPOSE 8080

# Chạy Tomcat
CMD ["catalina.sh", "run"]
