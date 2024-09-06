# -*- encoding: utf-8 -*-
"""
Copyright (c) 2019 - present AppSeed.us
"""

from flask import Flask
from flask_login import LoginManager
from flask_sqlalchemy import SQLAlchemy
from importlib import import_module
import os
import pymysql

pymysql.install_as_MySQLdb()

db = SQLAlchemy()
login_manager = LoginManager()


def register_extensions(app):
    db.init_app(app)
    login_manager.init_app(app)


def register_blueprints(app):
    for module_name in ('authentication', 'home'):
        module = import_module('apps.{}.routes'.format(module_name))
        app.register_blueprint(module.blueprint)


def initialize_database(app):
    try:
        db.create_all()
        print("DB Created!")
    except Exception as e:
        print('> Error: DBMS Exception: ' + str(e))
        
        # fallback to SQLite
        basedir = os.path.abspath(os.path.dirname(__file__))
        db_uri = 'sqlite:///' + os.path.join(basedir, 'db.sqlite3')
        app.config['SQLALCHEMY_DATABASE_URI'] = db_uri
        print('> Fallback to SQLite')
        db.create_all()


def configure_database(app):
    @app.teardown_request
    def shutdown_session(exception=None):
        db.session.remove()


def create_app(config):
    app = Flask(__name__)
    app.config.from_object(config)
    register_extensions(app)
    register_blueprints(app)
    configure_database(app)

    with app.app_context():
        initialize_database(app)

    return app
