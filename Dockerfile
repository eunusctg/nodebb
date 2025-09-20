FROM node:20-bullseye

# Install required build tools
RUN apt-get update && apt-get install -y python3 build-essential git && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

# Clone NodeBB directly into workdir
RUN git clone --branch v3.9.0 --depth 1 https://github.com/NodeBB/NodeBB.git . 

# Install dependencies
RUN npm install --omit=dev

# Expose NodeBB default port
EXPOSE 4567

CMD ["node", "app.js"]
