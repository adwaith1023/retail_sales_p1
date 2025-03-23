DROP TABLE  retail_sales;
CREATE TABLE retail_sales(transaction_id INT PRIMARY KEY,sale_date DATE,sale_time TIME,customer_id INT,gender VARCHAR(15),age INT,category VARCHAR(15),quantity INT,price_per_unit FLOAT,cog FLOAT,total_sale FLOAT);
SELECT * FROM retail_sales;
SELECT COUNT(*) FROM retail_sales;
SELECT * FROM retail_sales 
WHERE 
     transaction_id IS NULL 
	 OR 
	 sale_date IS NULL 
	 OR 
	 sale_time IS NULL 
	 OR 
	 customer_id IS NULL
	 OR 
	 gender IS NULL
	 OR
	 age IS NULL 
	 OR
	 category IS NULL
	 OR
	 quantity IS NULL
	 OR
	 price_per_unit IS NULL
	 OR
	 total_sale IS NULL;
DELETE FROM retail_sales
      WHERE
	  transaction_id IS NULL 
	 OR 
	 sale_date IS NULL 
	 OR 
	 sale_time IS NULL 
	 OR 
	 customer_id IS NULL
	 OR 
	 gender IS NULL
	 OR
	 age IS NULL 
	 OR
	 category IS NULL
	 OR
	 quantity IS NULL
	 OR
	 price_per_unit IS NULL
	 OR
	 total_sale IS NULL;
	 --total sales had.
SELECT 
COUNT(total_sale) 
FROM retail_sales;
--how many customers we have?
SELECT
COUNT(DISTINCT category) 
FROM retail_sales;
SELECT DISTINCT(category) FROM retail_sales;
--data analysis
 SELECT * FROM
 retail_sales WHERE 
 sale_date='2022-11-05';
 
SELECT * FROM 
retail_sales WHERE
category='Clothing' AND
TO_CHAR(sale_date,'yyyy-mm')='2022-11' AND 
quantity>2;

SELECT category,
SUM(total_sale) 
AS net_sale FROM 
retail_sales GROUP BY category;

SELECT category,
COUNT(*) AS TOTAL_order FROM 
retail_sales GROUP BY 1;

SELECT AVG(age) AS
AVERAGE_AGE FROM 
retail_sales WHERE category='Beauty';

SELECT * FROM 
retail_sales WHERE total_sale>1000;
SELECT gender,category,
COUNT(transaction_id) AS NUM FROM 
retail_sales GROUP BY gender,category ORDER BY 1;

SELECT year,month,avg_sales FROM
(
 SELECT TO_CHAR(sale_date,'mm') as year,
 TO_CHAR(sale_date,'yyyy') as month,
 AVG(total_sale) as avg_sales,
 RANK() OVER(PARTITION BY TO_CHAR(sale_date,'yyyy') ORDER BY AVG(total_sale) DESC) AS rank FROM
 retail_sales GROUP BY 1,2 ORDER BY 2
) 
WHERE rank=1;



SELECT customer_id,
SUM(total_sale) AS total,
RANK() OVER(ORDER BY SUM(total_sale) DESC) AS 
rank FROM retail_sales
GROUP BY 1 ORDER BY 2 DESC
LIMIT 5;

SELECT 
COUNT(DISTINCT(customer_id)),
category FROM retail_sales 
GROUP BY 2;

SELECT shift,COUNT(total_sale)
FROM
(
 SELECT *,
 CASE
  WHEN EXTRACT(HOUR FROM sale_time)<12 THEN 'Morning'
  WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
  ELSE'Evening'
 END AS shift 
 FROM retail_sales
)
GROUP BY 1;
--End of projects
	  
	 
