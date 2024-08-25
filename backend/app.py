from flask import *
from flask_sqlalchemy import *
from werkzeug.security import generate_password_hash , check_password_hash
import jwt
from hashlib import *
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
    username= db.Column(db.String(250),nullable=False,index=True)
    password= db.Column(db.String(250),nullable=False)
    def __init__(self,username,password):
        self.username=username
        self.password=password

class answers(db.Model):
    __tablename__ = 'answers'
    choice = db.Column(db.Integer,primary_key=True)
    submission_id= db.Column(db.Integer,nullable=False)
    questionNumber= db.Column(db.Integer,nullable=False)
    def __init__(self,choice,submission_id,questionNumber):
        self.submissionId=submission_id
        self.questionNumber=questionNumber
        self.choice=choice


class submission(db.Model):
    __tablename__ = 'submission'
    quiz_id= db.Column(db.Integer,nullable=False)
    userId= db.Column(db.Integer,nullable=False)
    submissionId = db.Column(db.Integer,nullable=False)
    def __init__(self,userId,quiz_id,submissionId):
        self.quiz_id=quiz_id
        self.userId=userId
        self.submissionId=submissionId



class Questions(db.Model):
    __tablename__ = 'questions'
    quiz_id = db.Column(db.Integer,primary_key=True)
    question_id = db.Column(db.Integer,nullable=False)
    teacher_id = db.Column(db.Integer,nullable=False)
    quiz_name= db.Column(db.String(250),nullable=False)
    question_name= db.Column(db.String(250),nullable=False)
    answer= db.Column(db.Integer,nullable=False)
    choice1= db.Column(db.String(250),nullable=False)
    choice2= db.Column(db.String(250),nullable=False)
    choice3= db.Column(db.String(250),nullable=False)
    choice4= db.Column(db.String(250),nullable=False)
    def __init__(self,quiz_id,teacher_id,quiz_name,question_name,answer,choice1,choice2,choice3,choice4):
        self.quiz_id=quiz_id
        self.teacher_id=teacher_id
        self.quiz_name=quiz_name
        self.question_name=question_name
        self.answer=answer
        self.choice1=choice1
        self.choice2=choice2
        self.choice3=choice3
        self.choice4=choice4



with app.app_context():
    db.create_all()

@app.route("/auth/signup",methods=["POST"])
def signup():
    if request.content_type == "application/json":
        try:
            username = request.json["username"]
            password = request.json["password"]
        except:
            return jsonify({"msg":"Missing required fields"}),400
        user_is_exist = Users.query.filter_by(username=username).first()
        if user_is_exist:
            return jsonify({"msg":"The username is already taken "}),409
        else:
            db.session.add(Users(username=username,password=generate_password_hash(password,method="pbkdf2")))
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
    

@app.route("/quiz",methods=["PUT"])
def create_quiz():
    #try:
    teacher_namee = jwt.decode(request.json["token"] , app.config["SECRET_KEY"],algorithms=['HS256'])['username']
    # quiz_id = statistic.query.filter_by(teacher_name=teacher_namee).first().quizes_created
    teacher_id = Users.query.filter_by(username=teacher_namee).first().id
    quiz_name = request.json["name"]
    questions = request.json["questions"]
    for question in questions:
        question_to_db = question['question']
        answer = question["answer"]
        choice1 = question["choices"][0]
        choice2 = question["choices"][1]
        choice3 = question["choices"][2]
        choice4 = question["choices"][3]

        query = Questions(quiz_id=quiz_id,teacher_id=teacher_id,quiz_name=quiz_name,question_name=question_to_db,answer=answer,choice1=choice1,choice2=choice2,choice3=choice3,choice4=choice4)
        db.session.add(query)
        db.session.commit()
    # d = statistic.query.filter_by(teacher_name=teacher_namee).first()
    # d.quizes_created=quiz_id+1
    db.session.commit()
    # except:
    #     return jsonify({"msg":"Missing required fields"}),400









if __name__=="__main__":
    app.run(host="0.0.0.0",debug=True,port=80)