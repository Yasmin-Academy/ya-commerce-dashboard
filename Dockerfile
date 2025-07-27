# Use Node 18 (or upgrade to 20 to match your package.json)
FROM node:18

# Set working directory
WORKDIR /app

# Copy all project files (including .medusa)
COPY . .

# Install corepack to use Yarn 4
RUN npm install -g corepack && corepack enable

# Move to Medusa server directory
WORKDIR /app/.medusa/server

# Install dependencies
RUN yarn install

# Expose default Medusa port
EXPOSE 9000

# Start Medusa in production mode
CMD ["yarn", "start"]