FROM node:23-alpine AS builder

#Build time env vars
ARG GH_TOKEN
ENV GITHUB_PAT=${GH_TOKEN}

WORKDIR /app
COPY package*.json .
RUN npm ci
COPY . .
RUN npm run build
RUN npm ci --prod

FROM node:23-alpine
WORKDIR /app
COPY --from=builder /app/build ./build
COPY --from=builder /app/node_modules ./node_modules
COPY package*.json .

CMD ["node", "build"]