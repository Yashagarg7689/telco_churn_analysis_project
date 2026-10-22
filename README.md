# 📉 Telco Customer Churn Analysis

An end-to-end data analytics project on telecom customer data: data inspection in **Python**, analysis in **SQL (MySQL)**, and an interactive dashboard in **Power BI** to understand **why customers leave (churn)**.

![Dashboard Preview](dashboard_preview.png)

---

## 📌 Project Overview

Customer churn is one of the biggest problems for telecom companies — keeping an existing customer is cheaper than acquiring a new one. This project explores a telecom customer dataset to understand:

- How many customers churn and how many stay
- How churn relates to contract type, internet service, gender and billing
- What the typical monthly charges and tenure of customers look like

The workflow has three stages:

1. **Data Inspection & Cleaning** – Python (Pandas)
2. **SQL Analysis** – MySQL queries on the customer data
3. **Dashboard** – Power BI report with key churn insights

---

## 🗂️ Dataset

- **Size:** 7,032 customers × 21 columns
- **Target column:** `Churn` (Yes / No)
- **Missing values:** none
- **Duplicate rows:** none

| Category | Columns |
|----------|---------|
| Customer profile | `customerID`, `gender`, `SeniorCitizen`, `Partner`, `Dependents` |
| Account info | `tenure`, `Contract`, `PaperlessBilling`, `PaymentMethod` |
| Services | `PhoneService`, `MultipleLines`, `InternetService`, `OnlineSecurity`, `OnlineBackup`, `DeviceProtection`, `TechSupport`, `StreamingTV`, `StreamingMovies` |
| Charges | `MonthlyCharges`, `TotalCharges` |
| Target | `Churn` |

**Quick statistics**

| Metric | Value |
|--------|------:|
| Average tenure | ~32.4 months (range: 1–72) |
| Average monthly charges | ~64.80 (range: 18.25–118.75) |
| Average total charges | ~2,283 |
| Senior citizens | ~16% of customers |

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| Python (Pandas), Jupyter / Google Colab | Data loading and inspection |
| SQL (MySQL) | Querying and exploring the data |
| Power BI | Interactive dashboard |
| GitHub | Version control and hosting |

---

## 📂 Repository Structure

```
telco_churn_analysis/
│
├── cleaned_customer_churn_analysis.ipynb   # Python notebook: inspection & cleaning
├── customer churn.csv                      # Cleaned dataset
├── customer_churn_analysis_sql.sql         # SQL queries
├── customer churn dashboard.pbix           # Power BI dashboard
├── dashboard_preview.png                   # Dashboard screenshot (used in README)
└── README.md
```

> Rename the files above to match your repository.

---

## 🧹 Data Cleaning (Python)

Done in the Jupyter notebook:

- Loaded the data with `pd.read_csv()`
- Previewed the data with `head()` and `tail()`
- Checked structure and data types with `info()` and `shape`
- Reviewed numeric columns with `describe()`
- Verified there are **no missing values** (`isnull().sum()`) and **no duplicate rows** (`duplicated().sum()`)
- Confirmed `TotalCharges` is stored as a numeric column
- Exported the cleaned file as CSV

---

## 🔍 SQL Analysis

Queries in `customer_churn_analysis_sql.sql` create the `telecom_churn_db` database and `customer_churn` table, then answer:

| Question | Query type |
|----------|-----------|
| How many customers are there in total? | `COUNT(*)` |
| How many customers churned vs stayed? | `GROUP BY Churn` |
| What is the gender split? | `GROUP BY gender` |
| How are customers spread across contract types? | `GROUP BY Contract` |
| Which internet services do customers use? | `GROUP BY InternetService` |
| What is the average monthly charge? | `AVG(MonthlyCharges)` |
| Who are the churned customers? | `WHERE Churn = 'Yes'` |
| Which 10 customers pay the most per month? | `ORDER BY ... DESC LIMIT 10` |

**SQL concepts used:** `GROUP BY`, `COUNT`, `AVG`, `WHERE`, `ORDER BY`, `LIMIT`, aliases.

---

## 📊 Power BI Dashboard

`customer churn dashboard.pbix` is a dark-themed, single-page dashboard that shows what drives customer churn.

![Customer Churn Dashboard](dashboard_preview.png)

**KPI cards**
- Total customers – **7,032**
- Average monthly charges – **64.80**
- Churned customers – **1,869**

**Visuals**
- **Customer Churn Distribution** – donut chart of churned vs retained customers
- **Contract vs Churn** – 100% stacked bar of churn by contract type
- **Churn by Internet Services** – stacked column chart (Fiber optic / DSL / No internet)
- **Churn by Tenure** – line chart of churned vs retained customers across tenure months

---

## 💡 Key Insights

- **Overall churn rate is 26.58%** – about 1.87K of 7.03K customers left, while 5.16K (73.42%) stayed.
- **Contract type is the strongest factor** – month-to-month customers churn at **42.71%**, compared to **11.28%** for one-year and only **~2.85%** for two-year contracts.
- **Fiber optic users churn the most** – about 1.3K churned customers on fiber, versus about 0.5K on DSL. Customers with no internet service rarely churn.
- **New customers are the most at risk** – churn is highest in the first few months of tenure (about 380 churned customers at month 1) and falls steadily as tenure grows.
- **Long-term customers stay** – the retained customer count spikes at the 72-month mark (356 customers).

**Takeaway:** pushing new and month-to-month customers towards longer contracts, and looking into service quality for fiber optic users, could help reduce churn.

---

## ▶️ How to Use

1. **Clone the repository**
   ```bash
   git clone https://github.com/Yashagarg7689/telco_churn_analysis.git
   ```
2. **Notebook** – open the `.ipynb` file in Jupyter or Google Colab.
   > Note: the last cell uses `google.colab`, which works only in Colab.
3. **SQL** – import the CSV into MySQL as the `customer_churn` table and run the `.sql` file.
4. **Dashboard** – open the `.pbix` file in Power BI Desktop.

---

## 🙋 Author

**Yasha Garg**
GitHub: [@Yashagarg7689](https://github.com/Yashagarg7689)
