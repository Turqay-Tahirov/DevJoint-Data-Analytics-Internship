/*1 inner join
1: Hər bir sifarişin ID-si, onu yazan işçi və sifarişi verən müştəri kimdir?

İzah: employees, orders və customers cədvəllərini inner join ilə birləşdirərək həm işçisi,
həm də müştərisi olan sifarişləri siyahılayır.*/

select ord.OrderID as "Sifariş ID", 
(emp.FirstName || ' ' || emp.LastName) as "İşçi", 
cus.CompanyName as "Müştəri" from Employees emp 
inner join Orders ord on emp.EmployeeID = ord.EmployeeID 
inner join Customers cus on ord.CustomerID = cus.CustomerID;
