#syntax=docker/dockerfile:1.4

# Versions
FROM python:3.12 as python_upstream

# ---------------------------------------------------------------------------------------------
# Base
# ---------------------------------------------------------------------------------------------
FROM python_upstream as base

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    POETRY_VIRTUALENVS_CREATE=false

# Install system dependencies
RUN apt-get update \
    && apt-get install -y libxml2 libpq-dev ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Poetry
RUN pip install poetry psycopg2-binary

# ---------------------------------------------------------------------------------------------
# Dev
# ---------------------------------------------------------------------------------------------
FROM base as dev

WORKDIR /code

COPY . .

RUN poetry install

CMD ["poetry", "run", "uvicorn", "app.main:app", "--reload", "--host", "0.0.0.0", "--port", "80"]

# ---------------------------------------------------------------------------------------------
# Builder
# ---------------------------------------------------------------------------------------------
FROM base as builder

WORKDIR /tmp
  
COPY ./pyproject.toml ./poetry.lock* /tmp/
 
RUN poetry export -f requirements.txt --output requirements.txt --without-hashes

# ---------------------------------------------------------------------------------------------
# Prod
# ---------------------------------------------------------------------------------------------
FROM python_upstream as prod
 
WORKDIR /code

COPY --from=builder /tmp/requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY . .

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
