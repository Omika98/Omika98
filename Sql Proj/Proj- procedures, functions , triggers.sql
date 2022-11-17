Use sales1;

Delimiter &&
Create procedure Highest_sales()
Begin
select product_name, sum(sales) from sales1 
Group by product_name
order by sum(sales) Desc
Limit 3;
End &&
call Highest_sales

Delimiter &&
Create procedure cat_sales( in abc varchar(10))
Begin 
select avg(sales) from sales1 where category = abc;
End &&
call cat_sales ('Office supplies')

Delimiter $$
create function SP( sales int, profit decimal (10, 4) , discount decimal (10,4), quantity int)
returns int
Deterministic
Begin
Declare a int;
set a = (Sales +profit - discount) * quantity;
Return a ;
end $$
select Category, sub_category, Product_name, SP(sales, profit,discount,quantity) from sales1 ;

/* Create function for -
1  - 100 - super affordable product 
100-300 - affordable 
300 - 600 - moderate price 
600 + - expensive */
DELIMITER &&
create function sales2(sales int ) 
returns varchar(30)
DETERMINISTIC
begin 
declare year_sales varchar(30); 
if sales  <= 100  then 
	set year_sales = "super affordable product" ;
elseif sales > 100 and sales < 300 then 
	set year_sales = "affordable" ;
elseif sales >300 and sales < 600 then 
	set year_sales = "moderate price" ;
else 
	set year_sales = "expensive" ;
end if ;
return year_sales;
end &&
select sales , sales2(sales ) from sales1 ; 

/*Creating trigger for flashing a message if DOB is Null .*/
Create table customers1(
Id int auto_increment primary key,
`name` varchar(40) not null,
Email varchar (40) not null, Birthdate date);

Create table message
(id int auto_increment primary key,
 msg varchar(300) not null);
 
delimiter //
create trigger check_null_DOB
after insert on
customers1 for each row
begin
If new.birthdate is null then
insert into message ( Msg)
values('Hi_please_update_your_DOB');
end if;
end //
insert into customers1(`name` ,Email, Birthdate)
Values("Sam","sam@abc.com",null),
("Ronald","Ronald@abc.com",'1998-11-16'),
("Omika", "Omika@xyz.com",null),
("Krish","Krish@dfg.com", '1997-08-21');
Select * from message


/*case for -
Creating mentor name*/
select * ,
case 
	when course_name = 'fsda'  Or 'fsds' or'mern' or 'java' then 'Shudhanshu'
    when course_name = "Big data" Or 'cybersecurity' or 'blockchain' then "Krish Naik"
    else "Anand Jha"
end as Mentor
from course1




