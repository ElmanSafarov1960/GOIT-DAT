from flask import Flask

app = Flask(__name__)


@app.route('/')
def hello():
    return "<h1 style='color:crimson'>Hello World!!!</h1>"


if __name__ == '__main__':
    app.run(debug=False, host='0.0.0.0')