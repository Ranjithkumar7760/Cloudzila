# Use official Python image as base
FROM python:3.10

# Set environment variables
ENV PYTHONUNBUFFERED 1

# Set the working directory inside the container
WORKDIR /app

# Copy the application code to the container
COPY . /app

# Install dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Expose port 8000 for the Gunicorn server
EXPOSE 8000

# Start Gunicorn server
CMD ["gunicorn", "--workers=3", "--bind=0.0.0.0:8000", "Wmart.wsgi:application"]
