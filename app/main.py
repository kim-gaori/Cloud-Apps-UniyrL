from flask import Flask, render_template, jsonify
import socket
import os

app = Flask(__name__)

SERVICE_NAME = os.getenv("SERVICE_NAME", "service-a")
APP_VERSION  = os.getenv("APP_VERSION",  "5.1.113")

@app.route("/")
def index():
    return render_template(
        "index.html",
        version=APP_VERSION,
        hostname=socket.gethostname(),
        service=SERVICE_NAME,
    )

@app.route("/health")
def health():
    return jsonify({"status": "healthy", "service": SERVICE_NAME, "version": APP_VERSION})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=False)
