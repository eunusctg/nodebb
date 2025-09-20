FROM node:20-bullseye

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    build-essential \
    git \
 && rm -rf /var/lib/apt/lists/*

# App directory
WORKDIR /usr/src/app

# Clone NodeBB (latest stable branch)
RUN git clone -b v3.x.x https://github.com/NodeBB/NodeBB.git . 

# Install NodeBB dependencies
RUN npm install --production

# Expose NodeBB port
EXPOSE 4567

# Start NodeBB
CMD ["node", "app.js"]
