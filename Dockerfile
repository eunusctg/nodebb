FROM node:20-bullseye

# Install required build tools
RUN apt-get update && apt-get install -y python3 build-essential git rsync && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

# Clone NodeBB source
RUN git clone --branch v3.9.0 --depth 1 https://github.com/NodeBB/NodeBB.git /tmp/nodebb \
    && rsync -a /tmp/nodebb/ /usr/src/app/ \
    && rm -rf /tmp/nodebb

# Install dependencies
RUN npm install --omit=dev

# Expose NodeBB default port
EXPOSE 4567

CMD ["node", "app.js"]
