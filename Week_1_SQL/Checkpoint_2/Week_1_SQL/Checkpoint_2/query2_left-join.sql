/*2 left join
2. Bütün müştərilərin və əgər varsa, onların sifarişlərinin siyahısı hansıdır?
İzah: left join vasitəsilə bütün müştərilər ekrana gətirilir və hələ heç bir sifariş
verməyən müştərilər də siyahıda qorunur.*/

select cus.CompanyName as "Müştəri", 
  ord.OrderID as "Sifariş ID",
  (emp.FirstName || ' ' || emp.LastName) as "Məsul İşçi" 
  from Customers cus 
  left join Orders ord on cus.CustomerID = ord.CustomerID 
  left join Employees emp on ord.EmployeeID = emp.EmployeeID; 
