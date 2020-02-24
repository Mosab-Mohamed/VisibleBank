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
