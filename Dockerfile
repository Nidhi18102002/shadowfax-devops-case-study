# Use an official Python base image
FROM python:3.10-slim

# Set the working directory
WORKDIR /app

# Copy files
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Expose port 5000
EXPOSE 5000

# Start the app
CMD ["python", "app.py"]
