USE magist;

-- 1. How many orders are there in the dataset?
select count(*) orders_count from orders; -- 99441

-- 2. Are orders actually delivered?
select order_status, count(*) orders from orders group by order_status;

-- 3. Is Magist having user growth?
select year(order_purchase_timestamp) y, month(order_purchase_timestamp) m, count(customer_id) from orders group by y, m order by y desc, m desc;

-- 4. How many products are there on the products table?
select count(distinct product_id) products_count from products;

-- 5. Which are the categories with the most products?
select product_category_name_english, count(distinct product_id) n_products from products p join product_category_name_translation pcnt on p.product_category_name = pcnt.product_category_name group by product_category_name_english order by count(product_id) desc;

-- 6. How many of those products were present in actual transactions?
select count(distinct product_id) n_products from order_items; -- 32951
select count(*) from products; -- 32951 -- means: all products ;)

-- 7. What’s the price for the most expensive and cheapest products?
select min(price) price_min, max(price) price_max from order_items;

-- 8. What are the highest and lowest payment values?
select min(payment_value) payment_min, max(payment_value) payment_max from order_payments;

-- 8.b What is the maximum one has paid for an order?
select sum(payment_value) highest_order from order_payments group by order_id order by highest_order desc;

-- ------------------------------------------------------------------------------------------------------------------------------------------------

-- 9. How many different categories are  in the products table?
SELECT count(*) FROM (select 1 as single_category from products group by product_category_name) category;

