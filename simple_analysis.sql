use sales_date;
select * from book2;
select count(*) branch from book2; 
-- count all the details in the branch column and in this case we have 241 orders
select sum(value) from book2 ;
-- this calculate the total sum values, which is 13207567.54999999
select count(distinct branch) from book2;
-- counts total number of branches for the date in this case its 109
select 
customer,
count(distinct branch) as outlets
from book2
group by customer
order by outlets desc;
-- counts total number of branches per chain
select 
count(distinct customer) as chains
from book2;
-- Check on total number of chains -- we have 10
-- there as per the below code
select 
distinct customer
from book2;

-- simple view to check on performance per chain..
create view order_summary as
select 
customer,
count(distinct `invoice no`),
count(distinct branch) as No_of_branches,
sum(value) as value,
avg(value) as average_per_chain
from book2
group by customer
order by value desc;
select *from order_summary;

-- simple stored procedure to check on the chain performance

delimiter &&
create procedure check_chain_performance(
customer text)
begin
select *
from book2 b
where b.customer = customer;
end &&
delimiter ;












