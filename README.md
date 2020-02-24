<h1 align="center">
  VisibleBank
</h1>

<p align="center">
  <a href="#requirements">Requirements</a> •
  <a href="#how-to-use">How To Use</a> 
</p>

---

## Requirements

- `Rails 5.2.3`
- `SQLite3`

---

## How To Use

### Prerequisites

```bash
  bundle install                      # to install the used ruby gems
  rails db:create                     # to create the developemtn database if not found
  rails db:migrate                    # to apply any pending migration
  rails db:seed                       # to create the seed data
```

### Run VisibleBank

```bash
  rails s                             # the application will be in localhost:3000
```

this command will start

1- `rails` server for back-end development

---

<h1 align="center">
  End-points
</h1>

## Customer

---

### **Create Customer**

Returns json data about the created customer.

- **URL**

  /customers

- **Method:**

  `POST`

- **URL Params**

  **Required:**

None

- **Data Params**

`{ "customer": { "name": String, "address": String, "email": String, "phone": String, "status": String } }`

- **Success Response:**

  - **Code:** 200 <br />
    **Content:**
    `{ "success": true, "data": { "customer": { "id": 1, "name": "Mosab Muhammad", "address": "Address1", "email": "mosab@example.com", "phone": "875421465", "status": "active" } } }`

- **Error Response:**

  - **Code:** 422 Unprocessable Entity <br />
    **Content:** `{ "success": false, "errors": { "code": 422, "message": { "email": [ "has already been taken" ] } } }`

---

### **Update Customer**

Returns json data about the updated customer.

- **URL**

  /customers/:id

- **Method:**

  `PATCH`

- **URL Params**

  **Required:**

  `id=[integer]`

- **Data Params**

`{ "customer": { "name": String, "address": String, "email": String, "phone": String, "status": String } }`

- **Success Response:**

  - **Code:** 200 <br />
    **Content:**
    `{ "success": true, "data": { "customer": { "id": 1, "name": "Mosab Muhammad", "address": "Address1", "email": "mosab@example.com", "phone": "875421465", "status": "active" } } }`

- **Error Response:**

  - **Code:** 422 Unprocessable Entity <br />
    **Content:** `{ "success": false, "errors": { "code": 422, "message": { "email": [ "has already been taken" ] } } }`

---


### **Get Customer**

Returns json data about the the requested customer.

- **URL**

  /customers/:id

- **Method:**

  `GET`

- **URL Params**

  **Required:**

  `id=[integer]`

- **Data Params**

  None

- **Success Response:**

  - **Code:** 200 <br />
    **Content:**
    `{ "success": true, "data": { "customer": { "id": 1, "name": "Mosab Muhammad", "address": "Address1", "email": "mosab@example.com", "phone": "875421465", "status": "active" } } }`

- **Error Response:**

  - **Code:** 500 Internal Server Error <br />
    **Content:** `{ "success": false, "errors": { "code": 500, "message": "Couldn't find Customer with 'id'=5" } }`

---


### **Get Customers**

Returns json data about the the requested customers.

- **URL**

  /customers

- **Method:**

  `GET`

- **URL Params**

  **Optional:**

  `page=[integer]`
  `per_page=[integer]`

- **Data Params**

  None

- **Success Response:**

  - **Code:** 200 <br />
    **Content:**
    `{ "success": true, "data": { "customer": [ { "id": 1, "name": "Mosab Muhammad", "address": "Address1", "email": "mosab@example.com", "phone": "87542146545", "status": "active" }, { "id": 2, "name": "Muhammad Mosab", "address": "Address111", "email": "mosab1@example.com", "phone": "87542146755", "status": "active" } ] } }`

- **Error Response:**

---


### **Get Customer Accounts**

Returns json data about the the requested customer accounts.

- **URL**

  /customers/:id/accounts

- **Method:**

  `GET`

- **URL Params**

  **Required:**

  `id=[integer]`

- **Data Params**

  None

- **Success Response:**

  - **Code:** 200 <br />
    **Content:**
    `{ "success": true, "data": { "accounts": [ { "id": 1, "customer_id": 1, "currency_id": 1, "account_type": "basic", "balance": "90.0", "number": "10005584512879", "status": "active" } ] } }`

- **Error Response:**

  - **Code:** 500 Internal Server Error <br />
    **Content:** `{ "success": false, "errors": { "code": 500, "message": "Couldn't find Customer with 'id'=5" } }`

---

## Account

---

### **Create Account**

Returns json data about the created Account.

- **URL**

  /accounts

- **Method:**

  `POST`

- **URL Params**

  **Required:**

None

- **Data Params**

`{ "account": { "customer_id": Integer, "currency_id": Integer, "number": String, "balance": String, "status": String, account_type: String } }`

- **Success Response:**

  - **Code:** 200 <br />
    **Content:**
    `{ "success": true, "data": { "account": { "customer_id": Integer, "currency_id": Integer, "number": String, "balance": String, "status": String, account_type: String } } }`

- **Error Response:**

  - **Code:** 422 Unprocessable Entity <br />
    **Content:** `{ "success": false, "errors": { "code": 422, "message": { "number": [ "has already been taken" ] } } }`

---


### **Update Account**

Returns json data about the updated account.

- **URL**

  /accounts/:id

- **Method:**

  `PATCH`

- **URL Params**

  **Required:**

  `id=[integer]`

- **Data Params**

`{ "account": { "customer_id": Integer, "currency_id": Integer, "number": String, "balance": String, "status": String, account_type: String } }`

- **Success Response:**

  - **Code:** 200 <br />
    **Content:**
    `{ "success": true, "data": { "account": { "customer_id": Integer, "currency_id": Integer, "number": String, "balance": String, "status": String, account_type: String } } }`

- **Error Response:**

  - **Code:** 422 Unprocessable Entity <br />
    **Content:** `{ "success": false, "errors": { "code": 422, "message": { "number": [ "has already been taken" ] } } }`

---


### **Get Account**

Returns json data about the the requested account.

- **URL**

  /accounts/:id

- **Method:**

  `GET`

- **URL Params**

  **Required:**

  `id=[integer]`

- **Data Params**

  None

- **Success Response:**

  - **Code:** 200 <br />
    **Content:**
    `{ "success": true, "data": { "account": { "customer_id": Integer, "currency_id": Integer, "number": String, "balance": String, "status": String, account_type: String } } }`

- **Error Response:**

  - **Code:** 500 Internal Server Error <br />
    **Content:** `{ "success": false, "errors": { "code": 500, "message": "Couldn't find Account with 'id'=5" } }`

---


### **Get Accounts**

Returns json data about the the requested accounts

- **URL**

  /accounts

- **Method:**

  `GET`

- **URL Params**

  **Optional:**

  `page=[integer]`
  `per_page=[integer]`

- **Data Params**

  None

- **Success Response:**

  - **Code:** 200 <br />
    **Content:**
    `{ "success": true, "data": { "account": [ { "customer_id": Integer, "currency_id": Integer, "number": String, "balance": String, "status": String, account_type: String } ] } }`

- **Error Response:**

---

### **Get Account balance**

Returns json data about the the requested account balance.

- **URL**

  /accounts/:id/balance

- **Method:**

  `GET`

- **URL Params**

  **Required:**

  `id=[integer]`

- **Data Params**

  None

- **Success Response:**

  - **Code:** 200 <br />
    **Content:**
    `{ "success": true, "data": { "account": { "balance": 100 } } }`

- **Error Response:**

  - **Code:** 500 Internal Server Error <br />
    **Content:** `{ "success": false, "errors": { "code": 500, "message": "Couldn't find Account with 'id'=5" } }`
---


### **Get Account transactions**

Returns json data about the the requested account transactions.

- **URL**

  /accounts/:id/transactions

- **Method:**

  `GET`

- **URL Params**

  **Required:**

  `id=[integer]`

- **Data Params**

  None

- **Success Response:**

  - **Code:** 200 <br />
    **Content:**
    `{"success":true,"data":{"transactions":[{"id":3,"to":{"id":1,"customer_id":1,"currency_id":1,"account_type":"basic","balance":"90.0","number":"10005584512879","status":"active","created_at":"2020-02-24T13:18:47.216Z","updated_at":"2020-02-24T13:18:47.311Z"},"from":{"id":2,"customer_id":2,"currency_id":1,"account_type":"basic","balance":"110.0","number":"10005584512878","status":"active","created_at":"2020-02-24T13:18:47.229Z","updated_at":"2020-02-24T13:18:47.317Z"},"amount":"25.0","description":null,"type":"transfer","created_at":"2020-02-24T13:18:47.306Z"},{"id":1,"to":{"id":2,"customer_id":2,"currency_id":1,"account_type":"basic","balance":"110.0","number":"10005584512878","status":"active","created_at":"2020-02-24T13:18:47.229Z","updated_at":"2020-02-24T13:18:47.317Z"},"from":{"id":1,"customer_id":1,"currency_id":1,"account_type":"basic","balance":"90.0","number":"10005584512879","status":"active","created_at":"2020-02-24T13:18:47.216Z","updated_at":"2020-02-24T13:18:47.311Z"},"amount":"5.0","description":null,"type":"transfer","created_at":"2020-02-24T13:18:47.254Z"},{"id":2,"to":{"id":2,"customer_id":2,"currency_id":1,"account_type":"basic","balance":"110.0","number":"10005584512878","status":"active","created_at":"2020-02-24T13:18:47.229Z","updated_at":"2020-02-24T13:18:47.317Z"},"from":{"id":1,"customer_id":1,"currency_id":1,"account_type":"basic","balance":"90.0","number":"10005584512879","status":"active","created_at":"2020-02-24T13:18:47.216Z","updated_at":"2020-02-24T13:18:47.311Z"},"amount":"10.0","description":null,"type":"transfer","created_at":"2020-02-24T13:18:47.277Z"}]}}`

- **Error Response:**

  - **Code:** 500 Internal Server Error <br />
    **Content:** `{ "success": false, "errors": { "code": 500, "message": "Couldn't find Account with 'id'=5" } }`
