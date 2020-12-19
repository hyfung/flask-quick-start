from flask import Blueprint

Api = Blueprint("Api", __name__)

@Api.route("/")
def api_index():
    return "API Root!"
