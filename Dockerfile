#Image debian:bookworm-slim
FROM debian:bookworm-slim
#Desactivation de l'interractivité forcée
ENV DEBIAN_FRONTEND=noninteractive
#Label de l'image
LABEL description="Bookwom"
#install d'apache
RUN apt update -y && apt install -y apache2
#install php 7.4
RUN apt install software-propoties-common -y && apt install php -y
#Expose le port 80
EXPOSE 80
#Création et montage du répertoire pour le volume
RUN mkdir /var/www/html/data
VOLUME mkdir /var/www/html/data
#Création du fichier PHPINFO
RUN echo "<?php phpinfo(); ?>" > /var/www/html/data/info.php
#Démarrer Apache
CMD ["apachetl","-D","FOREGROUND"]
