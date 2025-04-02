# Usamos una imagen base oficial de Node.js con la versión 18
FROM node:18

# Establecemos el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiamos el package.json y package-lock.json para instalar las dependencias primero
COPY package*.json ./

# Instalamos las dependencias del proyecto
RUN npm install

# Instalamos Angular CLI globalmente
RUN npm install -g @angular/cli

# Copiamos el resto del código fuente
COPY . .

# Exponemos el puerto 4200 (usado por `ng serve` en desarrollo)
EXPOSE 4200

# Comando para ejecutar la aplicación Angular
CMD ["node", "--openssl-legacy-provider", "node_modules/@angular/cli/bin/ng", "serve", "--host", "0.0.0.0"]
