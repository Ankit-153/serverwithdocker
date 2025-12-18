# Use the official lightweight Node.js image
FROM node:18-slim

# Set the working directory inside the container
WORKDIR /app

# Copy package files first to optimize build caching
COPY package*.json ./

# Install production dependencies only
RUN npm install --only=production

# Copy the rest of your server code
COPY . .

# Set the environment variable for your server.js logic
ENV PORT=8765

# Inform Docker that the container listens on this port
EXPOSE 8765

# Command to run your app as defined in package.json
CMD ["npm", "start"]
