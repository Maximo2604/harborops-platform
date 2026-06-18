FROM amazonlinux:2023
RUN dnf install -y httpd && dnf clean all
COPY app/ /var/www/html/
EXPOSE 80
CMD ["httpd", "-D", "FOREGROUND"]
