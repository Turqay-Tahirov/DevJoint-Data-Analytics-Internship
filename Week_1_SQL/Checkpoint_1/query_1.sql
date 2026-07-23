/* Checkpoint-1*/

/*Sual: Almaniyadakı ilk 5 müştəri kimlərdir? 
İzah: Bu sorğu, Almaniyada olan müştəriləri əlifba sırası ilə düzüb ilk 5 dənəsini gətirir.*/
SELECT CustomerID, CompanyName, ContactName, Country  
FROM Customers  
WHERE Country = 'Germany'
ORDER BY CompanyName ASC
LIMIT 5;

/* Sual 2: Londonda yaşayan rəhbər şəxslər (Owner və ya Manager) kimlərdi? */
/*Bu sorğu, Londonda yerləşən müştərilərimizin rəhbər işçilərini əlifba sırası ilə sıralayır. */
select ContactName, ContactTitle, City, Phone  from Customers 
where City = 'London' and (ContactTitle like '%Owner%' or ContactTitle like '%Manager%')
ORDER BY ContactName ASC;

/* Sual 3: ABŞ daxilində karqo pulu 150 dollardan çox olan ilk 10 baha sifariş hansıdı? */
/*Bu sorğu, Amerikada çatdırılma xərci ən yüksək olan 10 böyük sifarişi göstərir. */
select OrderID, ShipName, ShipCity, ShipCountry, Freight 
from Orders 
where ShipCountry = 'USA' and Freight > 150
order by Freight desc
limit 10;

/*Sual-4: Müştəriyə hələ göndərilməmiş ən təcili ilk 5 sifariş hansıdı? */
/*Bu sorğu, yola çıxmayan sifarişləri çatdırılma vaxtına görə ən təcilidən başlayaraq sıralayır. */
select OrderID, CustomerID, OrderDate, RequiredDate, ShippedDate from Orders 
where ShippedDate is null
order by RequiredDate asc
limit 5;

/* Sual 5: Fransaya göndərilən və qiyməti 1000 dollardan baha olan ilk 5 satış hansıdı? */
/*Bu sorğu, Fransa bazarında tək məhsul üzrə edilən ən böyük 5 fərdi satışı gətirir. */
select OrderID, CustomerName, ProductName, ExtendedPrice, ShipCountry from Invoices
where ShipCountry = 'France' and ExtendedPrice > 1000
order by ExtendedPrice desc
limit 5;


/*CheckPoint-2*/

/*Sual 1: Hər bir sifarişin ID-si, onu yazan işçi və sifarişi verən müştəri kimdir? (inner join)
Məntiq: İzah: employees, orders və customers cədvəllərini inner join ilə birləşdirərək həm işçisi, həm də müştərisi olan sifarişləri siyahılayır.*/
select ord.OrderID as "Sifariş ID", (emp.FirstName || ' ' || emp.LastName) as "İşçi",
cus.CompanyNamxie as "Müştəri"
from Employees emp
inner join Orders ord on emp.EmployeeID = ord.EmployeeID
inner join Customers cus on ord.CustomerID = cus.CustomerID;

/*Sual 2: S2. Bütün müştərilərin və əgər varsa, onların sifarişlərinin siyahısı hansıdır? (left join)
Məntiq: İzah: left join vasitəsilə bütün müştərilər ekrana gətirilir və hələ heç bir sifariş verməyən müştərilər də siyahıda qorunur.*/
select cus.CompanyName as "Müştəri",
ord.OrderID as "Sifariş ID",
(emp.FirstName || ' ' || emp.LastName) as "Məsul İşçi"
from Customers cus
left join Orders ord on cus.CustomerID = ord.CustomerID
left join Employees emp on ord.EmployeeID = emp.EmployeeID; /

/*Sual 3: 3 Hər bir sifarişin id-si, sifarişi yazan işçini, onun rəhbərini və müştərinin adını necə görə bilərik? (self join)
Məntiq: 'Employees' cədvəli öz-özünə qoşularaq (Self-Join) hər bir sifarişi yazan işçi ilə bərabər onun birbaşa rəhbərini də eyni sətirdə göstərir.*/
 select ord.OrderID as "Sifariş ID",
cus.CompanyName as "Müştəri Şirkət",
(emp.FirstName || ' ' || emp.LastName) as "Sifarişi Yazan İşçi",
(mgr.FirstName || ' ' || mgr.LastName) as "Onun Rəhbəri"
from Customers cus
inner join Orders ord on cus.CustomerID = ord.CustomerID
left JOIN Employees emp on ord.EmployeeID = emp.EmployeeID
left join Employees mgr on emp.ReportsTo = mgr.EmployeeID;

/*CheckPoint-3*/

