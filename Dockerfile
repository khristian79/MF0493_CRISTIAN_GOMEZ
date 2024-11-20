# Identificar qué imagen queremos utilizar
FROM node:23-slim

# Indicar el directorio de trabajo
WORKDIR /app

# Copiar los archivos de package.json y package-lock.json
COPY package*.json ./

# Instalar las dependencias
RUN npm install \
&& npm cache clean --force \
&& rm -rf /tmp/* /root/.npm/_cacache

# Copiar el resto de los archivos
COPY . .

# Exponer el puerto en el que la aplicación se ejecutará
EXPOSE 3000

# Comando para ejecutar la aplicación
CMD ["npm", "start"]