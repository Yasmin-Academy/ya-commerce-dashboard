# Use Node 18
FROM node:18

# Set working directory to /app
WORKDIR /app

# Copy everything (including .medusa)
COPY . .

# Install corepack to support yarn v4
RUN npm install -g corepack && corepack enable

# Go into the Medusa server directory
WORKDIR /app/.medusa/server

# Install dependencies
RUN yarn install

# Start Medusa server in dev mode
CMD ["yarn", "dev"]
