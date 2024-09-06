import sys
import os

# Set the path to the project root
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../../')))

from apps import db
from apps.home.models import Customer, FinancialInformation


# Add customers
customers = [
    {"customer_id": 1, "name": "John", "surname": "Doe", "KKB": 700, "M1": 50, "M2": 30},
    {"customer_id": 2,"name": "Jane", "surname": "Smith", "KKB": 650, "M1": 45, "M2": 35},
    {"customer_id": 3,"name": "Alice", "Surname": "Brown", "KKB": 780, "M1": 60, "M2": 40},
]

for customer_data in customers:
    customer = Customer(**customer_data)
    db.session.add(customer)
db.session.commit()

# Add financial information
financial_data = [
    {"customer_id": 1, "balance": 1000, "debt": 500, "credit_score": 700, "loans": 2, "savings": 15000, "investments": 3000},
    {"customer_id": 2, "balance": 1500, "debt": 300, "credit_score": 650, "loans": 1, "savings": 12000, "investments": 2000},
    {"customer_id": 3, "balance": 2000, "debt": 1000, "credit_score": 780, "loans": 3, "savings": 20000, "investments": 5000},
]

for financial_info_data in financial_data:
    financial_info = FinancialInformation(**financial_info_data)
    db.session.add(financial_info)
db.session.commit()
