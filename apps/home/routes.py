#customers = [
#    {"CustomerID": 1, "Name": "John", "Surname": "Doe", "KKB": 700, "M1": 50, "M2": 30},
#    {"CustomerID": 2, "Name": "Jane", "Surname": "Smith", "KKB": 650, "M1": 45, "M2": 35},
#    {"CustomerID": 3, "Name": "Alice", "Surname": "Brown", "KKB": 780, "M1": 60, "M2": 40},
#]

#financial_information = [
#    {"CustomerID": 1, "Balance": 1000, "Debt": 500, "CreditScore": 700, "Loans": 2, "Savings": 15000, "Investments": 3000},
#    {"CustomerID": 2, "Balance": 1500, "Debt": 300, "CreditScore": 650, "Loans": 1, "Savings": 12000, "Investments": 2000},
#    {"CustomerID": 3, "Balance": 2000, "Debt": 1000, "CreditScore": 780, "Loans": 3, "Savings": 20000, "Investments": 5000},
#]

# home/routes.py

from apps.home import blueprint
from flask import redirect, render_template, request, url_for, jsonify
from flask_login import login_required
from jinja2 import TemplateNotFound
from apps.home.models import Customer, FinancialInformation
from apps import db

@blueprint.route('/customers', methods=['GET', 'POST'])
# @login_required
def index():
    if request.method == 'POST':
        search_query = request.form.get('search', '').lower()
        return redirect(url_for('home_blueprint.index', search=search_query))

    search_query = request.args.get('search', '').lower()

    # Filter customers based on the search query
    if search_query:
        customers = Customer.query.filter(
            db.or_(
                Customer.customer_id.ilike(f'%{search_query}%'),
                Customer.name.ilike(f'%{search_query}%'),
                Customer.surname.ilike(f'%{search_query}%')
            )
        ).all()
    else:
        customers = Customer.query.all()

    return render_template('customers/index.html', customers=customers, segment='index')

@blueprint.route('/customers/<int:customer_id>')
#@login_required
def customer_profile(customer_id):
    # Query the database to find the customer and their financial information
    customer = Customer.query.get_or_404(customer_id)
    financial_info = FinancialInformation.query.filter_by(customer_id=customer.customer_id).first()

    return render_template('customers/customer_profile.html', customer=customer, financial_info=financial_info)

@blueprint.route('/api/customer_scores', methods=['GET'])
def api_customer_scores():
    # Tüm müşterileri sorgulama
    customers = Customer.query.all()
    
    # Müşteri skorlarını ve etiketlerini saklamak için listeler
    labels = []
    scores = []

    # Her müşteri için verileri listeye ekleyin
    for customer in customers:
        labels.append(f"{customer.name} {customer.surname}")
        scores.append(customer.kkb)  # KKB skorlarını kullanıyoruz

    # JSON formatında veri döndürme
    return jsonify({
        'labels': labels,
        'scores': scores
    })

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
