# AI Doctor Voicebot

[![VoxMed AI](https://img.shields.io/badge/VoxMedAI-Live_App-red?logo=render&logoColor=white)](https://voxmed-ai-app.onrender.com)   click this button for live demo

AI Doctor Voicebot is a Gradio-based web application that acts as an AI medical assistant. It allows users to upload medical images (like skin conditions) and speak their symptoms using their microphone. The AI transcribes the speech, analyzes the image, and provides a conversational response mimicking a doctor, read back to the user via Text-to-Speech (TTS).

> **Note**: This application is for **learning and demonstration purposes only**. It is not a real doctor and should not be used for actual medical diagnosis or treatment.

## Technical Architecture

<img width="2770" height="1504" alt="Gemini_Generated_Image_a5ffg2a5ffg2a5ff" src="https://github.com/user-attachments/assets/e2d39818-e881-4def-9414-e0a9efbadab2" />

## Features

- **Voice Input**: Record your symptoms directly through the browser using your microphone.
- **Image Analysis**: Upload an image of your condition for the AI to analyze.
- **Speech-to-Text**: Utilizes Groq's fast Whisper API to transcribe your voice.
- **LLM-Powered Diagnosis**: Employs Meta's Llama models to analyze the image and the transcribed symptoms to generate a differential and remedies.
- **Text-to-Speech**: Conversational AI response is read out loud using Google Text-to-Speech (gTTS).
- **Gradio Interface**: Simple and intuitive web interface.

## Project Structure

- `app.py`: Main Gradio application interface.
- `brain_of_the_doctor.py`: Handles image encoding and querying the LLM for medical analysis.
- `voice_of_the_patient.py`: Handles audio recording and speech-to-text transcription using Groq.
- `voice_of_the_doctor.py`: Handles text-to-speech conversion using gTTS (and ElevenLabs alternatively).
- `Dockerfile`: Configuration for building a Docker container for the app.
- `Pipfile` / `Pipfile.lock`: Dependency management using Pipenv.

## Prerequisites

- Python 3.9+
- Docker (optional, for containerization)
- API Keys:
  - **Groq API Key**: For speech-to-text functionality. Set it in your `.env` file.
  - Other necessary API keys for LLM inference (depending on the exact model endpoint configured in `brain_of_the_doctor.py`).

## Installation and Setup

### 1. Clone the repository

```bash
git clone <your-repository-url>
cd AI-Doctor-Voicebot
```

### 2. Environment Variables

Create a `.env` file in the root directory and add your API keys:

```
GROQ_API_KEY=your_groq_api_key_here
# Add other necessary API keys here
```

### 3. Install dependencies

Using Pipenv:

```bash
pipenv install
```

Or, if you are not using Pipenv, you can install the required packages (Gradio, groq, gTTS, etc.) manually via pip.

### 4. Run the application locally

```bash
python app.py
```

The Gradio interface will be accessible at `http://127.0.0.1:7860/` or `http://0.0.0.0:7860/`.

## Running with Docker

You can also run the application using Docker.

1. Build the Docker image:

```bash
docker build -t ai-doctor-voicebot .
```

2. Run the Docker container (make sure to pass your environment variables):

```bash
docker run -p 7860:7860 --env-file .env ai-doctor-voicebot
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is open-source and available under the MIT License.
