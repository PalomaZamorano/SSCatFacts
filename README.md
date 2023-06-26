# SSCatFact

## Introducción

Página web de SSCatFact

## Stack

### Lenguaje

- Ruby 3.1.3
- Rails 7.0.5

## Setup proyecto

### Cómo hacer correr el proyecto desde cero

Para comenzar a utilizar Docker y Docker Compose es necesario descargar Docker [aqui](https://www.docker.com/).

Nota: si tienes Ubuntu o alguna distribución de Linux puedes ejecutar `sudo usermod -aG docker $USER` (luego logout y login de tu cuenta) para no tener que ejecutar `sudo` en cada comando de docker

Generar imagen de docker

```bash
  docker-compose build
```

Instalar gemas

```bash
docker-compose run web bundle install
```

Migrar migraciones pendientes 

```bash
  docker-compose run web rails db:migrate
```

### Ejecutar proyecto

```bash
  docker-compose up
```

## Cómo correr tests

Ingresar a directorio del docker

```bash
docker-compose exec web bash
```

Ir a path de test creados

```bash
cd test/controllers y cd test/models
#Correr test controlador
ruby -Ilib:test fact_cats_test.rb
#Correr test modelo user
ruby -Ilib:test user_test.rb
```



## Diagrama de clases UML

![image-20230626174738824](/home/paloma/.config/Typora/typora-user-images/image-20230626174738824.png)



## Vistas relevantes

http://0.0.0.0:3000/

![image-20230626170056494](/home/paloma/.config/Typora/typora-user-images/image-20230626170056494.png)

http://0.0.0.0:3000/fact_cats

![image-20230626170209060](/home/paloma/.config/Typora/typora-user-images/image-20230626170209060.png)

http://0.0.0.0:3000/fact_cats_favorite

![image-20230626170302564](/home/paloma/.config/Typora/typora-user-images/image-20230626170302564.png)
