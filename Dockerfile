# Use Node.js LTS
FROM node:20-bullseye

# Install build tools and git
RUN apt-get update && apt-get install -y \
    python3 \
    build-essential \
    git \
 && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /usr/src/app

# Clone NodeBB stable release (v3.9.0 as of now)
RUN git clone --branch v3.9.0 --depth 1 https://github.com/NodeBB/NodeBB.git .

# Install dependencies
RUN npm install --production

# Expose NodeBB port
EXPOSE 4567

# Environment variables for Koyeb PostgreSQL
ENV NODEBB_SECRET=changeme \
    DATABASE=postgres \
    DATABASE_HOST=ep-muddy-hall-a4xfddxq.us-east-1.pg.koyeb.app \
    DATABASE_PORT=5432 \
    DATABASE_USER=koyeb-adm \
    DATABASE_PASSWORD=yourpassword \
    DATABASE_NAME=koyebdb \
    URL=http://localhost:4567

# Run NodeBB
CMD ["node", "app.js"]
