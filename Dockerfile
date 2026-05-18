# Use official lightweight base image
FROM python:3.11

# Set working directory
WORKDIR /app

# Install required dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libportaudio2 \
    portaudio19-dev \
    gcc \
    libc-dev \
    make \
    && rm -rf /var/lib/apt/lists/*

# Copy Pipfile and install dependencies first to leverage Docker cache
COPY Pipfile Pipfile.lock /app/
RUN pip install --no-cache-dir pipenv && \
    pipenv install --system --deploy

# Copy the rest of the application code
COPY . /app/

# Expose required ports
EXPOSE 7860

# Start the code inside the docker container
CMD ["python", "app.py"]
