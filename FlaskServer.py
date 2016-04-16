import sqlite3, os, sys
from contextlib import closing
from flask import *
from werkzeug import secure_filename
from log import GetLogger
from os.path import join
import requests
app = Flask(__name__)
app.config.from_object('FLASK_CONFIG')
logging = GetLogger(app.config['CONSOLE_FORMATS'], app.config['FILE_FORMATS'])


def init_db():
    with closing(connect_db()) as db:
        with app.open_resource('schema.sql', mode='r') as f:
            db.cursor().executescript(f.read())  
        db.commit()

def connect_db():
    return sqlite3.connect(app.config['DATABASE'])

@app.before_request
def before_request():
    g.db = connect_db()

@app.teardown_request
def teardown_request(exception):
    db = getattr(g, 'db', None)
    if db is not None:
        db.close()

#!---Routes---!#

#@app.route('/favicon.ico')
#def favicon():
#  return send_from_directory(os.path.join(app.root_path, 'static'), 'favicon.ico', mimetype='image/vnd.microsoft.icon')

@app.route('/')
def seanbin():
    return "hello world", 200
@app.route('/hello')
def hello():
    return "Hello, %s"%request.args['name'], 200

@app.route('/data',methods=['GET'])
def data():

    if request.args["action"]=="getTeachers":
	cur = g.db.execute("select * from teachers")
	response = []
#        print cur.fetchall()
	for row in cur.fetchall():
            cur_col = []
	    row = row[1:]
	    for col in row:
		if type(col) is int or type(col) is float or col is None:
		    cur_col.append(str(col))
		else:
		    cur_col.append(col)
	    response.append("---".join(cur_col))
        response = "+++".join(response)
	#print response
	return response,200
    elif request.args['action']=="getTeacher":
	cur = g.db.execute("select * from teachers where id=?",[request.args['id']])
        col = cur.fetchone()
        col = col[1:]
	parsed_col = []
	for val in col:
	    if type(val) is int or type(val) is float or val is None:
		parsed_col.append(str(val))
	    else:
		parsed_col.append(val)
        response = "---".join(parsed_col)
	return response, 200
    elif request.args['action']=="getStudents":
	cur = g.db.execute("select * from students")
        response = []
        for row in cur.fetchall():
            cur_col = []
            row = row[1:]
            for col in row:
                if type(col) is int or type(col) is float or col is None:
                    cur_col.append(str(col))
                else:
                    cur_col.append(col)
            response.append("---".join(cur_col))
        return "+++".join(response),200
    elif request.args['action']=="getStudent":
	cur = g.db.execute("select * from students where id=?",[request.args['id']])
        col = cur.fetchone()
        col = col[1:]
        parsed_col = []
        for val in col:
            if type(val) is int or type(val) is float or val is None:
                parsed_col.append(str(val))
            else:
                parsed_col.append(val)
        response = "---".join(parsed_col)
        return response, 200

    return "Invalid Action",404

@app.route('/assets/images/<img>')
def images(img):
    return send_from_directory(join(app.root_path,"assets/images/"),secure_filename(img))
if __name__ == '__main__':
    app.run(host = '0.0.0.0', port = 80)
