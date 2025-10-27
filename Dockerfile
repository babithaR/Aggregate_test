# Use a lightweight Python base image
FROM python:3.11-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose port 5000 from the container
EXPOSE 5000

# Run the app using Gunicorn, a production-grade web server
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
