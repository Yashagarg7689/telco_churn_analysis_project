CREATE DATABASE Telecom_Churn_db;
use Telecom_churn_db;
USE telecom_churn_db;

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
USE telecom_churn_db;

use tewlecom_churn_db;
select *
from customer_churn;


SELECT COUNT(*) AS total_customers
FROM customer_churn;


SELECT Churn, COUNT(*) AS total_customers
FROM customer_churn
GROUP BY Churn;


SELECT gender, COUNT(*)
FROM customer_churn
GROUP BY gender;


SELECT Contract, COUNT(*)
FROM customer_churn
GROUP BY Contract;


SELECT InternetService, COUNT(*)
FROM customer_churn
GROUP BY InternetService;


SELECT AVG(MonthlyCharges)
FROM customer_churn;


SELECT *
FROM customer_churn
WHERE Churn = 'Yes';


SELECT customerID, MonthlyCharges
FROM customer_churn
ORDER BY MonthlyCharges DESC
LIMIT 10;


















