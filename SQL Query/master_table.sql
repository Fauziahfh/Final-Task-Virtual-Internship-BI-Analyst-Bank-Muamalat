SELECT
    o.Date AS order_date,
    pc.CategoryName AS category_name,
    p.ProdName AS product_name,
    p.Price AS product_price,
    o.Quantity AS order_qty,
    ROUND(SUM(p.Price * o.Quantity), 2) AS total_sales,
    c.CustomerEmail AS cust_email,
    c.CustomerCity AS cust_city
FROM
    bi-muamalat-2022.Final_Task.Orders o
    JOIN bi-muamalat-2022.Final_Task.Customers c ON o.CustomerID = c.CustomerID
    JOIN bi-muamalat-2022.Final_Task.Products p ON o.ProdNumber = p.ProdNumber
    JOIN bi-muamalat-2022.Final_Task.ProductCategory pc ON p.Category = pc.CategoryID
GROUP BY
    o.Date,
    pc.CategoryName,
    p.ProdName,
    p.Price,
    o.Quantity,
    c.CustomerEmail,
    c.CustomerCity
ORDER BY
    o.Date ASC;
