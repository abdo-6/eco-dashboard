# Stage 1: Build the backend
FROM node:20.10 AS backend-build

WORKDIR /app/backend

# Copy the backend source files
COPY backend/package*.json ./
RUN npm install
COPY backend/ .

# Build the backend (e.g., TypeScript compilation)
RUN npm run build

# Stage 2: Build the frontend
FROM node:20.10 AS frontend-build

WORKDIR /app/frontend

# Copy the frontend source files
COPY frontend/package*.json ./
RUN npm install
COPY frontend/ .

# Build the frontend with the output directly in the backend public folder
RUN npm run build -- --emptyOutDir



# Stage 3: Create the production-ready image
FROM node:20.10 AS production

WORKDIR /app

# Copy the built backend from the previous stage
COPY --from=backend-build /app/backend /app/backend

# Expose the backend port
EXPOSE 5000

# Set environment to production
ENV NODE_ENV=production

# Start the backend server
CMD ["sh", "-c", "cd backend && npm start"]
