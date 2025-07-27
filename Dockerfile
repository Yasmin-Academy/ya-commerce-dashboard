FROM node:18

WORKDIR /app

# Enable Yarn (via Corepack)
RUN npm install -g corepack && corepack enable

# Copy entire local build context
COPY . .

# Install only production dependencies using Yarn 4 syntax
RUN yarn workspaces focus --all --production

# Start the prebuilt server directly
CMD ["node", ".medusa/server"]
