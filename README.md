Celery Flower monitoring and administration tool

## Usage:
 - Create an application from this repo
 - Add environment variable BROKER_URL pointing to RabbitMQ or Redis instance
 - Add environment variable RESULT_BACKEND pointing to Redis instance
 - Add environment variable FLOWER_BASIC_AUTH in format USERNAME:PASSWORD. This will be used to authenticate Celery Flower web interface

## Monitoring with Prometheus and Grafana

This project now supports monitoring with Prometheus and Grafana via Docker Compose.

### Quick Start

1. Copy your environment variables to a `.env` file or set them in your shell.
2. Run:

    docker-compose up --build

3. Access the services:
   - Flower: http://localhost:5555
   - Prometheus: http://localhost:9090
   - Grafana: http://localhost:3000 (default login: admin / admin)

### Prometheus Metrics
- Prometheus scrapes metrics from Flower at `/metrics` (ensure Flower exposes Prometheus metrics; see exporter note below).

### Exporter Note
- If Flower does not natively expose Prometheus metrics, you may need to add a Prometheus exporter or use a sidecar exporter.

