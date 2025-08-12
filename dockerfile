FROM python:3.12-slim-bookworm

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app

# Copy project files
COPY app/pyproject.toml .

# Install deps into the current environment
RUN uv pip install --python /usr/local/bin/python . 

# Copy app code
COPY app/ .

EXPOSE 5000

CMD ["python", "-m", "flask", "run", "--host=0.0.0.0"]
