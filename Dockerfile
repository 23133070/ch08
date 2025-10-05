# Sử dụng Tomcat 9 + JDK11
FROM tomcat:9.0-jdk11

# Xóa app mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR vào Tomcat (deploy ở ROOT)
COPY CH08_EX1_EMAIL.war /usr/local/tomcat/webapps/ROOT.war

# Expose port
EXPOSE 8080

# Run Tomcat
CMD ["catalina.sh", "run"]
