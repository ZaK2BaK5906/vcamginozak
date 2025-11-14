from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
    return """
    <!DOCTYPE html>
    <html>
    <head>
        <title>Test Flask</title>
    </head>
    <body>
        <h1>✅ Flask fonctionne correctement!</h1>
        <p>Si vous voyez ce message, le serveur Flask marche bien.</p>
        <p>Le problème vient probablement du firewall ou du navigateur.</p>
    </body>
    </html>
    """

if __name__ == '__main__':
    print("=" * 60)
    print("Test Flask - Serveur Simple")
    print("=" * 60)
    print("Accédez à: http://localhost:5000")
    print("Ou: http://127.0.0.1:5000")
    print("=" * 60)
    app.run(host='0.0.0.0', port=5000, debug=True)
