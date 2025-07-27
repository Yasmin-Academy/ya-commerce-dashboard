# Use official Node.js image
FROM node:18

# Set working directory
WORKDIR /app

# Install Corepack to enable Yarn
RUN npm install -g corepack && corepack enable

# Copy the whole app, including built files
COPY . .

# Install only production dependencies
RUN yarn install --production

# Start Medusa server
CMD ["medusa", "start"]
