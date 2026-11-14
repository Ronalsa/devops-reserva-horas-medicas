# Imagen del servicio web de reserva de horas médicas
# Base: Nginx sobre Alpine Linux (liviana)
FROM nginx:alpine

# Metadatos para la trazabilidad de la imagen
LABEL org.opencontainers.image.title="reserva-horas-medicas" \
      org.opencontainers.image.version="1.0.0" \
      org.opencontainers.image.description="Sitio estático de reserva de horas médicas (proyecto académico DevOps)" \
      org.opencontainers.image.authors="Rodrigo Sáez"

# Copia el sitio estático a la carpeta que publica Nginx
COPY src/ /usr/share/nginx/html/

# Puerto en que escucha Nginx dentro del contenedor
EXPOSE 80
