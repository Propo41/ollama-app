#!/bin/bash
# run this if container not created
# docker run -d --gpus=all -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama

# Source the profile script to set up environment variables
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Use the desired Node version
nvm use 20
# Function to handle cleanup on exit
cleanup() {
    echo "Stopping Next.js server and Docker container..."
    kill $NEXTJS_PID
    docker stop ollama
    exit
}

docker start ollama
cd /home/primesquid/Desktop/ollama-ui
npm run dev & 
NEXTJS_PID=$!

# Set trap to catch termination signals and run cleanup
trap cleanup SIGINT SIGTERM

# Wait a few seconds for the server to start
sleep 5 

# Open the default web browser to the app's URL
xdg-open http://localhost:3000

# Wait for the Next.js process to complete (this keeps the script running)
wait $NEXTJS_PID
