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

