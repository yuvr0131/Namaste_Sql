use YSNAMASTESQL1
go

/*  SQL Joins */
select * from returns;

select o.Order_Id,o.Order_Date, r.Return_Reason
from Order_Superstore o
right join returns r
on o.Order_Id=r.Order_Id;


select r.Return_Reason, sum(Sales) as Total_Sales
from Order_Superstore o
inner join returns r
on o.Order_Id=r.Order_Id
group by r.Return_Reason;

create table employee(
    emp_id int,
    emp_name varchar(20),
    dept_id int,
    salary int,
    manager_id int,
    emp_age int
);


insert into employee values(1,'Ankit',100,10000,4,39);
insert into employee values(2,'Mohit',100,15000,5,48);
insert into employee values(3,'Vikas',100,10000,4,37);
insert into employee values(4,'Rohit',100,5000,2,16);
insert into employee values(5,'Mudit',200,12000,6,55);
insert into employee values(6,'Agam',200,12000,2,14);
insert into employee values(7,'Sanjay',200,9000,2,13);
insert into employee values(8,'Ashish',200,5000,2,12);
insert into employee values(9,'Mukesh',300,6000,6,51);
insert into employee values(10,'Rakesh',500,7000,6,50);
select * from employee;

create table dept(
    dept_id int,
    dep_name varchar(20)
);

insert into dept values(100,'Analytics');
insert into dept values(200,'IT');
insert into dept values(300,'HR');
insert into dept values(400,'Text Analytics');
select * from dept;
select * from employee cross join dept;
select * from returns;
-- Assignment of session 5
-- 1- write a query to get region wise count of return orders
 select region,count(r.Order_ID) as count from returns r inner join Order_Superstore o on r.Order_Id=o.Order_Id 
 group by region;

 --  2- write a query to get category wise sales of orders that were not returned
SELECT
    o.Category,
    SUM(o.Sales) AS Total_Sales
FROM Superstore_orders o
LEFT JOIN returns r
    ON o.Order_ID = r.Order_Id
    WHERE r.Order_Id IS NULL   -- keep only orders with no matching return
GROUP BY o.Category
ORDER BY Total_Sales DESC;

 -- 3- write a query to print dep name and average salary of employees in that dep .
  select d.dep_name, avg(e.Salary) as avg_salary
  from dept d
  inner join employee e
  on d.dept_id=e.dept_id
  group by d.dep_name;

  -- 4- write a query to print dep names where none of the employees have same salary.
    select d.dep_name
 from dept d
  left join 
 employee e
 on d.dept_id=e.dept_id
 group by d.dep_name
 having count(e.emp_id)=count(distinct e.salary);

-- 5. write a query to print sub categories where we have all 3 kinds of returns (others,bad quality,wrong items)
      Select o.Sub_Category
      from Order_Superstore o
      inner join 
      returns r
      on o.Order_Id = r.Order_Id
      group by o.Sub_Category
      having count(distinct r.Return_Reason) =3;
-- 6.  write a query to find cities where not even a single order was returned.
    Select o.City
    from
    Order_Superstore o
    left join
    returns r
    on o.Order_ID=r.Order_Id
    group by o.City
    having count(r.Return_Reason)=0;

-- 7.write a query to find top 3 subcategories by sales of returned orders in east region?
 Select top 3 o.Sub_Category,sum(o.Sales) as Total_Sales
 from Order_Superstore o
 inner join
 returns r
 on o.Order_Id=r.Order_Id
 where o.Region='east'
 group by o.Sub_Category
 Order by sum(Sales) desc ;

 -- 8.write a query to print dep name for which there is no employee
 select d.dep_name
 from dept d
 left join
 employee e
 on d.dept_id=e.dept_id
 group by d.dep_name
 having count(e.emp_id)=0;

--9.write a query to print employees name for dep id is not avaiable in dept table?
select e.emp_name
from employee e
left join
dept d
on e.dept_id=d.dept_id
where d.dept_id is null;



