# About The Project

A Python microservice that should connect to MySQL DB and have the following endpoints:
    a- an endpoint to add new customer.
    b- an endpoint to update customer
    c- an endpoint to delete customer
    e- an endpoint to get customer. 



## Built With

- [Flask](https://flask.palletsprojects.com/en/1.1.x/)

# Getting Started

## Prerequisites
You should have Python 3 installed on your machine


## Installation
1. Clone the repo

        git clone https://github.com/H0dah/crud_microservice
        cd crud_microservice/crud_microservice
2. Install requirements 

        pip install -r requirements.txt
3. Set environment variable

        export FLASK_APP=server
4. Run the file

        flask run
5. Go to URL

        http://127.0.0.1:5000/customer/1 --> to get customer with id 1
        http://127.0.0.1:5000/customer/add --> to add new customer
        http://127.0.0.1:5000/customer/1/update --> to update customer with id 1
        http://127.0.0.1:5000/customer/1/delete --> to delete customer with id 1
