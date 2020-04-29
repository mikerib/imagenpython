FROM ubuntu
RUN apt-get update
RUN apt-get install -y python
RUN echo 1.0 >> /etc/version && apt-get install -y git \
&&  apt-get install -y iputils-ping
RUN mkdir /datos
WORKDIR /datos
RUN touch f1.txt
WORKDIR /datos2
RUN touch f2.txt 

COPY index.html .
COPY app.log /datos/


ADD carpe1 carpe
ADD f* /datos/
ADD paquete1.tar .


ENV dirmiki=/miki dirmiki2=/miki2
RUN mkdir $dirmiki && mkdir $dirmiki2

#ARG dir2
#RUN mkdir $dir2

#ARG user
#ENV user_docker $user
#ADD add_user.sh /
#RUN /add_user.sh

RUN apt-get install -y apache2
EXPOSE 80
ADD puntoentrada.sh /
ADD paginas /var/www/html
VOLUME ["/var/www/html"]

CMD /puntoentrada.sh
