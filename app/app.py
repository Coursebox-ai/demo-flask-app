from flask import Flask

@flask_app.route("/")
def hello():
    return "Hello from Flask + Uvicorn!"

app = Flask(__name__)
