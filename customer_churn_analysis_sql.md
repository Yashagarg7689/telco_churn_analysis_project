# Telecom Customer Churn Analysis (SQL)

This script sets up a MySQL database for telecom customer churn data and runs basic exploratory queries on it.

---

## 1. Database Setup

Create the database and switch to it.

```sql
CREATE DATABASE Telecom_Churn_db;
USE telecom_churn_db;
```

> **Note:** MySQL database names are case-insensitive on Windows but case-sensitive on Linux, so keep the casing consistent.

---

## 2. Table Creation

The `customer_churn` table stores one row per customer.

```sql
CREATE TABLE customer_churn (
    customerID VARCHAR(30),
    gender VARCHAR(10),
    SeniorCitizen INT,
    Partner VARCHAR(10),
    Dependents VARCHAR(10),
    tenure INT,
    PhoneService VARCHAR(10),
    MultipleLines VARCHAR(30),
    InternetService VARCHAR(30),
    OnlineSecurity VARCHAR(30),
    OnlineBackup VARCHAR(30),
    DeviceProtection VARCHAR(30),
    TechSupport VARCHAR(30),
    StreamingTV VARCHAR(30),
    StreamingMovies VARCHAR(30),
    Contract VARCHAR(30),
    PaperlessBilling VARCHAR(10),
    PaymentMethod VARCHAR(50),
    MonthlyCharges DECIMAL(10,2),
    TotalCharges VARCHAR(30),
    Churn VARCHAR(10)
);
```

### Column Reference

| Column | Type | Description |
|---|---|---|
| `customerID` | VARCHAR(30) | Unique customer identifier |
| `gender` | VARCHAR(10) | Customer gender |
| `SeniorCitizen` | INT | 1 if senior citizen, otherwise 0 |
| `Partner` | VARCHAR(10) | Whether the customer has a partner |
| `Dependents` | VARCHAR(10) | Whether the customer has dependents |
| `tenure` | INT | Number of months the customer has stayed |
| `PhoneService` | VARCHAR(10) | Whether the customer has phone service |
| `MultipleLines` | VARCHAR(30) | Whether the customer has multiple phone lines |
| `InternetService` | VARCHAR(30) | Type of internet service (DSL, Fiber optic, No) |
| `OnlineSecurity` | VARCHAR(30) | Online security add-on |
| `OnlineBackup` | VARCHAR(30) | Online backup add-on |
| `DeviceProtection` | VARCHAR(30) | Device protection add-on |
| `TechSupport` | VARCHAR(30) | Tech support add-on |
| `StreamingTV` | VARCHAR(30) | Streaming TV add-on |
| `StreamingMovies` | VARCHAR(30) | Streaming movies add-on |
| `Contract` | VARCHAR(30) | Contract type (Month-to-month, One year, Two year) |
| `PaperlessBilling` | VARCHAR(10) | Whether the customer uses paperless billing |
| `PaymentMethod` | VARCHAR(50) | Payment method used |
| `MonthlyCharges` | DECIMAL(10,2) | Amount charged per month |
| `TotalCharges` | VARCHAR(30) | Total amount charged over the tenure |
| `Churn` | VARCHAR(10) | Whether the customer left (Yes/No) |

> **Note:** `TotalCharges` is stored as `VARCHAR` (likely because the raw data has blank values). Convert it to a numeric type before doing calculations on it.

---

## 3. Exploratory Queries

### 3.1 View all data

```sql
SELECT *
FROM customer_churn;
```

### 3.2 Total number of customers

```sql
SELECT COUNT(*) AS total_customers
FROM customer_churn;
```

### 3.3 Customers by churn status

Shows how many customers churned vs. stayed.

```sql
SELECT Churn, COUNT(*) AS total_customers
FROM customer_churn
GROUP BY Churn;
```

### 3.4 Customers by gender

```sql
SELECT gender, COUNT(*)
FROM customer_churn
GROUP BY gender;
```

### 3.5 Customers by contract type

```sql
SELECT Contract, COUNT(*)
FROM customer_churn
GROUP BY Contract;
```

### 3.6 Customers by internet service type

```sql
SELECT InternetService, COUNT(*)
FROM customer_churn
GROUP BY InternetService;
```

### 3.7 Average monthly charges

```sql
SELECT AVG(MonthlyCharges)
FROM customer_churn;
```

### 3.8 All churned customers

```sql
SELECT *
FROM customer_churn
WHERE Churn = 'Yes';
```

### 3.9 Top 10 customers by monthly charges

```sql
SELECT customerID, MonthlyCharges
FROM customer_churn
ORDER BY MonthlyCharges DESC
LIMIT 10;
```

---

## 4. Issues Found in the Original Script

| Issue | Fix |
|---|---|
| `use tewlecom_churn_db;` is a typo and will throw an "Unknown database" error | Remove it, or correct it to `telecom_churn_db` |
| `USE telecom_churn_db;` appears multiple times | One `USE` statement is enough |
| `TotalCharges` is `VARCHAR` | Use `DECIMAL(10,2)` after cleaning blank values |

---

## 5. Suggested Next Queries

```sql
-- Churn rate (%)
SELECT ROUND(100 * SUM(Churn = 'Yes') / COUNT(*), 2) AS churn_rate_pct
FROM customer_churn;

-- Churn rate by contract type
SELECT Contract,
       ROUND(100 * SUM(Churn = 'Yes') / COUNT(*), 2) AS churn_rate_pct
FROM customer_churn
GROUP BY Contract;

-- Average tenure: churned vs. retained
SELECT Churn, ROUND(AVG(tenure), 1) AS avg_tenure_months
FROM customer_churn
GROUP BY Churn;
```
