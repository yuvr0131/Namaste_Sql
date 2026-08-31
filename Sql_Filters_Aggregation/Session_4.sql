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

-- count
select count(distinct region)
from Order_Superstore;

select count(1)
from Order_Superstore;

select count(city)
from Order_Superstore;


---------------------------------------------------
-- Assignment 4:
-- 1- write a update statement to update city as null for order ids :  CA-2020-161389 , US-2021-156909
Select * from Order_Superstore;
Update Order_Superstore
set city=Null
where Order_ID in( 'CA-2020-161389' , 'US-2021-156909')

select city
from Order_Superstore
where Order_ID in('CA-2020-161389' , 'US-2021-156909')



-- 2. write a query to find orders where city is null - (2 rows)
select *
from Order_Superstore
where city is null

-- 3.write a query to get total profit, first order date and latest order date for each category
select Category,sum( Profit) as Total_Profit, Min(Order_Date) as First_Order_Date,Max(Order_Date) as Latest_Order_Date
from Order_Superstore
group by Category;

-- 4. write a query to find sub-categories where average profit is more than the half of the max profit in that sub-category
  select Sub_Category
  from Order_Superstore
   group by Sub_Category
  having avg(Profit)>max(Profit)/2;

-- 5. create the exams table with below script;
/* create table exams (student_id int, subject varchar(20), marks int);

insert into exams values (1,'Chemistry',91),(1,'Physics',91),(1,'Maths',92)
,(2,'Chemistry',80),(2,'Physics',90)
,(3,'Chemistry',80),(3,'Maths',80)
,(4,'Chemistry',71),(4,'Physics',54)
,(5,'Chemistry',79);

write a query to find students who have got same marks in Physics and Chemistry.*/
create table exams (student_id int, subject varchar(20), marks int);

insert into exams values (1,'Chemistry',91),(1,'Physics',91),(1,'Maths',92)
,(2,'Chemistry',80),(2,'Physics',90)
,(3,'Chemistry',80),(3,'Maths',80)
,(4,'Chemistry',71),(4,'Physics',54)
,(5,'Chemistry',79);

select * from exams;
select s1.student_id, s1.marks
from exams s1
join exams s2
on s1.student_id = s2.student_id
where s1.subject='Physics' and s2.subject='Chemistry'
and s1.marks=s2.marks;


-- 6- write a query to find total number of products in each category.
select Category,count(Sub_Category) as Total_Products
from Order_Superstore
group by Category;

-- 7- write a query to find top 5 sub categories in west region by total quantity sold
Select top 5  Region,Sub_Category, Sum(Quantity) as Total_quantity
from Order_Superstore
where region='West'
group by Region,Sub_Category
order by Sum(Quantity) desc;


-- 8- write a query to find total sales for each region and ship mode combination for orders in year 2020
select Region, Ship_Mode,Sum(Sales) as Total_Sales
from order_superstore
where Year(Order_Date)=2020
group by Region, Ship_Mode
Order by Sum(Sales);
