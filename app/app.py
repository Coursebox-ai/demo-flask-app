from flask import Flask
from asgi_lifespan import LifespanManager
from asgiref.wsgi import WsgiToAsgi

flask_app = Flask(__name__)

@flask_app.route("/")
def hello():
    return "Hello from Flask + Uvicorn!"

# ASGI adapter
app = WsgiToAsgi(flask_app)
