from flask import Flask, flash, redirect, render_template, request, url_for,jsonify
from flask import request
# import uuid
import json
import subprocess ,time
import logging
import urllib.request
import requests
import io

app = Flask(__name__)

@app.route('/predict',methods=['POST'])
def predict():
    data = request.get_json(force=True)
    image_url  = data['image_url']
    r = requests.get(image_url)
    file=io.BytesIO(r.content)
    with open("./1234.jpg", "wb") as code:
         code.write(file.getvalue())
    return "Done"

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)

