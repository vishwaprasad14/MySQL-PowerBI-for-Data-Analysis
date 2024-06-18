-- Create the database if it does not exist
CREATE DATABASE IF NOT EXISTS sales_data;
USE sales_data;

-- Loaded the data using Table Data Import Wizard option

-- Select all records from the Sales table to verify the data load
select * from sales_data.walmartsalesdata;

-- Add the time_of_day column
ALTER TABLE sales_data.walmartsalesdata ADD COLUMN Time_of_day varchar(20);

update sales_data.walmartsalesdata
set time_of_day=
	(CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END);
    
    
-- Add day_name column
ALTER TABLE sales_data.walmartsalesdata ADD COLUMN day_name varchar(12);

UPDATE sales_data.walmartsalesdata
SET day_name = DAYNAME(date);

-- Add month_name column
ALTER TABLE sales_data.walmartsalesdata ADD COLUMN month_name varchar(12);

UPDATE sales_data.walmartsalesdata
SET month_name = MONTHNAME(date);

----------------------------------------- Generic ---------------------------------------------------

-- How many unique cities does the data have?
SELECT 
      DISTINCT city
from sales_data.walmartsalesdata;      

-- In which city is each branch?

SELECT 
	DISTINCT city,
    branch
FROM sales_data.walmartsalesdata;
---------------------------------------------- Product -----------------------------------------------

-- How many unique product lines does the data have?

SELECT 
      COUNT(DISTINCT `product line`)
FROM sales_data.walmartsalesdata; 

-- What is the most selling product line    

SELECT 
      SUM(quantity) AS qty,
      `product line`
FROM sales_data.walmartsalesdata  
GROUP BY `product line`
ORDER BY qty DESC; 
   
-- What month had the largest COGS?

SELECT
	month_name AS month,
	SUM(cogs) AS cogs
FROM sales_data.walmartsalesdata
GROUP BY month_name 
ORDER BY cogs DESC;

-- What product line had the largest revenue?

SELECT
	`product line`,
	SUM(total) as total_revenue
FROM sales_data.walmartsalesdata
GROUP BY `product line`
ORDER BY total_revenue DESC;

-- What is the city with the largest revenue?

SELECT
	branch,
	city,
	SUM(total) AS total_revenue
FROM sales_data.walmartsalesdata
GROUP BY city, branch 
ORDER BY total_revenue;

-- What product line had the largest TAX?
SELECT
	`product line`,
	AVG(tax) as avg_tax
FROM sales_data.walmartsalesdata
GROUP BY `product line`
ORDER BY avg_tax DESC;

-- Fetch each product line and add a column to those product 
-- line showing "Good", "Bad". Good if its greater than average sales

SELECT
      AVG(quantity) as avg_qnty
FROM sales_data.walmartsalesdata;    

SELECT
      `product line`,
      case
           when AVG(quantity) > 5.5100 then "Good"
           else "Bad"
      end as remark   
from sales_data.walmartsalesdata     
group by `product line`; 
        
-- Which branch sold more products than average product sold?

SELECT 
    branch,
    SUM(quantity) AS qty
FROM sales_data.walmartsalesdata
GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(quantity) AS avg_quantity FROM sales_data.walmartsalesdata);
      
-- What is the most common product line by gender

SELECT
	gender,
    `product line`,
    COUNT(gender) AS total_cnt
FROM sales_data.walmartsalesdata
GROUP BY gender, `product line`
ORDER BY total_cnt DESC;

-- What is the average rating of each product line

SELECT
	ROUND(AVG(rating), 2) as avg_rating,
    `product line`
FROM sales_data.walmartsalesdata
GROUP BY `product line`
ORDER BY avg_rating DESC;

------------------------------------------- Customers -------------------------------------------------


-- How many unique customer types does the data have?
SELECT
	DISTINCT `customer type`
FROM sales_data.walmartsalesdata;

-- How many unique payment methods does the data have?
SELECT 
      DISTINCT `payment method`
FROM sales_data.walmartsalesdata;    

-- What is the most common customer type?
SELECT
	`customer type`,
	count(*) as count
FROM sales_data.walmartsalesdata
GROUP BY `customer type`
ORDER BY count DESC;

-- Which customer type buys the most?
SELECT
	`customer type`,
    COUNT(*)
FROM sales_data.walmartsalesdata
GROUP BY `customer type`;

-- What is the gender of most of the customers?
SELECT
	gender,
	COUNT(*) as gender_cnt
FROM sales_data.walmartsalesdata
GROUP BY gender
ORDER BY gender_cnt DESC;

-- What is the gender distribution per branch?
SELECT
	gender,
	COUNT(*) as gender_cnt
FROM sales_data.walmartsalesdata
WHERE branch = "C"
GROUP BY gender
ORDER BY gender_cnt DESC;
-- Gender per branch is more or less the same hence, I don't think has
-- an effect of the sales per branch and other factors.

-- Which time of the day do customers give most ratings?
SELECT
	time_of_day,
	AVG(rating) AS avg_rating
FROM sales_data.walmartsalesdata
GROUP BY time_of_day
ORDER BY avg_rating DESC;
-- Looks like time of the day does not really affect the rating, its
-- more or less the same rating each time of the day.alter

-- Which time of the day do customers give most ratings per branch?
SELECT
    time_of_day,
    branch,
    AVG(rating) AS avg_rating
FROM sales_data.walmartsalesdata
WHERE branch IN ("A", "B", "C")
GROUP BY time_of_day, branch
ORDER BY avg_rating DESC;
-- Branch A and C are doing well in ratings, branch B needs to do a 
-- little more to get better ratings.

-- Which day fo the week has the best avg ratings?
SELECT
	day_name,
	AVG(rating) AS avg_rating
FROM sales_data.walmartsalesdata
GROUP BY day_name 
ORDER BY avg_rating DESC;
-- Mon, Tue and Friday are the top best days for good ratings
-- why is that the case, how many sales are made on these days?

-- Which day of the week has the best average ratings per branch?
SELECT 
	day_name,
    branch,
	COUNT(day_name) total_sales
FROM sales_data.walmartsalesdata
WHERE branch in ("A","B","C")
GROUP BY day_name, branch
ORDER BY total_sales DESC;

--------------------------------------------------- Sales ------------------------------------------------

-- Number of sales made in each time of the day per weekday 
SELECT
	time_of_day,
	COUNT(*) AS total_sales
FROM sales_data.walmartsalesdata
WHERE day_name = "Sunday"
GROUP BY time_of_day 
ORDER BY total_sales DESC;

-- Evenings experience most sales, the stores are 
-- filled during the evening hours

-- Which of the customer types brings the most revenue?
SELECT
	`customer type`,
	SUM(total) AS total_revenue
FROM sales_data.walmartsalesdata
GROUP BY `customer type`
ORDER BY total_revenue;


-- Which city has the largest tax/VAT percent?
SELECT
	city,
    ROUND(AVG(`tax 5%`), 2) AS avg_tax_pct
FROM sales_data.walmartsalesdata
GROUP BY city 
ORDER BY avg_tax_pct DESC;

-- Which customer type pays the most in VAT?
SELECT
	`customer type`,
	AVG(`tax 5%`) AS total_tax
FROM sales_data.walmartsalesdata
GROUP BY `customer type`
ORDER BY total_tax;

