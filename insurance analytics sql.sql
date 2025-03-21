# to create database
create database Insurance_Analytics;
use Insurance_Analytics;
# to check tables are added
SHOW TABLES;
DESCRIBE  brokerage;

select * from brokerage;
select * from fees;
select * from `individual budgets`;
select * from `invoice-` ;
select * from meeting;
select *  from opportunity;
SHOW COLUMNS FROM brokerage;
SHOW COLUMNS FROM fees;
----
CREATE TABLE placed_achievement AS
SELECT client_name, Account_Executive, branch_name, solution_group, income_class, amount, income_due_date, revenue_transaction_type
FROM brokerage
UNION ALL
SELECT client_name, Account_Executive, branch_name, solution_group, income_class, amount, income_due_date, revenue_transaction_type
FROM fees;
----
drop table placed_achievement;
select * from placed_achievement;
 -----
create table commontable as select income_class, Account_Executive from placed_achievement;
drop table commontable;
select * from commontable;

----
# No of Invoice by account_executive
ALTER TABLE  `invoice-` RENAME COLUMN `Account Executive` TO `Account_EXECUTIVE`;
-----
select count(*)invoice_number, Account_EXECUTIVE , income_class from `invoice-`
GROUP BY Account_EXECUTIVE
order by invoice_number desc;
-----
# year meeting_count
SELECT DATE_FORMAT(meeting_date, '%Y') AS meeting_date , 
count(meeting_date) as meeting_count FROM meeting;
----
#no of meeting by  account_executive
ALTER TABLE  meeting RENAME COLUMN `Account Executive` TO `Account_EXECUTIVE`;
select count(meeting_date), Account_EXECUTIVE from meeting
group by Account_EXECUTIVE
order by meeting_date;
----
# oppty by revenue top 4
select opportunity_name,sum(revenue_amount) from opportunity
group by opportunity_name
order by sum(revenue_amount) desc
limit 4 ;
----
#oppty product distribution 
select count(opportunity_name),product_group from opportunity
group by product_group
order by count(opportunity_name);
---
# Stage by Revenue
select stage, sum(revenue_amount) from opportunity
group by stage
order by sum(revenue_amount) desc;
----
