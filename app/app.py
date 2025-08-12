from flask import Flask
from asgi_lifespan import LifespanManager
from asgiref.wsgi import WsgiToAsgi


@flask_app.route("/")
def hello():
    return "Hello from Flask + Uvicorn!"

app = Flask(__name__)
