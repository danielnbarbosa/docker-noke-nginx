FROM nginx
COPY ./index.html /usr/share/nginx/html/
COPY ./conf.d/default.conf /etc/nginx/conf.d/
COPY ./conf.d/noke.bit.conf /etc/nginx/conf.d/
COPY ./run.sh /opt/
CMD /opt/run.sh
