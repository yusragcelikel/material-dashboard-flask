# apps/dataset/routes.py

from flask import render_template, request, redirect, url_for
from flask_login import login_required
from apps.dataset import blueprint
from apps.dataset.models import Dataset

@blueprint.route('/')
#@login_required
def index():
    datasets = Dataset.get_all()
    return render_template('dataset/index.html', datasets=datasets, segment='dataset.html')

@blueprint.route('/create', methods=['GET', 'POST'])
#@login_required
def create():
    if request.method == 'POST':
        number_of_data = request.form['number_of_data']
        algorithm = request.form['algorithm']
        accuracy = request.form['accuracy']
        f1_score = request.form['f1_score']
        Dataset.add(number_of_data, algorithm, float(accuracy), float(f1_score))
        return redirect(url_for('dataset_blueprint.index'))

    datasets = Dataset.get_all()
    return render_template('dataset/create.html', datasets=datasets,)

@blueprint.route('/update/<int:id>', methods=['GET', 'POST'])
#@login_required
def update(id):
    dataset = Dataset.get_by_id(id)
    if not dataset:
        return redirect(url_for('dataset_blueprint.index'))

    if request.method == 'POST':
        number_of_data = request.form['number_of_data']
        algorithm = request.form['algorithm']
        accuracy = request.form['accuracy']
        f1_score = request.form['f1_score']
        Dataset.update(id, number_of_data, algorithm, float(accuracy), float(f1_score))
        return redirect(url_for('dataset_blueprint.index'))

    datasets = Dataset.get_all()
    return render_template('dataset/update.html', dataset=dataset, datasets=datasets)

@blueprint.route('/delete/<int:id>', methods=['POST'])
#@login_required
def delete(id):
    Dataset.delete(id)
    return redirect(url_for('dataset_blueprint.index'))
