# apps/dataset/__init__.py

from flask import Blueprint

blueprint = Blueprint(
    'dataset_blueprint',
    __name__,
    url_prefix='/dataset'  # URL prefix for all dataset-related routes
)
