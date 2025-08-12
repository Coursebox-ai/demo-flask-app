# Stage 1: Base Python with uv installed
FROM python:3.12-slim-bookworm AS base
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app

# Copy pyproject.toml and optionally uv.lock first to leverage Docker caching
COPY app/pyproject.toml .
COPY app/uv.lock .  # optional if you have a lock file

# Install dependencies into system Python
RUN uv sync --frozen --system

# Copy application code
COPY app/ .

# Expose Flask port
EXPOSE 5000

# Run Flask
CMD ["python", "-m", "flask", "run", "--host=0.0.0.0"]
