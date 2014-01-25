import subprocess
from flask import render_template
from fortunecowsay import app


def generate_html(values):
    return "".join([i.decode("utf-8") for i in values])


def cowsay():
    values = []
    procedure = subprocess.Popen(
        "fortune | cowsay", shell=True, stdout=subprocess.PIPE)
    while procedure.poll() is None:
        output = procedure.stdout.readline()
        values.append(output)
    return generate_html(values)


@app.route('/')
def index():
    return render_template("home.html", cowsay=cowsay())
