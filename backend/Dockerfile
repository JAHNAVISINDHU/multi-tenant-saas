# ---------- BUILD STAGE ----------
FROM node:18-alpine AS build

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install --only=production

COPY . .

# ---------- RUN STAGE ----------
FROM node:18-alpine

WORKDIR /app

# Create non-root user (Docker best practice)
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

COPY --from=build /app /app

RUN chown -R appuser:appgroup /app
USER appuser

EXPOSE 5000

CMD ["sh", "start.sh"]
