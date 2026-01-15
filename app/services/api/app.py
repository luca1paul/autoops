from flask import Flask, jsonify, Response # type: ignore
from prometheus_client import Counter, generate_latest, CONTENT_TYPE_LATEST # type: ignore
import os

app = Flask(__name__)

# --- Prometheus Metrics Setup ---
REQUEST_COUNT = Counter(
    "autoops_request_count", 
    "Total number of requests", 
    ["method", "endpoint"]
)

@app.before_request
def before_request():
    """Count each incoming request by method and endpoint."""
    from flask import request # type: ignore
    REQUEST_COUNT.labels(method=request.method, endpoint=request.path).inc()

# --- API Routes ---
@app.route("/")
def home():
    """Default route for the root path."""
    return jsonify({
        "message": "Welcome to AutoOps API",
        "status": "running",
        "service": "AutoOps API",
        "environment": os.getenv("ENV", "development")
    })

@app.route("/status")
def status():
    """Health endpoint to verify the service is running."""
    return jsonify({
        "status": "ok",
        "service": "AutoOps API",
        "environment": os.getenv("ENV", "development")
    })

@app.route("/metrics")
def metrics():
    """Expose Prometheus metrics."""
    return Response(generate_latest(), mimetype=CONTENT_TYPE_LATEST)

# --- Entry Point ---
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

