FROM node:18

WORKDIR /app

# Install Corepack to enable Yarn
RUN npm install -g corepack && corepack enable

# Copy the full project (including prebuilt .medusa and frontend dist)
COPY . .

# Correct Yarn 4+ production install
RUN yarn workspaces focus --all --production

# Start Medusa server
CMD ["medusa", "start"]
