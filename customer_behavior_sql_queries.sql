CREATE DATABASE customer_shopping_behavior;
USE customer_shopping_behavior;
SELECT * FROM shopping_data LIMIT 20;

/* 1. Total Revenue by gender (male vs female) ?  */
SELECT gender,SUM(purchase_amount) AS revenue FROM shopping_data group by gender;

/* 2. Customers with discount but still spent more than average spending ?  */
SELECT customer_id,purchase_amount FROM shopping_data  
WHERE discount_applied="Yes"   AND purchase_amount>=(SELECT AVG(purchase_amount) from shopping_data);

/* 3.  top 5 products by average rating ? */
SELECT item_purchased,ROUND(AVG(review_rating),2) AS avg_product_rating FROM shopping_data
GROUP BY item_purchased ORDER BY avg_product_rating DESC LIMIT 5;

/* 4. AVERAGE SPEND by shipping type?  */
SELECT shipping_type,ROUND(AVG(purchase_amount),2) AS avg_spend FROM shopping_data
WHERE shipping_type IN("Standard","Express") GROUP BY shipping_type;

/* 5. Subscription vs Spending Behavior ? */
SELECT subscription_status, COUNT(customer_id) AS total_customers, ROUND(AVG(purchase_amount),2) AS avg_spend,
ROUND(SUM(purchase_amount),2) AS total_revenue FROM shopping_data 
GROUP BY subscription_status ORDER BY total_revenue DESC;

/* 6.  top 5 products with highest discount usage ? */
SELECT item_purchased, ROUND(100*SUM(CASE WHEN discount_applied="Yes" THEN 1 ELSE 0 END)/COUNT(*),2) AS discount_rate
FROM shopping_data GROUP BY item_purchased ORDER BY  discount_rate DESC LIMIT 5;

/* 7. Customer Segmentation (New / Returning / Loyal) ? */
WITH customer_type AS (
SELECT customer_id,previous_purchases,
CASE 
    WHEN previous_purchases=1 THEN "New"
    WHEN previous_purchases BETWEEN 2 AND 10 THEN "Returning"
    ELSE "Loyal"
    END AS customer_segment
    FROM shopping_data )
SELECT customer_segment,count(*) AS number_of_customers
FROM  customer_type GROUP BY customer_segment;

/* 8. Top 3 Products in Each Category ? */
WITH item_counts AS (
SELECT  category,item_purchased,COUNT(customer_id) AS total_orders,
ROW_NUMBER() OVER (PARTITION BY category ORDER BY COUNT(customer_id) DESC) AS item_rank
FROM shopping_data GROUP BY category,item_purchased)
SELECT category,item_purchased,total_orders
FROM item_counts WHERE item_rank<=3;

/* Are customers who are repeat buyers are likely to subscribe ?  */
SELECT subscription_status,COUNT(customer_id) AS repeat_buyers FROM shopping_data
WHERE previous_purchases >5  GROUP BY subscription_status;

/* 10. Revenue by Age Group ? */
SELECT age_group,SUM(purchase_amount) AS total_revenue FROM shopping_data
GROUP BY age_group ORDER BY total_revenue DESC;

