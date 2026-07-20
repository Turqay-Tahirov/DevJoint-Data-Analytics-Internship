/*1 inner join*/ 

select ord.OrderID as "Sifariş ID", 
(emp.FirstName || ' ' || emp.LastName) as "İşçi", 
cus.CompanyName as "Müştəri" from Employees emp 
inner join Orders ord on emp.EmployeeID = ord.EmployeeID 
inner join Customers cus on ord.CustomerID = cus.CustomerID;
