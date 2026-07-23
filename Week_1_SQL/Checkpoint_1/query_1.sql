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

/*Sual 1: Sistemdə 10-dan çox sifarişi olan top müştərilər hansılardır?
Məntiq: Müştəriləri qruplaşdıraraq sifarişlərini sayır və yalnız 10-dan çox sifariş verən aktiv şirkətləri çoxdan aza doğru sıralayır.*/
SELECT 
 cus.CompanyName AS "Müştəri Şirkət Adı",
 COUNT(ord.OrderID) AS "Ümumi Sifariş Sayı"
FROM Customers cus
INNER JOIN Orders ord ON cus.CustomerID = ord.CustomerID
GROUP BY cus.CompanyName
HAVING COUNT(ord.OrderID) > 10
ORDER BY COUNT(ord.OrderID) DESC;


/*Sual 2: 50-dən çox sifariş göndərilən ən populyar ölkələr hansılardır?
Məntiq: Orders cədvəlini ölkələrə görə qruplaşdırır və heç bir JOIN istifadə etmədən cəmi 50-dən çox sifariş alan ölkələri tapır.*/
SELECT 
 ShipCountry AS "Ölkə",
 COUNT(OrderID) AS "Sifariş Sayı"
FROM Orders
GROUP BY ShipCountry
HAVING COUNT(OrderID) > 50
ORDER BY COUNT(OrderID) DESC;


/*Sual 3: Ortalama məhsul qiyməti 30 dollardan baha olan kateqoriyalar hansılardır?
Məntiq: Məhsulları kateqoriyalarına görə qruplaşdıraraq hər qrupun ortalama qiymətini tapır və yalnız 30 dollarlıq həddi keçən bahalı kateqoriyaları listələyir.*/
SELECT 
 CategoryID AS "Kateqoriya ID",
 AVG(UnitPrice) AS "Ortalama Qiymət",
 COUNT(ProductID) AS "Məhsul Sayı"
FROM Products
GROUP BY CategoryID
HAVING AVG(UnitPrice) > 30
ORDER BY AVG(UnitPrice) DESC;



/*Checkpoint-4*/

/*Sual 1: Şirkətdəki ən yaşlı işçinin məlumatlarını necə tapa bilərik? (Subquery)
Məntiq: Alt sorğu ilə bazadakı ən köhnə doğum tarixini tapır və əsas sorğuda həmin tarixə uyğun gələn işçini filtrləyir.*/
SELECT EmployeeID, FirstName, LastName, Title, BirthDate
FROM Employees
WHERE BirthDate = (
    SELECT MIN(BirthDate) 
    FROM Employees
);

/*Sual 2: Parisdən daha çox müştəriyə sahib olan şəhərlər hansılardır? (Subquery)
Məntiq: HAVING daxilindəki alt sorğu ilə Parisin müştəri sayını hesablayır və bu saydan yuxarı olan digər şəhərləri tapır.*/
SELECT City, COUNT(CustomerID) AS CustomerCount
FROM Customers
GROUP BY City
HAVING COUNT(CustomerID) > (
    SELECT COUNT(*) 
    FROM Customers 
    WHERE City = 'Paris'
)
ORDER BY CustomerCount DESC;


/*Sual 3: Ümumi ortalama qiymətdən daha baha olan məhsullar hansılardır? (CTE - WITH)
Məntiq: WITH bloku (CTE) vasitəsilə əvvəlcə bütün məhsulların ortalama qiymətini hesablayır, sonra isə əsas sorğuda bu ortalamanı keçən məhsulları filtrləyir.*/
WITH AvgPriceCTE AS (
    SELECT AVG(UnitPrice) AS AvgPrice 
    FROM Products
)
SELECT p.ProductID, p.ProductName, p.UnitPrice, p.UnitsInStock
FROM Products p, AvgPriceCTE a
WHERE p.UnitPrice > a.AvgPrice
ORDER BY p.UnitPrice DESC;



/*Checkpoint-5*/

/*Sual 1: Hər kateqoriya daxilində məhsulları qiymətinə görə necə nömrələyə və sıralaya bilərik?
Məntiq: ROW_NUMBER ilə hər kateqoriya daxilində sətirləri unikal nömrələyir, RANK ilə isə eyni qiymətə malik məhsullara eyni dərəcəni verərək sıralayır.*/
SELECT 
    CategoryID, 
    ProductName, 
    UnitPrice,
    ROW_NUMBER() OVER (PARTITION BY CategoryID ORDER BY UnitPrice DESC) AS UorunNo,
    RANK() OVER (PARTITION BY CategoryID ORDER BY UnitPrice DESC) AS QiymetSirasi
FROM Products;


/*Sual 2: Hər bir müştərinin tarixlər üzrə artan templə (Running Total) cəmi nə qədər karqo pulu ödədiyini necə görə bilərik?
Məntiq: SUM() OVER funksiyasından istifadə edərək, hər müştərinin sifariş tarixləri ardıcıllığı ilə etdiyi karqo xərclərini üst-üstə toplayaraq kumulyativ cəm yaradır.*/

SELECT 
    CustomerID, 
    OrderID, 
    OrderDate, 
    Freight,
    SUM(Freight) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS KumulyativYukPulu
FROM Orders;


/*Checkpoint-6*/

/*Problem (Köhnə Variant): Cədvəldə milyonlarla sətir olduqda, mötərizənin daxilindəki alt sorğu hər bir sətir üçün təkrar-təkrar (milyonlarla dəfə) işləyir və bazanı tamamilə dondurur.
Həll (Yeni Variant): INNER JOIN və GROUP BY strukturundan istifadə edərək iki cədvəl bir-birinə bağlanmışdır. Bu zaman verilənlər bazası məlumatları cəmi 1 dəfəyə oxuyur və ümumi məbləği dərhal hesablayır.
❌ Köhnə (Ağır və Performansı Aşağı) Variant:*/
SELECT o.OrderID, o.CustomerID,
       (SELECT SUM(od.UnitPrice * od.Quantity) 
        FROM [Order Details] od 
        WHERE od.OrderID = o.OrderID) AS TotalAmount
FROM Orders o;


/*Yeni (Optimallaşdırılmış və Sürətli) Variant:*/
SELECT o.OrderID, o.CustomerID, SUM(od.UnitPrice * od.Quantity) AS TotalAmount
FROM Orders o
INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY o.OrderID, o.CustomerID;


/*2. İndeksləmə (Index) ilə Axtarışın Sürətləndirilməsi
Problem: Cədvəldə ölkə və ya şəhərə görə filtrasiya apararkən, SQL lazımi məlumatı tapmaq üçün milyonlarla sətri tək-tək oxumaq (Full Table Scan) məcburiyyətində qalırdı.
Həll: ShipCountry və ShipCity sütunları üzərində kompozit indeks yaradılmışdır. Bu indeks kitabın sonundakı mündəricat kimi işləyərək, SQL-in axtarılan ölkə və şəhəri bütün cədvəli gəzmədən, nöqtə atışı ilə saniyələr daxilində tapmasını təmin edir.
🛠️ İndeksin Yaradılması Kodu:*/
CREATE INDEX idx_orders_ship_country_city 
ON Orders (ShipCountry, ShipCity);
