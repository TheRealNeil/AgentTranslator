# Simple Example Translation App (Active Agent)

This is a simple example translation application built using Active Agent. It demonstrates how to use Active Agent to translate text between languages with the help of OpenAI's API.

## Getting Started

Follow these steps to set up and run the app:

1. **Clone the repository**
   ```sh
   git clone <repository-url>
   cd translator
   ```

2. **Install dependencies**
   ```sh
   bundle install
   ```

3. **Set up an LLM**

   We've setup two LLM providers. OpenAI and Ollam, you only need one to get going.

   a. **Set up OpenAI credentials**
    - You must set your OpenAI API key in the Rails credentials.
    - Run:
      ```sh
      EDITOR="nano" bin/rails credentials:edit
      ```
    - Add the following (replace `your-openai-api-key` with your actual key):
      ```yaml
      openai:
        api_key: your-openai-api-key
      ```
   b. **Set up Ollama on your local machine**

   To use the gemma3:latest model locally via Ollama:
    - Install Ollama
      Follow the instructions at https://ollama.com/download to install Ollama for your operating system.
    - Start Ollama
   ```
   ollama serve
   ```
    - Pull the gemma3:latest model
   ```
   ollama pull gemma3:latest
   ```
   Refer to the Ollama documentation for more details.

5. **Run the application**
   ```sh
   bin/dev
   ```
   Visit `http://localhost:3000` in your browser.

## Notes

- This app is for demonstration purposes and uses the Active Agent gem to interact with OpenAI for translations.
- Make sure you have a valid OpenAI API key.
