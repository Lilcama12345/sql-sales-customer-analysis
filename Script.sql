SELECT 
    c.ID_Customer,
    c."Nama Customer",
    COUNT(t.ID_Transaction) AS total_transaksi
FROM customer c
JOIN transactions t
    ON c.ID_Customer = t.ID_Customer
GROUP BY c.ID_Customer, c."Nama Customer"
ORDER BY total_transaksi DESC;

2.

SELECT 
    c.ID_Customer,
    c."Nama Customer",
    SUM(t.Grand_Total) AS total_penjualan
FROM customer c
JOIN transactions t
    ON c.ID_Customer = t.ID_Customer
GROUP BY c.ID_Customer, c."Nama Customer"
ORDER BY total_penjualan DESC;

3. 

SELECT 
    p.Payment,
    COUNT(p.ID_Transaction) AS jumlah_transaksi
FROM payment p
GROUP BY p.Payment
ORDER BY jumlah_transaksi DESC;


4. 

SELECT 
    s.Status,
    COUNT(s.ID_Transaction) AS total_transaksi
FROM status s
GROUP BY s.Status;


5. 

SELECT 
    c.ID_Customer,
    c."Nama Customer",
    SUM(t.Grand_Total) AS total_belanja
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

6. 

SELECT 
    substr(Order_date, 1, 7) AS bulan,
    SUM(Grand_Total) AS total_penjualan
FROM transactions
GROUP BY bulan
ORDER BY bulan;

7.

SELECT 
    ID_Customer,
    COUNT(ID_Transaction) AS jumlah_transaksi,
    CASE
        WHEN COUNT(ID_Transaction) >= 10 THEN 'Loyal'
        WHEN COUNT(ID_Transaction) BETWEEN 5 AND 9 THEN 'Medium'
        ELSE 'Low'
    END AS segment_customer
FROM transactions
GROUP BY ID_Customer;


