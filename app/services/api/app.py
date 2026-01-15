from flask import Flask, jsonify
import os

app = Flask(__name__)

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

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
