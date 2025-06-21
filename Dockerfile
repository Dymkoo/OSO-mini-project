FROM node:18-alpine

# Ustawiamy katalog roboczy
WORKDIR /app

# Kopiujemy pliki package.json i package-lock.json (lub yarn.lock)
COPY package*.json ./

# Instalujemy produkcyjne zależności, nie buildujemy devDependencies
RUN npm ci --omit=dev

# Kopiujemy resztę aplikacji
COPY . .

# Expose port
EXPOSE 3000

# Uruchamiamy aplikację
CMD ["npm", "start"]
