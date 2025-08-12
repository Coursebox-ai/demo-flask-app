# Use official Python base image
FROM python:3.12-slim-bookworm

# Optionally copy uv binary if you need it
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Set working directory
WORKDIR /app

# Copy dependency files
COPY app/pyproject.toml app/poetry.lock ./

# Install dependencies
RUN uv pip install --system --requirement <(uv pip compile pyproject.toml)

# Copy the rest of the app
COPY app/ .

# Expose Flask port
EXPOSE 5000

# Run the app
CMD ["python", "-m", "flask", "run", "--host=0.0.0.0"]
