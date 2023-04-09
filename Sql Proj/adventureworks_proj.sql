create database adventureworks;
use adventureworks;
select * from adventureworks_customers;

/*Renaming long Table names*/
RENAME TABLE adventureworks_customers TO Customers1,
             adventureworks_product_categories TO Prod_cat,
             adventureworks_product_subcategories TO Prod_subcat,
             adventureworks_products TO Products,
			 adventureworks_returns TO `returns`,
             adventureworks_sales_2017 TO Sales,
             adventureworks_territories TO territories;
             
/*Combining Prefix, First name, Last name*/
ALTER TABLE customers1
ADD  fullname1 varchar (50);
Update customers1 set fullname1 = CONCAT( Prefix,' ',FirstName, ' ', LastName )  ;
Select * from Customers1;

/*Converting BirthDate, orderdate to date type format*/
select * from customers1;
Update customers1
set BirthDate = str_to_Date(BirthDate,'%m/%d/%Y');

Update sales
set OrderDate = str_to_Date(OrderDate,'%m/%d/%Y');
Select * from sales;

/* Finding Order priority according to AnnualIncome*/
Alter table customers1 Modify column AnnualIncome int(100);
 SELECT Fullname1,
       CASE WHEN AnnualIncome > 90000 THEN 'Very_High'
            WHEN AnnualIncome > 10000 THEN 'High'
            WHEN AnnualIncome > 1000 THEN 'Average'
            ELSE 'Below_Avg' END AS Order_priority
  FROM customers1;
  
/* Creating trigger to store Customer key and, order num, order date 
if customer key from sales table is deleted*/
alter table customers1 add constraint primary key (CustomerKey);
Create table Deleted_Records(CustomerKey int , OrderNumber varchar (100), OrderDate date)
Insert into Deleted_Records(CustomerKey,OrderNumber,OrderDate) 
values(101, 'SO3456', '2017-01-01')

SElect * from sales
delimiter $$
CREATE TRIGGER Cust_details     
before Delete 
On sales 
for each row
BEGIN  
INSERT INTO Deleted_Records(CustomerKey,OrderNumber,OrderDate)
VALUES (old.CustomerKey,old.OrderNumber,old.OrderDate);
END$$
delete from sales
where CustomerKey = 23791;
Select * from Deleted_Records

/*Creating UDF to calculate profit*/
Alter table sales
add Column Product_price
Update product_price(INSERT INTO sales (product_price)
SELECT OrderQuantity, FROM Sales;

delimiter $$
create function Total_sales(ProductPrice int, OrderQuantity int)
returns int
deterministic 
begin
declare Total_sales int;
Set Total_sales = ProductPrice * OrderQuantity;
return Total_sales;
end$$


/*Finding out highest ordered products with SKU*/
SELECT products.ProductName, products.ProductSKU, products.ModelName, products.ProductKey,sales.OrderQuantity
FROM products
LEFT JOIN sales ON products.ProductKey = sales.ProductKey
ORDER BY sales.OrderQuantity DESC;

/*Finding unique product names*/
select Distinct ProductName, ProductSKU,
From products
/*find products starting with sku HL*/
select  ProductName,ProductSKU from products where ProductSKU like 'HL%' 


 