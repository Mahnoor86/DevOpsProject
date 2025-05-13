# Use official Node.js 18 image
FROM node:18

# Set working directory inside the container
WORKDIR /app

# Copy only package.json and lock file first (to leverage Docker layer caching)
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install

# Now copy the rest of the project files
COPY . .

# Expose Expo development server port (8081 for Metro bundler)
EXPOSE 8081

# Start the app using Expo
CMD ["yarn", "start"]
