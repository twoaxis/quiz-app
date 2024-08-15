from flask import *
from flask_sqlalchemy import *
from werkzeug.security import generate_password_hash , check_password_hash
import jwt
import datetime
from functools import wraps
app = Flask(__name__)

app.config["SECRET_KEY"]='##Tw0@x1s_1s_Th3_B3sT##'
app.config['SQLALCHEMY_DATABASE_URI']='mysql+pymysql://root@localhost/quiz_app'
app.config['SQLACHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

class Users(db.Model):
    __tablename__ = 'users'
    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    username= db.Column(db.String(250),nullable=False)
    password= db.Column(db.String(250),nullable=False)
    def __init__(self,username,password):
        self.username=username
        self.password=password


@app.route("/auth/signup",methods=["POST"])
def signup():
    if request.content_type == "application/json":
        try:
            username = request.json.get("username")
            password = request.json.get("password")
        except Exception as f:
            return jsonify({"msg":f}),400
        user_is_exist = Users.query.filter_by(username=username).first()
        if user_is_exist:
            return jsonify({"msg":"The username is already taken "}),409
        else:
            db.session.add(Users(username=username,password=generate_password_hash(password,method="sha256")))
            db.session.commit()

            token = jwt.encode({"username":username,"exp": (datetime.datetime.utcnow() + datetime.timedelta(minutes=30))},app.config["SECRET_KEY"]) # current time + 30 minute
            return jsonify({"token":token})
    else:
        return jsonify({"msg":"Content-type should be json"}),500


@app.route("/auth/login",methods=["POST"])
def login():
    if request.content_type == "application/json":
        try:
            username = request.json["username"]
            password = request.json["password"]
        except:
            return jsonify({"msg":"Missing required fields"}),400
        user_is_exist = Users.query.filter_by(username=username).first()
        if user_is_exist and (check_password_hash(user_is_exist.password,password)):
            token = jwt.encode({"username":username,"exp": (datetime.datetime.utcnow() + datetime.timedelta(minutes=30))},app.config["SECRET_KEY"]) # current time + 30 minute
            return jsonify({"token":token}),200
        else:
            return jsonify({"msg":"invalid username or password"}),401
    else:
        return jsonify({"msg":"Content-type should be json"}),500
if __name__=="__main__":
    app.run(host="0.0.0.0",debug=True,port=80)