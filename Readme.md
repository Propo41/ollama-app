## Get started

Move all contents of this folder to desktop

1. Download the docker image as per instructions: https://github.com/ollama/ollama/blob/main/docs/docker.md 
2. Make sure to download Nvidia container toolkit
3. Run: `docker run -d --gpus=all -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama` to start container
4. Test it by running: `docker exec -it ollama ollama run llama3`

## Using the UI

Im using: https://github.com/jakobhoeg/nextjs-ollama-llm-ui 

To make the UI into an executable, follow these steps: 

1. npm run build
2. Make sure to fix the paths correctly in the shell scripts
3. `mv ollama.desktop ~/.local/share/applications/`
4. Now you can search for Ollama and run the app