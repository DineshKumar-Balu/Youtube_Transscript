# Use the official Python slim image as the base image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the contents of your project directory into the container
COPY . /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    curl

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install torch==2.0.0 torchvision==0.15.1 torchaudio==2.0.0
RUN pip install streamlit youtube_transcript_api transformers==4.28.1 tensorflow==2.11.0 tf-keras

# Expose the port that your Streamlit app will run on
EXPOSE 8501

# Run your Streamlit app when the container starts
CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
