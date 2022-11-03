import os

from dotenv import load_dotenv
from flask import Flask, render_template, send_from_directory
from opencensus.ext.azure.trace_exporter import AzureExporter
from opencensus.ext.flask.flask_middleware import FlaskMiddleware
from opencensus.trace.samplers import ProbabilitySampler

INSTRUMENTATION_KEY = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

app = Flask(__name__)
middleware = FlaskMiddleware(
    app,
    exporter=AzureExporter(connection_string=INSTRUMENTATION_KEY),
    sampler=ProbabilitySampler(rate=1.0),
)

@app.route('/favicon.ico')
def favicon():
    return send_from_directory(os.path.join(app.root_path, 'static'),
                          'favicon.ico',mimetype='image/vnd.microsoft.icon')

@app.route("/")
def home():
    return render_template("home.html")

if __name__ == "__main__":
    app.run(debug=True)