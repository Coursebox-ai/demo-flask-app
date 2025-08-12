FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# Copy and install dependencies using pyproject.toml
COPY app/pyproject.toml .
RUN pip install --upgrade pip && pip install .

# Copy the rest of the app
COPY . .

# Run the Flask app with Uvicorn
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "5000"]
