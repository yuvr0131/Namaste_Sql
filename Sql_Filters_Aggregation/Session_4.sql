use YSNAMASTESQL1
go

select * from Order_Superstore;

update Order_Superstore
set city=null
where order_id in ('CA-2020-152156','US-2019-108966')

select city
from Order_Superstore
where order_id in('CA-2020-152156','US-2019-108966');

-- to seee records containing null
select * 
from Order_Superstore
where city is null;

select *
from Order_Superstore
where city is not null;


-- aggregation
select count(*) as cnt
from Order_Superstore;

select count(*) as cnt,
sum(sales) as total_sales,
max(sales) as max_sale,
min(profit) as min_profit,
avg(profit) as avg_profit
from Order_Superstore;

select top 1* from Order_Superstore
order by sales desc;

-- group by
select region ,count(*) as cnt,
sum(sales) as total_sales,
max(sales) as max_sale,
min(profit) as min_profit,
avg(profit) as avg_profit
from Order_Superstore
group by region;

select region, sum(sales) as total_sales
from Order_Superstore
group by region;

select region, category , sum(sales) as total_sales
from Order_Superstore
group by region, category;


select top 2 region,sum(sales) as total_sales
from Order_Superstore
where profit >0
group by region
order by total_sales desc;

select top 5 sub_category, sum(sales) as total_sales
from Order_Superstore
where profit>50
group by sub_category
having sum(sales)>100000
order by total_sales desc;

select sub_category, sum(sales) as total_sales
from Order_Superstore
group by sub_category
having max(order_date)>'2020-10-10'
order by total_sales desc;