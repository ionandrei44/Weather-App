# Stage 1: Build the application
FROM node:16 AS build

LABEL maintainer="Rohan Rustagi"

WORKDIR /app

COPY package-lock.json ./
COPY package.json ./

RUN npm ci --production

COPY . .

# Stage 2: Create the final image
FROM node:16

WORKDIR /app

COPY --from=build /app .

EXPOSE 3000

CMD [ "npm", "start" ]
