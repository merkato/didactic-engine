# utf-8
from flask import Flask, render_template, json, redirect, url_for, request
from peewee import *
from models import *
#from xhtml2pdf import pisa
#from StringIO import StringIO

app = Flask(__name__)
app.config.from_pyfile('config.py', silent=True)

def login_required(fn):
    @functools.wraps(fn)
    def inner(*args, **kwargs):
        if session.get('logged_in'):
            return fn(*args, **kwargs)
        return redirect(url_for('login', next=request.path))
    return inner

@app.errorhandler(404)
def not_found(error):
    return render_template('error.html'), 404

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/obiekty")
def places():
    return render_template("obiekty.html")

@app.route("/kontrola")
def kontrole():
    return render_template("kontrola.html")

@app.route("/administracja")
def administracyjne():
    return render_template("administracja.html")

@app.route("/edytuj_funkcjonariuszy", methods=["GET","POST"])
def strazacy():
    if request.method == 'POST':
        legitymacja = request.form.get('inputLeg')
        stopien = request.form.get('inputStopien')
        nazwisko = request.form.get('inputNazwisko')
        tytul = request.form.get('inputTytulZawodowy')
        stanowisko = request.form.get('inputStanowisko')
        q = funkcjonariusze.insert(legitymacja = legitymacja, stopien = stopien, tytul = tytul, nazwisko = nazwisko, stanowisko = stanowisko)
        q.execute()
        return redirect(url_for('strazacy'))
    return render_template("edytuj_funkcjonariuszy.html",funkcjonariusze=list(funkcjonariusze.select().order_by(funkcjonariusze.stopien)))

@app.route("/pokaz_protokoly")
def showShifts():
    return render_template("pokaz_protokoly.html", protokoly=list(protokoly.select().order_by(protokoly.data).desc()))

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=9998)
