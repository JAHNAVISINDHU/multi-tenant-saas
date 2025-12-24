#!/bin/sh
set -e

echo "⏳ Waiting for database..."

until nc -z database 5432; do
  sleep 2
done

echo "✅ Database is up"

echo "📦 Running database migrations..."
npx sequelize-cli db:migrate

echo "🌱 Running seed data..."
npx sequelize-cli db:seed:all

echo "🚀 Starting backend server..."
node src/app.js
