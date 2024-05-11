

use AdventureWorks2012
---- project works 1--------------------------------------------------------------------------

--a. Get all the details from the person table including email ID, phone number and phone number type
 select * from person.Person
 select * from person.EmailAddress
 select * from person.PersonPhone
 select * from person.PhoneNumberType

select P.firstname,P.lastname,E.emailaddress,PH.phonenumber,PHT.name from Person.Person P
inner join person.EmailAddress E on P.BusinessEntityID=E.BusinessEntityID
inner join person.PersonPhone PH on PH.BusinessEntityID=E.BusinessEntityID
inner join person.PhoneNumberType PHT on pht.PhoneNumberTypeID=ph.PhoneNumberTypeID
-------------------------------------------------------------------------------------------------


--b. Get the details of the sales header order made in May 2011
 select * from sales.SalesOrderHeader where OrderDate between ('2011-05-01') and ('2011-05-31')
---------------------------------------------------------------------------------------------------------

--c. Get the details of the sales details order made in the month of May2011
 select * from SAles.SalesOrderDetail sd
 inner join sales.SalesOrderHeader sh on sd.SalesOrderID = sh.SalesOrderID 
 where sh.OrderDate between ('2011-05-01') and ('2011-05-31')
-----------------------------------------------------------------------------------------------------------
 --d. Get the total sales made in May 2011
 select * from SAles.SalesOrderDetail

 select sum(sd.LineTotal) as TotalSales from sales.SalesOrderDetail sd
 inner join sales.SalesOrderHeader sh on sd.SalesOrderID = sh.SalesOrderID
 where sh.OrderDate between ('2011-05-01') and ('2011-05-31')
 ---------------------------------------------------------------------------------------

 --e. Get the total sales made in the year 2011 by month order by increasing sales

 select sum(sd.LineTotal) as TotalSales, month(OrderDate) as slaesMonth from sales.SalesOrderDetail sd
 inner join sales.SalesOrderHeader sh on sd.SalesOrderID = sh.SalesOrderID
 where year(OrderDate)=2011
 group by month(OrderDate)
 order by TotalSales
 --------------------------------------------------------------------------------------------------------
--f. Get the total sales made to the customer with FirstName='Gustavo and LastName ='Achong'
select * from person.person where firstname='gustavo'
select * from [Sales].[SalesPerson] where BusinessEntityID=291

select firstname,lastname,sum(linetotal)  totalsales from 
person.Person p
inner join sales.Customer c on
p.businessentityid=c.PersonID
inner join sales.SalesOrderHeader sh
on sh.CustomerID=c.CustomerID
inner join sales.SalesOrderDetail sd on sd.SalesOrderID=sh.SalesOrderID
where p.FirstName='gustavo' and p.LastName='achong'
group by p.BusinessEntityID,p.FirstName,p.LastName

-----------------------------thanks you----------------------------------------