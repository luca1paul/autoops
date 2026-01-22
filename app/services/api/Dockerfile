# app/services/api/Dockerfile
# Dockerfile for AutoOps API Service
# This Dockerfile sets up a Python environment with Flask and Prometheus
# to run the AutoOps API service.

# Base image
FROM python:3.11-slim

# Working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app
COPY . .

# Expose the Flask port
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]
