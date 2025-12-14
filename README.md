# SQL Case Study: Sales & Customer Analysis (SQLite)

## 📌 Project Overview
This project presents an end-to-end **SQL case study** focused on analyzing sales performance and customer behavior using a relational database. The analysis is designed to demonstrate practical **advanced SQL skills** commonly required for academic research, internships, and entry-level data analyst roles.

The case study integrates multiple tables to generate business insights related to transactions, revenue, customer value, payment methods, and customer loyalty.

---

## 🗂 Database Structure
The analysis uses an SQLite database consisting of four related tables:

### 1. `customer`
- `ID_Customer`
- `Nama Customer`
- `Gender`
- `Alamat`
- `Kota`

### 2. `transactions`
- `ID_Transaction`
- `Order_date`
- `ID_Customer`
- `Product`
- `Brand`
- `Harga`
- `Kuantitas`
- `Harga_Total`
- `Total_Diskon`
- `Total_Sales`
- `Biaya_Ongkir`
- `Grand_Total`

### 3. `payment`
- `ID_Transaction`
- `Payment`

### 4. `status`
- `ID_Transaction`
- `Status`

Relationships are established using **ID_Customer** and **ID_Transaction** as primary keys.

---

## 🎯 Objectives
The main objectives of this SQL case study are:
- Analyze customer transaction activity
- Measure total sales and customer contribution
- Identify high-value customers
- Evaluate payment methods usage
- Monitor transaction status
- Perform customer loyalty segmentation

---

## 🧠 Methodology
The analysis follows a structured approach:
1. Data exploration and table inspection
2. Data integration using JOIN operations
3. Aggregation using COUNT, SUM, and AVG
4. Subqueries for comparative analysis
5. Interpretation of results into business insights

---

## 📊 SQL Analysis & Queries

### 1. Customer Transaction Frequency
```sql
SELECT 
    c.ID_Customer,
    c."Nama Customer",
    COUNT(t.ID_Transaction) AS total_transactions
FROM customer c
JOIN transactions t
    ON c.ID_Customer = t.ID_Customer
GROUP BY c.ID_Customer, c."Nama Customer"
ORDER BY total_transactions DESC;
```
**Insight:** Identifies the most active customers based on transaction count.

---

### 2. Total Sales per Customer
```sql
SELECT 
    c.ID_Customer,
    c."Nama Customer",
    SUM(t.Grand_Total) AS total_sales
FROM customer c
JOIN transactions t
    ON c.ID_Customer = t.ID_Customer
GROUP BY c.ID_Customer, c."Nama Customer"
ORDER BY total_sales DESC;
```
**Insight:** Measures customer contribution to total revenue (Customer Value).

---

### 3. Most Used Payment Methods
```sql
SELECT 
    p.Payment,
    COUNT(p.ID_Transaction) AS transaction_count
FROM payment p
GROUP BY p.Payment
ORDER BY transaction_count DESC;
```
**Insight:** Shows customer preferences for payment methods.

---

### 4. Transaction Status Distribution
```sql
SELECT 
    s.Status,
    COUNT(s.ID_Transaction) AS total_transactions
FROM status s
GROUP BY s.Status;
```
**Insight:** Helps monitor transaction success and failure rates.

---

### 5. High-Value Customers (Above Average Spending)
```sql
SELECT 
    c.ID_Customer,
    c."Nama Customer",
    SUM(t.Grand_Total) AS total_spending
FROM customer c
JOIN transactions t
    ON c.ID_Customer = t.ID_Customer
GROUP BY c.ID_Customer, c."Nama Customer"
HAVING SUM(t.Grand_Total) > (
    SELECT AVG(total_per_customer)
    FROM (
        SELECT SUM(Grand_Total) AS total_per_customer
        FROM transactions
        GROUP BY ID_Customer
    )
);
```
**Insight:** Identifies high-value customers for retention and targeted marketing.

---

### 6. Monthly Sales Trend
```sql
SELECT 
    substr(Order_date, 1, 7) AS month,
    SUM(Grand_Total) AS monthly_sales
FROM transactions
GROUP BY month
ORDER BY month;
```
**Insight:** Reveals sales trends and seasonality patterns.

---

### 7. Customer Loyalty Segmentation
```sql
SELECT 
    ID_Customer,
    COUNT(ID_Transaction) AS total_transactions,
    CASE
        WHEN COUNT(ID_Transaction) >= 10 THEN 'Loyal'
        WHEN COUNT(ID_Transaction) BETWEEN 5 AND 9 THEN 'Medium'
        ELSE 'Low'
    END AS customer_segment
FROM transactions
GROUP BY ID_Customer;
```
**Insight:** Segments customers based on transaction frequency for strategic decision-making.

---

## ✅ Key Findings
- A small proportion of customers contributes significantly to total sales.
- Transaction activity varies across time periods.
- Payment method analysis provides operational insights.
- Customer segmentation supports targeted marketing and retention strategies.

---

## 🛠 Tools
- SQLite
- DB Browser for SQLite

---

## 📁 Usage
This repository is intended for:
- Academic assignments
- SQL portfolio demonstration
- Internship and entry-level data analyst applications

## How to Use
1. Download the `.db` file
2. Open using DB Browser for SQLite
3. Run queries from `/sql` folder

---

📌 *This project demonstrates practical SQL capabilities with a strong emphasis on business-oriented data analysis.*

