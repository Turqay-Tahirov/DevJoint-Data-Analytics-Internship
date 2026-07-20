# 📊 DevJoint Data Analytics Internship Program

Bu repozitoriya, **DevJoint** tərəfindən təşkil olunmuş 4 həftəlik Data Analitika təcrübə proqramı çərçivəsində hazırladığım bütün tapşırıqları, SQL sorğularını, data analizlərini və hesabatlarımı özündə birləşdirir.

---

### 🗄️ İstifadə Olunan Verilənlər Bazası (Database)
Bu layihədəki sorğular GitHub-a əlavə edilmiş **Northwind** verilənlər bazası üzərində qurulmuşdur: 
*   **Baza faylı:** [`northwind_database.sql`](northwind.db)
---

## 📁 Layihə Quruluşu (Project Structure)

Layihə həftəlik tapşırıqlara uyğun olaraq aşağıdakı şəkildə strukturlaşdırılıb:

*   **`Week_1_SQL_Basics_to_Advanced/`** – SQL sorğuları (Əsas və JOIN-lar).
*   **`Week_2_Excel_Google_Sheets_Analysis/`** – Excel analitikası və Dashboard (Tezliklə).
*   **`Week_3_BI_Dashboard/`** – Power BI / Tableau vizuallaşdırma (Tezliklə).
*   **`Week_4_Business_Case_Analysis/`** – Biznes Keys analizi və hesabat (Tezliklə).
---

## 🔑 Week 1: SQL Əsaslardan Qabaqcıl Səviyyəyə

Bu həftə ərzində "Northwind" verilənlər bazası üzərində fərqli çətinlik dərəcəsinə malik SQL sorğuları yazılmışdır.

### 📌 Checkpoint 1: Əsas SELECT / WHERE / ORDER BY / LIMIT

Bu mərhələdə verilmiş şərtlərə uyğun olaraq məlumatların süzgəclənməsi (filtering) və sıralanması (sorting) həyata keçirilmişdir.
#### 🔍 Sorğular və İzahları:

1. **Sual 1: Almaniyadakı ilk 5 müştəri kimlərdir?**
   * **Kod faylı:** [`query_1.sql`](./Week_1_SQL/Checkpoint_1/query_1.sql)
   *  ```sql
        SELECT CustomerID, CompanyName, ContactName, Country  
        FROM Customers  
        WHERE Country = 'Germany'
        ORDER BY CompanyName ASC
        LIMIT 5;
        ```
   * **Məntiq:** Almaniyada olan müştəriləri əlifba sırası ilə sıralayıb ilk 5 nəticəni gətirir.
     ![Query 1 Result](/images/query_1.png)

2. **Sual 2: Londonda yaşayan rəhbər şəxslər (Owner və ya Manager) kimlərdir?**
   * **Kod faylı:** [`query_2.sql`](./Week_1_SQL/Checkpoint_1/query_2.sql)
   *  ```sql
        SELECT 
            o.OrderID, 
            e.FirstName || ' ' || e.LastName AS "İşçi", 
            c.CompanyName AS "Müştəri"
        FROM Orders o
        INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID
        INNER JOIN Customers c ON o.CustomerID = c.CustomerID;
        ```
   * **Məntiq:** Londonda yaşayan və vəzifə adında "Owner" və ya "Manager" olan kontaktları tapır.
     ![Query 2 Result](/images/query_2.png)

3. **Sual 3: ABŞ daxilində karqo pulu 150$-dan çox olan ilk 10 baha sifariş hansıdır?**
   * **Kod faylı:** [`query_3.sql`](./Week_1_SQL/Checkpoint_1/query_3.sql)
   *  ```sql
        SELECT 
            o.OrderID, 
            e.FirstName || ' ' || e.LastName AS "İşçi", 
            c.CompanyName AS "Müştəri"
        FROM Orders o
        INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID
        INNER JOIN Customers c ON o.CustomerID = c.CustomerID;
        ```
   * **Məntiq:** Amerikaya göndərilən və çatdırılma xərci ən yüksək olan 10 böyük sifarişi azalan sıra ilə göstərir.
     ![Query 3 Result](/images/query_3.png)

4. **Sual 4: Müştəriyə hələ göndərilməmiş ən təcili ilk 5 sifariş hansıdır?**
   * **Kod faylı:** [`query_4.sql`](./Week_1_SQL/Checkpoint_1/query_4.sql)
   *  ```sql
        SELECT 
            o.OrderID, 
            e.FirstName || ' ' || e.LastName AS "İşçi", 
            c.CompanyName AS "Müştəri"
        FROM Orders o
        INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID
        INNER JOIN Customers c ON o.CustomerID = c.CustomerID;
        ```
   * **Məntiq:** Göndərilmə tarixi (ShippedDate) boş olan sifarişləri tələb olunan çatdırılma tarixinə (RequiredDate) görə artan sıra ilə düzür.
     ![Query 4 Result](/images/query_4.png)

5. **Sual 5: Fransaya göndərilən və dəyəri 1000$-dan baha olan ilk 5 satış hansıdır?**
   * **Kod faylı:** [`query_5.sql`](./Week_1_SQL/Checkpoint_1/query_5.sql)
   *  ```sql
        SELECT 
            o.OrderID, 
            e.FirstName || ' ' || e.LastName AS "İşçi", 
            c.CompanyName AS "Müştəri"
        FROM Orders o
        INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID
        INNER JOIN Customers c ON o.CustomerID = c.CustomerID;
        ```
   * **Məntiq:** Fransaya gedən və tək məhsul satışı üzrə faktura dəyəri 1000 dollardan yüksək olan ən böyük 5 fərdi satışı gətirir.
     ![Query 5 Result](/images/query_5.png)


### 🔹 Checkpoint 2: JOIN əməliyyatları ilə Cədvəllərin Birləşdirilməsi
Bu mərhələdə fərqli cədvəllərdə saxlanılan əlaqəli məlumatları biznes tələblərinə uyğun olaraq `INNER JOIN` vasitəsilə birləşdirib tək bir hesabat halına gətirilmişdir.

#### 🔍 Sorğular, Biznes Məntiqi və Kodlar:

*   **Sual 1: Hər bir sifarişin hansı işçi tərəfindən hansı müştəriyə satıldığını necə görə bilərik?**
    *   **Məntiq:** `Orders` cədvəlini həm `Employees`, həm də `Customers` cədvəli ilə birləşdirərək satış prosesinin bütün tərəflərini bir yerdə göstərir.
    *   **SQL Kodu (`query_1.sql`):**
        ```sql
        SELECT 
            o.OrderID, 
            e.FirstName || ' ' || e.LastName AS "İşçi", 
            c.CompanyName AS "Müştəri"
        FROM Orders o
        INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID
        INNER JOIN Customers c ON o.CustomerID = c.CustomerID;
        ```

*   **Sual 2: Satılan hər bir məhsulun adını, aid olduğu kateqoriyanı və satış qiymətini necə siyahılaya bilərik?**
    *   **Məntiq:** `Products` cədvəlini `Categories` ilə birləşdirərək hər bir məhsulun vizual kateqoriya adını onun qiyməti ilə yanaşı gətirir.
    *   **SQL Kodu (`query_2.sql`):**
        ```sql
        SELECT 
            p.ProductName AS "Məhsul Adı", 
            c.CategoryName AS "Kateqoriya", 
            p.UnitPrice AS "Qiymət"
        FROM Products p
        INNER JOIN Categories c ON p.CategoryID = c.CategoryID;
        ```

---

### 🔹 Checkpoint 3: GROUP BY / HAVING ilə Aqreqasiya
Bu mərhələdə datadakı kateqoriyalar üzrə qruplaşdırma (`GROUP BY`) aparılmış və aqreqasiya nəticələrinə xüsusi şərtlər (`HAVING`) tətbiq edilmişdir.

#### 🔍 Sorğular, Biznes Məntiqi və Kodlar:

*   **Sual 1: Sistemdə 10-dan çox sifarişi olan top müştərilər hansılardır?**
    *   **Məntiq:** Müştəriləri qruplaşdıraraq sifarişlərini sayır və yalnız 10-dan çox sifariş verən aktiv şirkətləri çoxdan aza doğru sıralayır.
    *   **SQL Kodu (`query_1.sql`):**
        ```sql
        SELECT 
            cus.CompanyName AS "Müştəri Şirkət Adı",
            COUNT(ord.OrderID) AS "Ümumi Sifariş Sayı"
        FROM Customers cus
        INNER JOIN Orders ord ON cus.CustomerID = ord.CustomerID
        GROUP BY cus.CompanyName
        HAVING COUNT(ord.OrderID) > 10
        ORDER BY COUNT(ord.OrderID) DESC;
        ```

*   **Sual 2: 50-dən çox sifariş göndərilən ən populyar ölkələr hansılardır?**
    *   **Məntiq:** `Orders` cədvəlini ölkələrə görə qruplaşdırır və heç bir JOIN istifadə etmədən cəmi 50-dən çox sifariş alan ölkələri tapır.
    *   **SQL Kodu (`query_2.sql`):**
        ```sql
        SELECT 
            ShipCountry AS "Ölkə",
            COUNT(OrderID) AS "Sifariş Sayı"
        FROM Orders
        GROUP BY ShipCountry
        HAVING COUNT(OrderID) > 50
        ORDER BY COUNT(OrderID) DESC;
        ```

*   **Sual 3: Ortalama məhsul qiyməti 30 dollardan baha olan kateqoriyalar hansılardır?**
    *   **Məntiq:** Məhsulları kateqoriyalarına görə qruplaşdıraraq hər qrupun ortalama qiymətini tapır və yalnız 30 dollarlıq həddi keçən bahalı kateqoriyaları listələyir.
    *   **SQL Kodu (`query_3.sql`):**
        ```sql
        SELECT 
            CategoryID AS "Kateqoriya ID",
            AVG(UnitPrice) AS "Ortalama Qiymət",
            COUNT(ProductID) AS "Məhsul Sayı"
        FROM Products
        GROUP BY CategoryID
        HAVING AVG(UnitPrice) > 30
        ORDER BY AVG(UnitPrice) DESC;
        ```

---

### 🔹 Checkpoint 4: Çoxaddımlı Məntiq (Subquery və CTE)
Bu mərhələdə mürəkkəb biznes məntiqlərini həll etmək üçün həm alt sorğulardan (Subquery), həm də strukturlu müvəqqəti cədvəllərdən (`WITH` - CTE) istifadə edilmişdir.

#### 🔍 Sorğular, Biznes Məntiqi və Kodlar:

*   **Sual 1: Şirkətdəki ən yaşlı işçinin məlumatlarını necə tapa bilərik? (Subquery)**
    *   **Məntiq:** Alt sorğu ilə bazadakı ən köhnə doğum tarixini tapır və əsas sorğuda həmin tarixə uyğun gələn işçini filtrləyir.
    *   **SQL Kodu (`query_1.sql`):**
        ```sql
        SELECT EmployeeID, FirstName, LastName, Title, BirthDate
        FROM Employees
        WHERE BirthDate = (
            SELECT MIN(BirthDate) 
            FROM Employees
        );
        ```

*   **Sual 2: Parisdən daha çox müştəriyə sahib olan şəhərlər hansılardır? (Subquery)**
    *   **Məntiq:** `HAVING` daxilindəki alt sorğu ilə Parisin müştəri sayını hesablayır və bu saydan yuxarı olan digər şəhərləri tapır.
    *   **SQL Kodu (`query_2.sql`):**
        ```sql
        SELECT City, COUNT(CustomerID) AS CustomerCount
        FROM Customers
        GROUP BY City
        HAVING COUNT(CustomerID) > (
            SELECT COUNT(*) 
            FROM Customers 
            WHERE City = 'Paris'
        )
        ORDER BY CustomerCount DESC;
        ```

*   **Sual 3: Ümumi ortalama qiymətdən daha baha olan məhsullar hansılardır? (CTE - WITH)**
    *   **Məntiq:** `WITH` bloku (CTE) vasitəsilə əvvəlcə bütün məhsulların ortalama qiymətini hesablayır, sonra isə əsas sorğuda bu ortalamanı keçən məhsulları filtrləyir.
    *   **SQL Kodu (`query_3.sql`):**
        ```sql
        WITH AvgPriceCTE AS (
            SELECT AVG(UnitPrice) AS AvgPrice 
            FROM Products
        )
        SELECT p.ProductID, p.ProductName, p.UnitPrice, p.UnitsInStock
        FROM Products p, AvgPriceCTE a
        WHERE p.UnitPrice > a.AvgPrice
        ORDER BY p.UnitPrice DESC;
        ```

---

### 🔹 Checkpoint 5: Window Funksiyaları
Bu mərhələdə verilənlər bazasındakı sətirləri qruplaşdırmadan, hər sətir üzrə analitik hesabatlar aparmaq üçün `ROW_NUMBER`, `RANK` və running total (`SUM() OVER`) funksiyalarından istifadə edilmişdir.

#### 🔍 Sorğular, Biznes Məntiqi və Kodlar:

*   **Sual 1: Hər kateqoriya daxilində məhsulları qiymətinə görə necə nömrələyə və sıralaya bilərik?**
    *   **Məntiq:** `ROW_NUMBER` ilə hər kateqoriya daxilində sətirləri unikal nömrələyir, `RANK` ilə isə eyni qiymətə malik məhsullara eyni dərəcəni verərək sıralayır.
    *   **SQL Kodu (`query_1.sql`):**
        ```sql
        SELECT 
            CategoryID, 
            ProductName, 
            UnitPrice,
            ROW_NUMBER() OVER (PARTITION BY CategoryID ORDER BY UnitPrice DESC) AS UorunNo,
            RANK() OVER (PARTITION BY CategoryID ORDER BY UnitPrice DESC) AS QiymetSirasi
        FROM Products;
        ```

*   **Sual 2: Hər bir müştərinin tarixlər üzrə artan templə (Running Total) cəmi nə qədər karqo pulu ödədiyini necə görə bilərik?**
    *   **Məntiq:** `SUM() OVER` funksiyasından istifadə edərək, hər müştərinin sifariş tarixləri ardıcıllığı ilə etdiyi karqo xərclərini üst-üstə toplayaraq kumulyativ cəm yaradır.
    *   **SQL Kodu (`query_2.sql`):**
        ```sql
        SELECT 
            CustomerID, 
            OrderID, 
            OrderDate, 
            Freight,
            SUM(Freight) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS KumulyativYukPulu
        FROM Orders;
        ```
