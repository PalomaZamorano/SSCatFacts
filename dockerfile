# Establece la imagen base
FROM ruby:3.1.3

# Instala dependencias adicionales para el entorno de ejecución de JavaScript
RUN apt-get update && apt-get install -y nodejs

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia el Gemfile y el Gemfile.lock al directorio de trabajo
COPY Gemfile Gemfile.lock ./

# Instala las dependencias del proyecto
RUN bundle install

# Copia el código fuente del proyecto al directorio de trabajo
COPY . .

# Expone el puerto que utilizará el servidor Ruby (por ejemplo, 3000)
EXPOSE 3000

# Configura el comando de inicio del contenedor
CMD ["rails", "server", "-b", "0.0.0.0"]