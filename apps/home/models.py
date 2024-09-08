# home/models.py

from apps import db

class Customer(db.Model):
    __tablename__ = 'customers'
    
    customer_id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(64), nullable=False)
    surname = db.Column(db.String(64), nullable=False)
    kkb = db.Column(db.Integer, nullable=False)
    m1 = db.Column(db.Integer, nullable=False)
    m2 = db.Column(db.Integer, nullable=False)

    def __repr__(self):
        return f'<Customer {self.name} {self.surname}>'


class FinancialInformation(db.Model):
    __tablename__ = 'financial_information'

    customer_id = db.Column(db.Integer, db.ForeignKey('customers.customer_id'), primary_key=True)
    balance = db.Column(db.Float, nullable=False)
    debt = db.Column(db.Float, nullable=False)
    credit_score = db.Column(db.Integer, nullable=False)
    loans = db.Column(db.Integer, nullable=False)
    savings = db.Column(db.Float, nullable=False)
    investments = db.Column(db.Float, nullable=False)

    customer = db.relationship('Customer', backref=db.backref('financial_info', lazy=True))

    def __repr__(self):
        return f'<FinancialInformation for Customer {self.customer_id}>'
