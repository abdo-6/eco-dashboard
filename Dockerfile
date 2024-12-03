# Stage 1: Build the frontend
FROM node:20.10 AS frontend-build

WORKDIR /app/frontend

# Copy and install frontend dependencies
COPY frontend/package*.json ./
RUN npm install
COPY frontend/ ./

# Build the frontend with the output directly into the backend's public directory
RUN npm run build -- --emptyOutDir

# Stage 2: Build the backend
FROM node:20.10 AS backend-build

WORKDIR /app/backend

# Copy backend dependencies and source files
COPY backend/package*.json ./
RUN npm install
COPY backend/ ./

# Ensure the frontend build files are already in `src/public`
# No additional COPY is needed as frontend build output goes directly to the public directory

# Build the backend (e.g., TypeScript compilation)
RUN npm run build

# Stage 3: Create the production-ready image
FROM node:20.10 AS production

WORKDIR /app/backend

# Copy the compiled backend and static files from the build stage
COPY --from=backend-build /app/backend /app/backend

# Expose the backend port
EXPOSE 5000

# Set the environment to production
ENV NODE_ENV=production

# Start the backend server
CMD ["npm", "start"]
