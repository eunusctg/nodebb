# Use Node.js 20
FROM node:20-bullseye

# Install required system packages
RUN apt-get update && apt-get install -y \
    python3 \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /usr/src/app

# Clone NodeBB properly
RUN git clone --branch v3.9.0 --depth 1 https://github.com/NodeBB/NodeBB.git /tmp/nodebb \
    && mv /tmp/nodebb/* /usr/src/app/ \
    && rm -rf /tmp/nodebb

# Install dependencies
RUN npm install --omit=dev

# Expose NodeBB port
EXPOSE 4567

# Start NodeBB
CMD ["node", "app.js"]
