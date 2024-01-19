# Guía de inicio rápido: Compose y Next.js en una PC con Windows 11 por Mario Medina

Esta guía de inicio rápido demuestra cómo usar Docker Compose para configurar y ejecutar una aplicación de Next v14.0.4. Antes de empezar,
[instala Compose](https://docs.docker.com/compose/install/).

### Software utilizado 

```
node 18
next 14.0.4,
react 18.2.0
```


## Deploy con docker compose

```
# Create a network, which allows containers to communicate
# with each other, by using their container name as a hostname
docker network create my_network

# Build dev
docker compose -f docker-compose.dev.yml build

# Up dev
docker compose -f docker-compose.dev.yml up
```

Después de que se inicie la aplicación, vaya a `http://localhost:3000` en su navegador web.

## Contenedor original

El contenedor original fue obtenido de  [Vercel](https://github.com/vercel/next.js/tree/canary/examples/with-docker-compose) y modificado para trabajar en Windows 11

