# MySQL and Power BI for Data Analysis
Compilation of SQL - Power BI integration projects for Data Analytics, Business Intelligence and Data Visualizations.

## Database Database Tool and Data Visualization
- MySQL
- MySQL Workbench
- Power BI
    
## Walmart Sales Data

This dataset provides insights into Walmart's sales transactions. It includes various attributes related to the transactions, customer demographics, product categories, and financial metrics. This data can be used for various analyses, such as sales performance, customer behavior, product popularity, and financial analysis.

## Dataset Overview

### File

 **WalmartSalesData.csv**: The main dataset file.

### Columns

1. **InvoiceID**: A unique identifier for each invoice.
2. **Branch**: The branch where the transaction took place (A, B, C).
3. **City**: The city where the branch is located.
4. **CustomerType**: Type of customer (Member or Normal).
5. **Gender**: Gender of the customer (Male or Female).
6. **ProductLine**: The category of the product sold.
7. **UnitPrice**: The price per unit of the product.
8. **Quantity**: The quantity of the product sold.
9. **Tax5**: The tax amount (5%) for the transaction.
10. **Total**: The total amount for the transaction including tax.
11. **Date**: The date of the transaction.
12. **Time**: The time of the transaction.
13. **Payment**: The payment method used (Cash, Credit card, Ewallet).
14. **Cogs**: Cost of goods sold.
15. **GrossMarginPercentage**: Gross margin percentage.
17. **GrossIncome**: Gross income from the transaction.
18. **Rating**: Customer rating of the transaction.

# Project
SQL - MySQL for Data Analytics and Business Intelligence: data analysis and data visualizations for answering business related questions for improve Sale performance including,

### Generic Question
- How many unique cities does the data have?
- In which city is each branch?
### Product Analysis
- How many unique product lines does the data have?
- What is the most common payment method?
- What is the most selling product line?
- What is the total revenue by month?
- What month had the largest COGS?
- What product line had the largest revenue?
- What is the city with the largest revenue?
- What product line had the largest VAT?
- Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
- Which branch sold more products than average product sold?
- What is the most common product line by gender?
- What is the average rating of each product line?
### Sales Analysis
- Number of sales made in each time of the day per weekday
- Which of the customer types brings the most revenue?
- Which city has the largest tax percent/ VAT (Value Added Tax)?
- Which customer type pays the most in VAT?
### Customer Analysis
- How many unique customer types does the data have?
- How many unique payment methods does the data have?
- What is the most common customer type?
- Which customer type buys the most?
- What is the gender of most of the customers?
- What is the gender distribution per branch?
- Which time of the day do customers give most ratings?
- Which time of the day do customers give most ratings per branch?
- Which day fo the week has the best avg ratings?
- Which day of the week has the best average ratings per branch?

### Data Visualizaton
[Power_BI_Visualization](https://app.powerbi.com/view?r=eyJrIjoiYjljNWViMTItMjY2NC00ZGQ0LTg2ZTMtNjA3OWI5ODFmYWZlIiwidCI6ImZmNjM1MzY3LWJmYzUtNDQyMC1iZmU2LThhMWRkZWI0ZTVhZSJ9)

![Walmart Sales Analysis](https://github.com/vishwaprasad14/MySQL-PowerBI-for-Data-Analysis/blob/main/MySQL%20for%20Data%20Analysis/Screenshots/Sales_Analysis.png)
![Walmart Product Analysis](https://github.com/vishwaprasad14/MySQL-PowerBI-for-Data-Analysis/blob/main/MySQL%20for%20Data%20Analysis/Screenshots/Product_Analysis.png)
![Walmart Customer Analysis](https://github.com/vishwaprasad14/MySQL-PowerBI-for-Data-Analysis/blob/main/MySQL%20for%20Data%20Analysis/Screenshots/Customer_Analysis.png)
