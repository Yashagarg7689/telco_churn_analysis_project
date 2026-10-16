/* =====================================================================
   TELECOM CUSTOMER CHURN ANALYSIS
   ---------------------------------------------------------------------
   Dataset : Telecom customers data (table: customer_churn)
   Goal    : Understand the customer base and find which customers
             have left the company (churned).

   Columns : customerID, gender, SeniorCitizen, Partner, Dependents,
             tenure, PhoneService, MultipleLines, InternetService,
             OnlineSecurity, OnlineBackup, DeviceProtection, TechSupport,
             StreamingTV, StreamingMovies, Contract, PaperlessBilling,
             PaymentMethod, MonthlyCharges, TotalCharges, Churn

   Sections:
     1. Database & Table Setup
     2. Basic Data Exploration
     3. Churn Analysis
     4. Customer Profile Analysis
     5. Billing Analysis
   ===================================================================== */


/* =====================================================================
   1. DATABASE & TABLE SETUP
   ===================================================================== */

-- Create a new database to store the telecom churn data.
CREATE DATABASE Telecom_Churn_db;

-- Select the database so that all following queries run inside it.
-- NOTE: This line and the next one do the same thing (database names are
-- not case-sensitive here), so one of them is enough.
use Telecom_churn_db;
USE telecom_churn_db;

-- Create the `customer_churn` table with one column for every attribute.
-- Text fields use VARCHAR, whole numbers use INT, and MonthlyCharges uses
-- DECIMAL to store exact money values.
-- NOTE: TotalCharges is stored as VARCHAR, so it must be converted to a
-- number before doing calculations on it (e.g. SUM or AVG).
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

-- Select the database again before running the analysis queries.
USE telecom_churn_db;

-- NOTE: This line has a typo in the database name ("tewlecom") and will
-- throw an "Unknown database" error. It should be `telecom_churn_db`.
use tewlecom_churn_db;


/* =====================================================================
   2. BASIC DATA EXPLORATION
   ===================================================================== */

-- View all rows and columns to confirm the data loaded correctly.
select *
from customer_churn;


-- Count the total number of customers in the table.
SELECT COUNT(*) AS total_customers
FROM customer_churn;


/* =====================================================================
   3. CHURN ANALYSIS
   ===================================================================== */

-- Number of customers who left (Churn = 'Yes') versus stayed (Churn = 'No').
-- This gives the overall churn picture of the company.
SELECT Churn, COUNT(*) AS total_customers
FROM customer_churn
GROUP BY Churn;


-- List the full details of every customer who churned.
SELECT *
FROM customer_churn
WHERE Churn = 'Yes';


/* =====================================================================
   4. CUSTOMER PROFILE ANALYSIS
   ===================================================================== */

-- Number of customers by gender.
SELECT gender, COUNT(*)
FROM customer_churn
GROUP BY gender;


-- Number of customers on each contract type
-- (e.g. Month-to-month, One year, Two year).
SELECT Contract, COUNT(*)
FROM customer_churn
GROUP BY Contract;


-- Number of customers for each internet service type
-- (e.g. DSL, Fiber optic, No internet).
SELECT InternetService, COUNT(*)
FROM customer_churn
GROUP BY InternetService;


/* =====================================================================
   5. BILLING ANALYSIS
   ===================================================================== */

-- Average monthly bill across all customers.
SELECT AVG(MonthlyCharges)
FROM customer_churn;


-- Top 10 customers with the highest monthly charges.
SELECT customerID, MonthlyCharges
FROM customer_churn
ORDER BY MonthlyCharges DESC
LIMIT 10;
