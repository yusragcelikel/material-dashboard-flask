# -*- encoding: utf-8 -*-
"""
Copyright (c) 2019 - present AppSeed.us
"""

from apps.home import blueprint
from flask import redirect, render_template, request, url_for
from flask_login import login_required
from jinja2 import TemplateNotFound

# Simulate customer data for display purposes
customers = [
    {"CustomerID": 1, "Name": "John", "Surname": "Doe", "KKB": 700, "M1": 50, "M2": 30},
    {"CustomerID": 2, "Name": "Jane", "Surname": "Smith", "KKB": 650, "M1": 45, "M2": 35},
    {"CustomerID": 3, "Name": "Alice", "Surname": "Brown", "KKB": 780, "M1": 60, "M2": 40},
    # Add more sample customers as needed
]

financial_information = [
    {"CustomerID": 1, "Balance": 1000, "Debt": 500, "CreditScore": 700, "Loans": 2, "Savings": 15000, "Investments": 3000},
    {"CustomerID": 2, "Balance": 1500, "Debt": 300, "CreditScore": 650, "Loans": 1, "Savings": 12000, "Investments": 2000},
    {"CustomerID": 3, "Balance": 2000, "Debt": 1000, "CreditScore": 780, "Loans": 3, "Savings": 20000, "Investments": 5000},
    # Add more financial data as needed
]

@blueprint.route('/customers/<int:customer_id>')
#@login_required
def customer_profile(customer_id):
    # Find the customer with the given ID from the customers list
    customer = next((u for u in customers if u["CustomerID"] == customer_id), None)

    financial_info = next((f for f in financial_information if f["CustomerID"] == customer_id), None)

    
    if customer:
        return render_template('customers/customer_profile.html', customer=customer, financial_info=financial_info)
    else:
        return render_template('home/page-404.html'), 404

@blueprint.route('/customers', methods=['GET', 'POST'])
# @login_required
def index():
    if request.method == 'POST':
        search_query = request.form.get('search', '').lower()
        
        # Store the search query in the URL parameters and redirect to avoid form resubmission
        return redirect(url_for('home_blueprint.index', search=search_query))
    
    # Handle the GET request and fetch search parameter from URL
    search_query = request.args.get('search', '').lower()
    
    # Filter customers based on search query (by ID, Name, or Surname)
    if search_query:
        filtered_customers = [
            customer for customer in customers 
            if search_query in str(customer['CustomerID']).lower() 
            or search_query in customer['Name'].lower() 
            or search_query in customer['Surname'].lower()
        ]
    else:
        filtered_customers = customers

    return render_template('customers/index.html', customers=filtered_customers, segment='index')

@blueprint.route('/<template>')
@login_required
def route_template(template):
    try:
        if not template.endswith('.html'):
            template += '.html'
        segment = get_segment(request)
        return render_template("home/" + template, segment=segment)
    except TemplateNotFound:
        return render_template('home/page-404.html'), 404
    except:
        return render_template('home/page-500.html'), 500

def get_segment(request):
    try:
        segment = request.path.split('/')[-1]
        if segment == '':
            segment = 'index'
        return segment
    except:
        return None
