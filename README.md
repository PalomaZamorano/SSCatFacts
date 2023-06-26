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

![image](https://github.com/PalomaZamorano/SSCatFacts/assets/31086486/213f18c0-7d4e-4bf6-9027-eecb1fdbc811)


## Vistas relevantes

http://0.0.0.0:3000/ sin login

![image](https://github.com/PalomaZamorano/SSCatFacts/assets/31086486/b99a41a8-702a-49a2-a38c-d008059ba920)

http://0.0.0.0:3000/ con login 

![image](https://github.com/PalomaZamorano/SSCatFacts/assets/31086486/6eeeefd1-e179-484b-a30d-797ed7a862a1)

http://0.0.0.0:3000/fact_cats

![image](https://github.com/PalomaZamorano/SSCatFacts/assets/31086486/00ce4954-6e77-4ebd-b2c9-029f73b16857)

http://0.0.0.0:3000/fact_cats_favorite

![image](https://github.com/PalomaZamorano/SSCatFacts/assets/31086486/ea69b90b-6e2e-4da9-81a2-191af14e26d2)

