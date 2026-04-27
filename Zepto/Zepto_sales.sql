create database zepto;
use zepto;

CREATE TABLE zepto_sales (
    Product_Name VARCHAR(100),
    Category VARCHAR(50),
    City VARCHAR(50),
    Original_Price FLOAT,
    Current_Price FLOAT,
    Discount INT,
    Orders INT,
    Total_Revenue FLOAT,
    Influencer_Active VARCHAR(10)
);

select count(*)from Zepto_sales;

select * from zepto_sales;

-- Total Revenue & Orders --
SELECT 
    SUM(Total_Revenue) AS total_revenue,
    SUM(Orders) AS total_orders,
    AVG(Discount) AS avg_discount
FROM zepto_sales;

-- Revenue By Category--
SELECT 
    category,
    SUM(Total_Revenue) AS total_revenue
FROM zepto_sales
GROUP BY category
ORDER BY total_revenue DESC;

-- Revenue By City --
SELECT 
    city,
    SUM(total_revenue) AS total_revenue
FROM zepto_sales
GROUP BY City
ORDER BY Total_Revenue DESC;

-- Top 10 Products --
SELECT 
    product_name,
    SUM(Total_Revenue) AS total_revenue
FROM zepto_sales
GROUP BY Product_Name
ORDER BY Total_Revenue DESC
LIMIT 10;

-- Discount Effective --
SELECT 
    discount,
    AVG(Total_Revenue) AS avg_revenue
FROM zepto_sales
GROUP BY Discount
ORDER BY Discount;

-- Discount % --
SELECT 
    Product_Name,
    Original_Price,
    Current_Price,
    ((Original_Price - Current_Price) / Original_Price) * 100 AS discount_percent
FROM zepto_sales;

-- Influencer Impact --
SELECT 
    Influencer_Active,
    AVG(Total_Revenue) AS avg_revenue,
    AVG(Orders) AS avg_orders
FROM zepto_sales
GROUP BY Influencer_Active;

-- Revenue Per Order --
SELECT 
    Product_Name,
    Total_Revenue / Orders AS Revenue_per_order
FROM zepto_sales;