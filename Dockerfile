# Stage 1: Build the application
FROM node:16 AS build

LABEL maintainer="Rohan Rustagi"

WORKDIR /app

COPY package-lock.json ./
COPY package.json ./

RUN npm install

COPY . .

# Stage 2: Create the final image using Distroless base image
FROM gcr.io/distroless/nodejs:16

WORKDIR /app

COPY --from=build /app .

EXPOSE 3000

CMD [ "npm", "start" ]
