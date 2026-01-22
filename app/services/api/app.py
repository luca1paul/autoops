# app/services/api/app.py
# AutoOps API Service
# This module sets up a Flask API service with Prometheus metrics integration.
# It includes routes for health checks and metrics exposure.

from flask import Flask, jsonify, Response, request # type: ignore
from prometheus_client import Counter, generate_latest, CONTENT_TYPE_LATEST # type: ignore

app = Flask(__name__)

# --- Prometheus Metrics Setup ---
HTTP_REQUESTS_TOTAL = Counter(
    "autoops_http_requests_total",
    "Total number of HTTP requests by status",
    ["method", "endpoint", "status"]
)

# Existing metric
REQUEST_COUNT = Counter(
    "autoops_request_count", 
    "Total number of requests", 
    ["method", "endpoint"]
)

@app.before_request
def before_request():
    """Count each incoming request by method and endpoint."""
    REQUEST_COUNT.labels(method=request.method, endpoint=request.path).inc()

@app.after_request
def after_request(response):
    HTTP_REQUESTS_TOTAL.labels(
        method=request.method,
        endpoint=request.path,
        status=str(response.status_code)
    ).inc()
    return response

# --- API Routes ---

@app.route("/")
def home():
    return jsonify({"message": "Welcome to AutoOps API", "status": "running"})

@app.route("/status")
def status():
    return jsonify({"status": "ok"})

@app.route("/fail")
def fail():
    """
    Fail point 500.
    """
    return "Internal Server Error", 500

@app.route("/metrics")
def metrics():
    """Expose Prometheus metrics."""
    return Response(generate_latest(), mimetype=CONTENT_TYPE_LATEST)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
    