/*3 self-join
Hər bir sifarişin id-si, sifarişi yazan işçini, onun rəhbərini və müştərinin adını necə görə bilərik?
'Employees' cədvəli öz-özünə qoşularaq (Self-Join) hər bir sifarişi yazan işçi
ilə bərabər onun birbaşa rəhbərini də eyni sətirdə göstərir.*/


select ord.OrderID as "Sifariş ID", 
  cus.CompanyName as "Müştəri Şirkət", 
  (emp.FirstName || ' ' || emp.LastName) as "Sifarişi Yazan İşçi", 
  (mgr.FirstName || ' ' || mgr.LastName) as "Onun Rəhbəri" 
  from Customers cus 
  
  inner join Orders ord on cus.CustomerID = ord.CustomerID 
  left JOIN Employees emp on ord.EmployeeID = emp.EmployeeID 
  left join Employees mgr on emp.ReportsTo = mgr.EmployeeID;
