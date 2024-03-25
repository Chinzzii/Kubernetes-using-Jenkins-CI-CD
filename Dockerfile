FROM centos:latest
RUN yum install -y httpd zip unzip wget && \
    yum clean all
RUN mkdir -p /var/www/html/
WORKDIR /var/www/html/
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip && \
    unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80