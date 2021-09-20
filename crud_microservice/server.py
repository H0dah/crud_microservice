from flask import Flask, request, jsonify, make_response
import mysql.connector
import os
from dotenv import load_dotenv

load_dotenv()

app = Flask(__name__)
db = mysql.connector.connect(host=os.getenv("db_host"),
                             user=os.getenv("db_user"),
                             passwd=os.getenv("db_passwd"),
                             db="customers")


@app.route('/customer/<int:customer_id>', methods=['GET'])
def get_customer(customer_id):
    cursor = db.cursor()
    cursor.execute(f"select name from customer where id = {customer_id}")
    customer = cursor.fetchall()[0]
    return make_response(jsonify({"customer": customer[0]}))


@app.route('/customer/add', methods=['POST'])
def add_customer():
    request_data = request.get_json()
    name = request_data['name']
    cursor = db.cursor()
    cursor.execute(f"INSERT INTO customer (name) VALUES ('{name}')")
    db.commit()
    return make_response(jsonify({}), 201)


@app.route('/customer/<int:customer_id>/update', methods=['POST'])
def update_customer(customer_id):
    request_data = request.get_json()
    name = request_data['name']
    cursor = db.cursor()
    cursor.execute(
        f"UPDATE customer SET name = '{name}' where id = {customer_id}")
    db.commit()
    return make_response(jsonify({}), 204)


@app.route('/customer/<int:customer_id>/delete', methods=["DELETE"])
def delete_customer(customer_id):
    cursor = db.cursor()
    cursor.execute(f"DELETE FROM customer where id = {customer_id}")
    db.commit()
    return make_response(jsonify({}), 204)
