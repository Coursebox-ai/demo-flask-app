# Use official Python base image
FROM python:3.11-slim

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1

# Install curl and Rust (for uv), then install uv
RUN apt-get update && \
    apt-get install -y curl gcc libffi-dev libssl-dev rustc && \
    curl -LsSf https://astral.sh/uv/install.sh | sh && \
    ln -s /root/.cargo/bin/uv /usr/local/bin/uv && \
    apt-get remove -y gcc rustc && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*



# Set working directory
WORKDIR /app

# Copy dependency files
COPY app/pyproject.toml .

# Install dependencies
RUN uv pip install -r <(uv pip compile pyproject.toml)

# Copy the rest of the app
COPY app/ .

# Expose Flask port
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]
