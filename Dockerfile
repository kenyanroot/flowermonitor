FROM python:3.11-slim

WORKDIR /app

# Install wget and tar for downloading Prometheus
RUN apt-get update && apt-get install -y wget tar && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Download and install Prometheus
RUN wget https://github.com/prometheus/prometheus/releases/download/v2.53.4/prometheus-2.53.4.linux-amd64.tar.gz \
    && tar -xvf prometheus-2.53.4.linux-amd64.tar.gz \
    && mv prometheus-2.53.4.linux-amd64/prometheus /usr/local/bin/ \
    && mv prometheus-2.53.4.linux-amd64/promtool /usr/local/bin/ \
    && rm -rf prometheus-2.53.4.linux-amd64*

# No CMD here; set in docker-compose or as needed 