FROM nginx
COPY ./index.html /usr/share/nginx/html/
COPY ./conf.d/* /etc/nginx/conf.d/
COPY ./run.sh /opt/
CMD /opt/run.sh
