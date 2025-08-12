FROM python:3.13-slim

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

# Run the Flask app
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app.app:app"]
