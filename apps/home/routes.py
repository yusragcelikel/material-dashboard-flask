# home/routes.py

from apps.home import blueprint
from flask import redirect, render_template, request, url_for
from flask_login import login_required
from jinja2 import TemplateNotFound
from apps.home.models import Customer, CustomerLoan, CreditScore, Survey
from apps import db

@blueprint.route('/customers', methods=['GET', 'POST'])
@login_required
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
                Customer.full_name.ilike(f'%{search_query}%')
            )
        ).all()
    else:
        customers = Customer.query.all()

    # Fetch credit scores for the filtered customers
    customer_ids = [customer.customer_id for customer in customers]
    credit_scores = CreditScore.query.filter(CreditScore.customer_id.in_(customer_ids)).all()

    # Create a dictionary mapping customer_id to credit_score
    credit_scores_dict = {score.customer_id: score.credit_score for score in credit_scores}

    return render_template('customers/index.html', customers=customers, credit_score=credit_scores_dict, segment='index')


@blueprint.route('/customers/<int:customer_id>')
@login_required
def customer_profile(customer_id):
    # Query the database to find the customer and their financial information
    customer = Customer.query.get_or_404(customer_id)
    survey = Survey.query.filter_by(customer_id=customer.customer_id).first()
    customer_loan = CustomerLoan.query.filter_by(customer_id=customer.customer_id).first()
    credit_score = CreditScore.query.filter_by(customer_id=customer.customer_id).first()
    # Fetch additional attributes (m1 and m2) if they exist
    m1 = getattr(credit_score, 'm1', 'N/A') if credit_score else 'N/A'
    m2 = getattr(credit_score, 'm2', 'N/A') if credit_score else 'N/A'

    return render_template('customers/customer_profile.html', customer=customer, survey=survey, customer_loan=customer_loan, credit_score=credit_score, m1=m1, m2=m2)


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
