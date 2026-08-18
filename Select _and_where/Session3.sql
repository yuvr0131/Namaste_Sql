USE YSNAMASTESQL1
go

select * from dbo.Orders;
select order_id, order_date from orders;
-- top
select top 5 * 
from orders
order by order_date desc;


-- to get distinct value of a column
select distinct ship_Mode from orders;

-- to get distinct values of combination of two columns
select distinct ship_Mode, segment from orders;

-- to get distinct rows from the entire table
select distinct * from orders;

-- filters --
--where
select *
from orders
where ship_Mode='First class';

select * 
from orders
where quantity=5;

select top 5 order_date, quantity
from orders
where quantity >=5
order by quantity asc;

select * 
from orders
where order_date < '2020-12-08'
order by order_date desc;

-- filter: between
select *
from orders
where order_date  between '2020-12-08' and '2020-12-12'
order by order_date;

select *
from orders
where quantity between 3 and 5
order by quantity desc;

--filter: in

select *
from orders
where ship_mode in ('First class','Same day');

select distinct quantity 
from orders
where quantity in(3,5)
order by quantity desc;


-- filter: not in
select distinct ship_mode
from orders
where ship_mode not in('First class','same day'); 

-- filter based on ascii value
select distinct ship_mode
from orders
where ship_mode>'First Class';

-- filter with two columns
select order_date, ship_mode, segment
from orders
where ship_mode='First Class' and segment='Consumer';

select order_date, ship_mode, segment
from orders
where ship_mode='First Class' or segment='Consumer';

select distinct ship_mode
from orders
where ship_mode in('First Class','Same day');

select distinct ship_mode 
from orders
where ship_mode='First Class' or ship_mode='Same day';

select * 
from orders
where quantity > 5 and order_date<'2020-12-10';

select cast(order_date as date) as order_new_date , *
from orders
where cast(order_date as date)='2020-12-10';

select *, (profit/sales) as ratio, (profit * sales) as ps , getdate() as total
from orders
where order_date between '2020-11-01 12:00:00' and '2020-11-01 12:40:00'
order by order_date;

-- pattern matching like operator

select order_id, order_date, customer_name
from orders
where customer_name like 'Chris%';

select order_id, order_date, customer_name
from orders
where customer_name like '%t';

select order_id, order_date, customer_name
from orders
where customer_name like '%even%';

select order_id, order_date, customer_name
from orders
where customer_name like 'A%A';


-- case sensitive
USE "YSNAMASTESQL1"
GO
ALTER DATABASE "YSNAMASTESQL1" SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO
ALTER DATABASE "YSNAMASTESQL1" COLLATE Latin1_General_CS_AS;

USE "YSNAMASTESQL1"
ALTER DATABASE "YSNAMASTESQL1" SET MULTI_USER
GO


select Order_id, order_date, customer_name
from order_case_sensitive
where customer_name like '_l%';

-- Ankit% Bansal
select order_id, order_date, customer_name
from order_case_sensitive
where customer_name like 'Ankit%' escape'%';


select order_id, order_date, customer_name
from order_case_sensitive
where customer_name like 'C[al]%' ;

-- my first character is C but second character should not be a or l or b
select order_id, order_date, customer_name
from order_case_sensitive
where customer_name like 'C[^al]%' ;

select order_id,order_date,customer_name
from orders
where order_id like 'CA-201[1-2]%'
order by customer_name;


select * from orders;
-- write a sql to get all the orders where customers name has "a" as second character and "d" as fourth character (58 rows)
select * 
from orders
where customer_Name like '_a_d%'

-- write a sql to get all the orders placed in the month of dec 2020 (352 rows) 
select *
from orders
where order_date like '2020-12-[0-9][0-9]'

--  write a query to get all the orders where ship_mode is neither in 'Standard Class' nor in 'First Class' and ship_date is after nov 2020 (944 rows)
 select * 
 from orders
 where ship_mode not in ('Standard Class','First Class') and ship_date > '2020-11-30';

 -- write a query to get all the orders where customer name neither start with "A" and nor ends with "n" (9815 rows)
 select * 
 from orders
 where customer_name not like 'A%'
  and customer_name not like '%n';

  --  write a query to get all the orders where profit is negative (1871 rows)
  select * 
  from orders
  where profit <0;

  --  write a query to get all the orders where either quantity is less than 3 or profit is 0 (3348)
  select *
  from orders
  where quantity<3 or profit=0;

  -- your manager handles the sales for South region and he wants you to create a report of all the orders in his region where some discount is provided to the customers (815 rows)
  select * 
  from orders
  where Region='South' and discount>0;

 -- write a query to find top 5 orders with highest sales in furniture category 
 select top 5 Sales
 from orders
 where Category ='Furniture';

 --  write a query to find all the records in technology and furniture category for the orders placed in the year 2020 only (1021 rows)
  select * 
  from orders
  where Category in ('Furniture','Technology') and Order_Date like '2020-%-%';


  -- write a query to find all the orders where order date is in year 2020 but ship date is in 2021 (33 rows)
 select * 
 from orders
 where order_Date like '2020-%-%' and ship_date like '2021-%-%';