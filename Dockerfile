FROM node:23-slim

WORKDIR /app

# Copy package files first for better layer caching
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Expose port
EXPOSE 5173

# Run dev server (with host flag to allow external connections)
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]
