FROM python:3.11-slim
# FROM nvidia/cuda:12.4.0-base-ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    python3-launchpadlib \
    software-properties-common \
    wget && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y \
    python3.11 \
    python3.11-venv \
    python3.11-dev \
    python3.11-distutils && \
    # libglib2.0-0
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install pip for Python 3.11 explicitly
RUN wget https://bootstrap.pypa.io/get-pip.py \
    && python3.11 get-pip.py \
    && rm get-pip.py

# Set the working directory in the container
WORKDIR /app

# Configure Poetry to not create a virtual environment
ENV POETRY_VIRTUALENVS_CREATE=false

RUN python3.11 -m pip install poetry
COPY pyproject.toml poetry.lock /app/
RUN poetry install --no-interaction --no-ansi --no-cache

RUN python3.11 -c "from transformers import pipeline; _ = pipeline('sentiment-analysis')"

COPY main.py /app

EXPOSE 80

ENV PORT=80

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]