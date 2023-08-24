from flask import Flask,render_template,request,redirect
from flask_sqlalchemy import SQLAlchemy
import aadhar

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:@localhost/test'
app.secret_key = 'b_5#y2L"F4Q8z\\;n\\xec/'

db = SQLAlchemy(app)

class Anrlog(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    AadharNum = db.Column(db.Integer, nullable=False)
    PassWord = db.Column(db.String(11), nullable=False)
    FirstName = db.Column(db.String(200), nullable=False)
    LastName = db.Column(db.String(200), nullable=False)
    MotherName = db.Column(db.String(200), nullable=False)
    FatherName = db.Column(db.String(200), nullable=False)
    Address = db.Column(db.String(200), nullable=True)
    Gender = db.Column(db.String(200), nullable=True)
    dob = db.Column(db.String(20), nullable=True)
    Course = db.Column(db.String(200), nullable=True)
    email = db.Column(db.String(200), nullable=True)

@app.route("/", methods=['GET', 'POST'])
def home():
    return render_template('index.html')

@app.route('/log',methods=['GET',"POST"])
def log():
    er1 = None
    if(request.method=='POST'):
        er1 = None
        ad = request.form.get('adnumber')
        ps = request.form.get('password')
        DbDet = Anrlog.query.filter_by(AadharNum=ad).first()
        if(DbDet!=None):
            DbDet.AadharNum = str(DbDet.AadharNum)
            if(DbDet.AadharNum==ad and DbDet.PassWord==ps):
                return "<h1>login succesfull<h1>"
            else:
                er1 = "Invalid Credential! Please Re-Enter.."
    return render_template('log.html', error = er1)

@app.route('/reg1', methods=['GET','POST'])
def reg1():
    er =None
    return render_template('Aadhar.html', error = er)

@app.route('/reg2', methods=['GET','POST'])
def reg2():
    er = None
    global AadharN
    if(request.method=="POST"):
        AadharN = request.form.get('AdNumber')
        Ad = Anrlog.query.filter_by(AadharNum=AadharN).first()
        AadharN = int(AadharN)
        if(aadhar.validate(AadharN)):
            if(Ad==None):
                return render_template('reg.html')
            else:
                er = "Aadhar Number is already used!"
                return render_template('Aadhar.html', error=er)
        else:
            er = "Invalid Aadhar Number !"
            return render_template('Aadhar.html',error=er)
    return redirect('/reg1')

@app.route('/register', methods=['POST', 'GET'])
def register():
    if(request.method == 'POST'):
        password = request.form.get('password')
        FName = request.form.get('FName')
        LName = request.form.get('LName')
        MName = request.form.get('MName')
        FatherName = request.form.get('FatherName')
        email = request.form.get('email')
        Add = request.form.get('Address')
        dob = request.form.get('dob')
        course = request.form.get('course')
        gender = request.form.get('Gender')
        print(AadharN)
        entry = Anrlog(AadharNum = AadharN,PassWord=password, FirstName=FName, LastName=LName, MotherName=MName ,FatherName=FatherName, Address=Add,
                       Gender=gender, dob=dob,Course=course, email=email)
        db.session.add(entry)
        db.session.commit()
        return redirect('/log')
    return render_template('reg.html')

if __name__ == '__main__':
    app.run(debug=True)