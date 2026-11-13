# Reserva de Horas Médicas · Proyecto DevOps

Sitio web estático para la reserva de horas médicas de un centro de salud **ficticio**. Se sirve con **Nginx** dentro de un contenedor **Docker** y se ejecuta localmente con **Docker Compose**.

Proyecto académico de la asignatura DevOps (IACC). No usa API, base de datos ni servidores externos.

## Contenido del sitio

- **Formulario de reserva**: especialidad, fecha, bloque horario y datos de contacto. Es una demostración: **no envía ni almacena datos**.
- **Información de atención**: horarios, especialidades y recomendaciones.
- **Estado del servicio**: verifica cada 30 segundos que el servidor responda e informa el tiempo de respuesta.

## Estructura del proyecto

```
devops-reserva-horas-medicas/
├── src/
│   ├── index.html                  # Página del servicio
│   └── styles.css                  # Estilos
├── Dockerfile                      # Imagen basada en nginx:alpine
├── docker-compose.yml              # Servicio publicado en el puerto 8080
├── .env.example                    # Variables de ejemplo, sin valores sensibles
├── .gitignore                      # Archivos excluidos del repositorio
├── README.md                       # Este documento
└── .github/workflows/
    └── devops-automation.yml       # Validación automática (GitHub Actions)
```

## Requisitos

- [Git](https://git-scm.com/downloads)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) con el motor en ejecución (*Engine running*)

## Instalación

```bash
git clone https://github.com/Ronalsa/devops-reserva-horas-medicas.git
cd devops-reserva-horas-medicas
```

Opcional: crear el archivo de variables a partir del ejemplo. Si no se crea, se usan los valores por defecto.

```bash
cp .env.example .env
```

## Ejecución

```bash
docker compose up -d --build
```

Abrir en el navegador: **http://localhost:8080**

## Verificación

| Acción | Comando |
|---|---|
| Ver el estado del contenedor (debe indicar `healthy`) | `docker compose ps` |
| Ver los registros del servicio | `docker compose logs` |
| Ver el consumo de recursos | `docker stats --no-stream` |

## Detención

```bash
docker compose down
```

## Buenas prácticas de seguridad aplicadas

- No se versionan credenciales, tokens ni datos personales.
- El archivo `.env` está excluido mediante `.gitignore`; solo se publica `.env.example` con valores de ejemplo.
- El formulario es demostrativo y no envía información a ningún servidor.
- Los commits usan el correo privado de GitHub (`noreply`) para no exponer correos personales.

## Flujo de trabajo

- La rama `main` contiene solo versiones estables y no se trabaja directamente sobre ella.
- Cada tarea se desarrolla en una rama `feature/...` y se integra mediante un pull request revisado.
- Cada push y pull request hacia `main` es validado automáticamente por GitHub Actions.
- Las versiones liberadas se identifican con etiquetas, por ejemplo `v1.0.0`.

## Autor

Rodrigo Sáez · Ingeniería en Informática, IACC
