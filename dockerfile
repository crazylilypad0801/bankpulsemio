version: '3.8'

services:
  # Servidor Web Apache
  web:
    image: httpd:2.4
    volumes:
      # Sincroniza tu código local con el directorio raíz de Apache
      - ../:/usr/local/apache2/htdocs/
    ports:
      - "8080:80"
    networks:
      - app-network

  # Base de Datos MySQL
  db:
    image: mysql:9.0
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: root_password
      MYSQL_DATABASE: mi_base_datos
      MYSQL_USER: usuario_web
      MYSQL_PASSWORD: tu_password
    ports:
      - "3306:3306"
    volumes:
      - mysql-data:/var/lib/mysql
    networks:
      - app-network

volumes:
  mysql-data:

networks:
  app-network:
    driver: bridge
