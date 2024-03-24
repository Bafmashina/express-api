# Исользуем образ линукс Alpine с версией ноды 14
FROM node:19.5.0-alpine

# Указываем рабочию деррикторию
WORKDIR /app

# Скопируем package.json и package-Lock.json внутрь контейнера

COPY package*.json ./

# Устанавливаем зависимости
RUN npm install

# Копируем оставшееся приложение в контейнер
COPY . .

# Установить Prisma
RUN npm install -g prisma

# Генерируем Prisma Client
RUN prisma generate

# Копируем Prisma schema
COPY prisma/schema.prisma ./prisma/

# Открыть порт в нашем контейнере
EXPOSE 3000

# Запускаем наш сервкр
CMD [ "npm", "start" ]