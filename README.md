# SITIO PARA LA INMOBILIARIA CBC

* Ruby version: 3.2.0
* Rails version: 7
* Database: SQLite

# Pasos para instalar y correr el proyecto:

**Se agrego un archivo Dockerfile para que no sea necesario instalar Ruby**

### Comando para construir la imagen desde dockerfile: 

```sh
docker build -t cbc_site .
```

### Ejecutar la imagen y crear contenedor
```sh
docker run -d -p 3000:3000 cbc_site
```

### Correr las migraciones de rails
```sh
docker exec -it [ID DEL CONTENEDOR] rails db:migrate
```

### Correr los seeds de rails
```sh
docker exec -it [ID DEL CONTENEDOR] rails db:seed
```

### Abrir en el navegador localhost:3000



