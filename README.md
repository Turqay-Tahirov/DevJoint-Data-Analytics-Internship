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
   *  ```sql
        SELECT CustomerID, CompanyName, ContactName, Country  
        FROM Customers  
        WHERE Country = 'Germany'
        ORDER BY CompanyName ASC
        LIMIT 5;
        ```
   * **Məntiq:** Almaniyada olan müştəriləri əlifba sırası ilə sıralayıb ilk 5 nəticəni gətirir.
2. **Sual 2: Londonda yaşayan rəhbər şəxslər (Owner və ya Manager) kimlərdir?**
   *  ```sql
        select ContactName, ContactTitle, City, Phone  from Customers 
        where City = 'London' and (ContactTitle like '%Owner%' or ContactTitle like '%Manager%')
        ORDER BY ContactName ASC;
        ```
   * **Məntiq:** Londonda yaşayan və vəzifə adında "Owner" və ya "Manager" olan kontaktları tapır.

3. **Sual 3: ABŞ daxilində karqo pulu 150$-dan çox olan ilk 10 baha sifariş hansıdır?**
   *  ```sql
        select OrderID, ShipName, ShipCity, ShipCountry, Freight 
        from Orders 
        where ShipCountry = 'USA' and Freight > 150
        order by Freight desc
        limit 10;
        ```
   * **Məntiq:** Amerikaya göndərilən və çatdırılma xərci ən yüksək olan 10 böyük sifarişi azalan sıra ilə göstərir.

4. **Sual 4: Müştəriyə hələ göndərilməmiş ən təcili ilk 5 sifariş hansıdır?**
   *  ```sql
        select OrderID, CustomerID, OrderDate, RequiredDate, ShippedDate
        from Orders 
        where ShippedDate is null
        order by RequiredDate asc
        limit 5;
        ```
   * **Məntiq:** Göndərilmə tarixi (ShippedDate) boş olan sifarişləri tələb olunan çatdırılma tarixinə (RequiredDate) görə artan sıra ilə düzür.

5. **Sual 5: Fransaya göndərilən və dəyəri 1000$-dan baha olan ilk 5 satış hansıdır?**
   *  ```sql
        select OrderID, CustomerName, ProductName, ExtendedPrice, ShipCountry
        from Invoices
        where ShipCountry = 'France' and ExtendedPrice > 1000
        order by ExtendedPrice desc
        limit 5;
        ```
      
   * **Məntiq:** Fransaya gedən və tək məhsul satışı üzrə faktura dəyəri 1000 dollardan yüksək olan ən böyük 5 fərdi satışı gətirir.


### 🔹 Checkpoint 2: JOIN əməliyyatları ilə Cədvəllərin Birləşdirilməsi

*   **Sual 1: Hər bir sifarişin ID-si, onu yazan işçi və sifarişi verən müştəri kimdir? (inner join)**
    *   **Məntiq:** İzah: employees, orders və customers cədvəllərini inner join ilə birləşdirərək həm işçisi,
 həm də müştərisi olan sifarişləri siyahılayır.
        ```sql
        select ord.OrderID as "Sifariş ID", (emp.FirstName || ' ' || emp.LastName) as "İşçi",
        cus.CompanyNamxie as "Müştəri"
        from Employees emp
        inner join Orders ord on emp.EmployeeID = ord.EmployeeID
        inner join Customers cus on ord.CustomerID = cus.CustomerID;
        ```

*   **Sual 2: S2. Bütün müştərilərin və əgər varsa, onların sifarişlərinin siyahısı hansıdır? (left join)**
    *   **Məntiq:** İzah: left join vasitəsilə bütün müştərilər ekrana gətirilir və hələ heç bir sifariş
 verməyən müştərilər də siyahıda qorunur.
        ```sql
        select cus.CompanyName as "Müştəri",
        ord.OrderID as "Sifariş ID",
        (emp.FirstName || ' ' || emp.LastName) as "Məsul İşçi"
        from Customers cus
        left join Orders ord on cus.CustomerID = ord.CustomerID
        left join Employees emp on ord.EmployeeID = emp.EmployeeID; /
        ```


        *   **Sual 3: 3 Hər bir sifarişin id-si, sifarişi yazan işçini, onun rəhbərini və müştərinin adını necə görə bilərik? (self join)**
    *   **Məntiq:**  'Employees' cədvəli öz-özünə qoşularaq (Self-Join) hər bir sifarişi yazan işçi
 ilə bərabər onun birbaşa rəhbərini də eyni sətirdə göstərir.
        ```sql
         select ord.OrderID as "Sifariş ID",
        cus.CompanyName as "Müştəri Şirkət",
        (emp.FirstName || ' ' || emp.LastName) as "Sifarişi Yazan İşçi",
        (mgr.FirstName || ' ' || mgr.LastName) as "Onun Rəhbəri"
        from Customers cus
        inner join Orders ord on cus.CustomerID = ord.CustomerID
        left JOIN Employees emp on ord.EmployeeID = emp.EmployeeID
        left join Employees mgr on emp.ReportsTo = mgr.EmployeeID;
        ```

---

### 🔹 Checkpoint 3: GROUP BY / HAVING ilə Aqreqasiya
Bu mərhələdə datadakı kateqoriyalar üzrə qruplaşdırma (`GROUP BY`) aparılmış və aqreqasiya nəticələrinə xüsusi şərtlər (`HAVING`) tətbiq edilmişdir.

#### 🔍 Sorğular, Biznes Məntiqi və Kodlar:

*   **Sual 1: Sistemdə 10-dan çox sifarişi olan top müştərilər hansılardır?**
    *   **Məntiq:** Müştəriləri qruplaşdıraraq sifarişlərini sayır və yalnız 10-dan çox sifariş verən aktiv şirkətləri çoxdan aza doğru sıralayır.
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
        ```sql
        SELECT 
            CustomerID, 
            OrderID, 
            OrderDate, 
            Freight,
            SUM(Freight) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS KumulyativYukPulu
        FROM Orders;
        ```

        ### 🔹 Checkpoint 6: Sorğu Optimallaşdırılması (Query Optimization)
Bu mərhələdə sorğuların icra sürətini artırmaq və verilənlər bazasının resurslarından səmərəli istifadə etmək üçün indeksləmə və kodun yenidən strukturlaşdırılması üsulları tətbiq edilmişdir.

## ⚡ SQL Query Optimization (Sorğu Optimallaşdırılması)

Bu bölmədə verilənlər bazasının performansını artırmaq, resurslardan səmərəli istifadə etmək və sorğuların icra sürətini maksimuma çatdırmaq üçün tətbiq olunan optimallaşdırma üsulları göstərilmişdir.

---

### 1. Correlated Subquery-nin `INNER JOIN` ilə Əvəzlənməsi

* **Problem (Köhnə Variant):** Cədvəldə milyonlarla sətir olduqda, mötərizənin daxilindəki alt sorğu hər bir sətir üçün təkrar-təkrar (milyonlarla dəfə) işləyir və bazanı tamamilə dondurur.
* **Həll (Yeni Variant):** `INNER JOIN` və `GROUP BY` strukturundan istifadə edərək iki cədvəl bir-birinə bağlanmışdır. Bu zaman verilənlər bazası məlumatları cəmi 1 dəfəyə oxuyur və ümumi məbləği dərhal hesablayır.

#### ❌ Köhnə (Ağır və Performansı Aşağı) Variant:
```sql
SELECT o.OrderID, o.CustomerID,
       (SELECT SUM(od.UnitPrice * od.Quantity) 
        FROM [Order Details] od 
        WHERE od.OrderID = o.OrderID) AS TotalAmount
FROM Orders o;
```

Yeni (Optimallaşdırılmış və Sürətli) Variant:

```sql
SELECT o.OrderID, o.CustomerID, SUM(od.UnitPrice * od.Quantity) AS TotalAmount
FROM Orders o
INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY o.OrderID, o.CustomerID;
```

### 2. İndeksləmə (Index) ilə Axtarışın Sürətləndirilməsi

* **Problem:** Cədvəldə ölkə və ya şəhərə görə filtrasiya apararkən, SQL lazımi məlumatı tapmaq üçün milyonlarla sətri tək-tək oxumaq (Full Table Scan) məcburiyyətində qalırdı.
* **Həll:** `ShipCountry` və `ShipCity` sütunları üzərində kompozit indeks yaradılmışdır. Bu indeks kitabın sonundakı mündəricat kimi işləyərək, SQL-in axtarılan ölkə və şəhəri bütün cədvəli gəzmədən, nöqtə atışı ilə saniyələr daxilində tapmasını təmin edir.

#### 🛠️ İndeksin Yaradılması Kodu:
```sql
CREATE INDEX idx_orders_ship_country_city 
ON Orders (ShipCountry, ShipCity);
```

# DevJoint Təcrübə Proqramı — Satış və Mənfəət Analizi Portfel Layihəsi

Bu layihədə şirkətin satış, mənfəət, müştəri və region məlumatları analiz edilmiş, Excel vasitəsilə məlumatların təmizlənməsi (Data Cleaning), inteqrasiyası, biznes suallarının cavablandırılması və interaktiv hesabatlığın (Dashboard) qurulması mərhələləri icra olunmuşdur.

## 🔑 Week 2: Excel ilə Data Analitikası və Dashboard

Bu həftənin məqsədi bazadan çıxarılan xam verilənlərin Excel mühitində təmizlənməsi, funksiyalar vasitəsilə analiz edilməsi və rəhbərlik üçün dinamik (interaktiv) hesabat panelinin (Dashboard) hazırlanmasıdır.

### 📌 Əhatə Olunan Excel Mövzuları
| # | Mövzu | Təsvir |
| :--- | :--- | :--- |
| **1** | **Cədvəl daxilində data təmizləmə** | Unikal dəyərlərin tapılması, boşluqların (`null`) və təkrarlanan sətirlərin təmizlənməsi |
| **2** | **** | `IF`, `AND`, `OR`, `IFS` funksiyaları ilə şərti sütunların və kateqoriyaların yaradılması |
| **3** | **Lookup Functions** | `XLOOKUP`, `VLOOKUP`, `INDEX` & `MATCH` vasitəsilə fərqli vərəqlərdən dataların çəkilməsi |
| **4** | **Aggregation** | `SUMIFS`, `COUNTIFS`, `AVERAGEIFS` funksiyaları ilə şərtə bağlı dinamik hesablamalar |
| **5** | **Pivot Tables** | Böyük verilənlər çoxluğunun sürətli şəkildə qruplaşdırılması və çarpaz analizlər |
| **6** | **Data Visualization** | Biznes trendlərini göstərən qrafiklərin (Xətti, Sütunlu, Dairəvi) düzgün seçilməsi |
| **7** | **Interactive Elements** | Slicer-lər (Dilimləyicilər) və Timeline vasitəsilə interaktiv idarəetmə panelinin qurulması |

### 🗂️ Excel Checkpoint-lər
| Checkpoint | Əhatə Etdiyi Analitik Mövzular |
| :--- | :--- |
| **Checkpoint 1** | Data transformaciyası, mətn funksiyaları (`LEFT`, `RIGHT`, `MID`) və formatların düzəldilməsi |
| **Checkpoint 2** | `XLOOKUP` və inkişaf etmiş riyazi/məntiqi funksiyalarla relyasion modelin qurulması |
| **Checkpoint 3** | Müştəri, Satış və Region profilləri üzrə `Pivot Table` hesabatlarının çıxarılması |
| **Checkpoint 4** | KPI (Əsas Effektivlik Göstəriciləri) kartlarının dizayn edilməsi və vizual iyerarxiya |
| **Checkpoint 5** | Dinamik Filtrlərlə (Slicers) təchiz olunmuş interaktiv Satış Dashboard-unun tamamlanması |
| **Checkpoint 6** | İstifadə olunan formulaların qısa sənədləşdirilməsi |

---

## 🗃️ Resurslar və Alətlər

* **Verilənlər Bazası Faylı:** [`northwind_database.db`](Week_1_SQL_Basics_to_Advanced/northwind.db)
* **İstifadə Olunan Texnologiyalar:** SQL (SQLite), Microsoft Excel / Google Sheets
* **Proqram təminatı:** DB Browser for SQLite, MS Excel

---

## Checkpoint 1: Məlumatların Təmizlənməsi (Data Cleaning)

Cədvəl daxilində hesablamaların düzgünlüyünü təmin etmək üçün aşağıdakı təmizləmə və standartlaşdırma addımları yerinə yetirilmişdir:

1. **Təkrarlanan sətirlərin silinməsi:** Eyni müştəriyə və sifarişə aid alt-alta düşən dublikat sətirlər datadan kənarlaşdırılmışdır.
2. **Boş sətirlərin silinməsi:** Cədvəlin ortasında qalan və gələcəkdə statistik göstəriciləri korlaya biləcək tamamilə boş sətirlər təmizlənmişdir.
3. **Sıra nömrələrinin düzəldilməsi:** Sistem xətası ucbatından fərqli sifarişlərə verilmiş eyni sıra nömrələri düzəldilmiş və ardıcıllıq bərpa olunmuşdur.
4. **Boşluqların vizual tapılması:** Cədvəldə gizlənən boş hüceyrələri vizual aşkar etmək üçün analitik məqsədlə şrift (font) dəyişdirmə metodundan istifadə edilmişdir.
5. **Tarixlərin yoxlanılması:** Sifariş və çatdırılma tarixlərinin formatı yoxlanılmış, xronoloji uyğunluq təsdiqlənmişdir.
6. **Rəqəmlərin standart formata salınması:** Satış sayları tam rəqəmə çevrilmiş, pul göstəricilərindəki kəsrlər vergüldən sonra 2 rəqəm olacaq şəkildə eyniləşdirilmişdir.
7. **Mənfi qazancların saxlanılması:** Profit (Mənfəət) sütunundakı mənfi rəqəmlərin xəta olmadığı, müştərilərə edilən yüksək endirimlərə görə şirkətin etdiyi real ziyan olduğu təsdiqlənərək datada saxlanılmışdır.

---

## Checkpoint 2: Biznes Sualları və Pivot Table Analizi

Biznesin mövcud vəziyyətini qiymətləndirmək üçün 7 kritik suala cavab axtarılmış və müvafiq strateji qərarlar hazırlanmışdır:

### 1. Məhsul Portfeli Analizi
* **Biznes sualı:** Hansı məhsul kateqoriyası və ya alt kateqoriyası zərər edir?
* **Fakt:** Furniture (Mebel) kateqoriyası cəmi 19,706.64$ mənfəət verir. Buna səbəb Tables (-17,753.21$) və Bookcases (-3,632.07$) alt kateqoriyalarının zərərlə işləməsidir. Technology kateqoriyası isə 146,566.82$ ilə ən çox qazandırandır.
* **Qərar:** Masaların (Tables) satış həcmi azaldılmalı və ya qiyməti qaldırılmalıdır. Resurslar daha yüksək gəlirli Copiers (56,093.94$) və Phones (45,074.27$) satışına yönəldilməlidir.

### 2. Region və Şəhər Riskləri
* **Biznes sualı:** Coğrafi olaraq hansı şəhərlərdə resurs itkisinə yol verilir?
* **Fakt:** Zərərli şəhərlər ümumilikdə 390,453.99$ satış etsə də, şirkətə -75,330.21$ xalis zərər vurur. Ən böyük maliyyə zərbəsini Philadelphia (-13,837.77$) və Houston (-10,153.55$) şəhərləri vurur.
* **Qərar:** Bu şəhərlərdə logistika və paylama xərcləri təftiş edilməli, rentabellilik problemi həll olunana qədər aqressiv marketinq və satış dayandırılmalıdır.

### 3. Endirim Strategiyasının Qiymətləndirilməsi
* **Biznes sualı:** Hansı endirim faizləri şirkəti zərərə uğradır?
* **Fakt:** 0% (326,707.09$), 10% (9,099.97$) və 20\% (91,079.95$) endirim dərəcələri mənfəət gətirir. Lakin endirim 30%-ə çatdıqda -10,501.39$, 40\%-ə çatdıqda ise -23,086.37$ birbaşa zərər yaranır.
* **Qərar:** Şirkət üzrə maksimum endirim limiti 20% olaraq bloklanmalıdır. 30%-dən yuxarı endirim tətbiqinə qadağa qoyulmalıdır.

### 4. Müştəri Riskləri
* **Biznes sualı:** Ən yüksək zərər vuran top müştərilərimiz kimlərdir?
* **Fakt:** Filtr olunmuş riskli müştəri qrupu şirkətə ümumilikdə -30,265.47$ xalis zərər vurur. Ən yüksək mənfi marja Cindy Stewart (-6,626.39$) və Grant Thornton (-4,108.66$) tərəfindən formalaşdırılıb.
* **Qərar:** Bu müştərilərə satılan məhsulların qiymət marjasına yenidən baxılmalı və növbəti sifarişlərdə onlara edilən xüsusi endirimlər tamamilə ləğv edilməlidir.

### 5. İllər üzrə İnkişaf Dinamikası
* **Biznes sualı:** Biznes ildən-ilə stabil böyümə nümayiş etdirirmi?
* **Fakt:** Bəli, biznes stabil böyüyür. Ümumi satışlar 2023-cü ildəki 493,659.72$-dan 2026-cı ildə 745,567.53$-a yüksəlmişdir. Eyni zamanda xalis mənfəət də 51,660.94$-dan 95,926.35$-a qalxmışdır.
* **Qərar:** Böyümə tempi müsbətdir, mövcud qlobal satış və qiymət strategiyası qorunub saxlanılmalıdır.

### 6. Sifariş Sayında Mövsümlülük (Seasonality)
* **Biznes sualı:** İlin hansı aylarında logistika və əməliyyat yükü pik həddə çatır?
* **Fakt:** Sifarişlərin sayı ilin son rübünə doğru kəskin artır. Ən yüksək sifariş yükü Noyabr (1,473 sifariş) və Dekabr (1,470 sifariş) aylarındadır. Ən sakit ay isə Fevraldır (300 sifariş).
* **Qərar:** Payızın son aylarında logistika və anbar komandasının işçi qüvvəsi (outsourcing vasitəsilə) artırılmalı, Fevral ayında isə əməliyyat xərcləri minimuma endirilməlidir.

### 7. Aylıq Mənfəət Trendi
* **Biznes sualı:** Hansı dövrlərdə mənfəət zəifləyir və ya xalis zərər qeydə alınır?
* **Fakt:** İlin ən gəlirli dövrü Dekabr (44,229.85$ mənfəət) ayıdır. Lakin Yanvar və Aprel aylarında ciddi dalğalanmalar var (məsələn, 2024-cü ilin Yanvarında -3,189.80$ zərər qeydə alınıb).
* **Qərar:** Yanvar ayındakı zərər riskini kompensasiya etmək üçün Dekabr ayında əldə olunan yüksək mənfəətdən nağd pul ehtiyatı (maliyyə yastığı) ayrılmalıdır.

---

## Checkpoint 3: Məlumatların İnteqrasiyası və Lookup Formulaları

`Orders` (Sifarişlər) əsas cədvəlinə digər vərəqlərdən relyasion məlumatlar inteqrasiya edilmişdir. Sifariş kodları əsas götürülərək hansı malların geri qaytarıldığı (Returned) təyin olunmuş, həmçinin tədarükçü (Supplier) və maya dəyəri (Unit Cost) məlumatları cədvələ əlavə edilmişdir.

* **Geri qaytarılma statusu (Returned) üçün:**
  ```excel
  =XLOOKUP(@B:B,Returns!A:A,Returns!B:B,"No")

  Şərh: Sifariş kodunu Returns vərəqində axtarır, tapmadıqda xəta verməməsi üçün hüceyrəyə "No" yazır.

###Tədarükçü (Supplier) məlumatı üçün:

=XLOOKUP(@P:P,Products!A:A,Products!C:C,"Bilinmir")
Şərh: Məhsul koduna əsasən Products vərəqindən müvafiq tədarükçü şirkətin adını cədvələ köçürür.

Maya dəyəri (Unit Cost) üçün:

Excel
=INDEX(Products!D:D, MATCH(Orders!P2, Products!A:A, 0))
Şərh: MATCH funksiyası məhsul kodunun digər vərəqdəki sətir nömrəsini tapır, INDEX isə həmin sətirə uyğun maya dəyərini gətirir.

###Checkpoint 4: Hesablanan Sahələr və Məntiqi Funksiyalar

Şərtləri qruplaşdırmaq və əməliyyatları kateqoriyalara ayırmaq məqsədilə ana cədvəldə iki yeni analitik sütun yaradılmışdır:

Region üzrə ümumi satış həcmi (Region_Total_Sales):

Excel
=SUMIFS(T:T, O:O, O2)
Şərh: Cari sətirdəki regiona uyğun gələn bütün satışları cəmləyərək hər bir bölgənin ümumi satış gücünü dinamik təyin edir.

Rentabellilik statusu (Status):

Excel
=IF(W2 < 0, "Zərər", "Gəlir")
Şərh: Mənfəət (Profit) dəyəri sıfırdan kiçik olduqda "Zərər", əks halda "Gəlir" statusu formalaşdırır.

###Checkpoint 5: Dashboard və Şərti Formatlaşdırma
Datanın vizual analizi və əsas performans göstəricilərinin (KPI) izlənilməsi üçün 3 fərqli qrafik tipindən ibarət dinamik dashboard hazırlanmışdır.

İstifadə Olunan Qrafik Tipləri:
Pie Chart (Dairəvi diaqram): Regionlar üzrə ümumi satış payını və bazar bölgüsünü göstərmək üçün.

Column Chart (Sütunlu diaqram): Kateqoriyalar üzrə mənfəət/zərər müqayisəsini vizuallaşdırmaq üçün.

Bar Chart (Üfüqi sütunlu diaqram): Tranzaksiyaların gəlir/zərər statuslarının say və həcmi üzrə bölgüsünü izləmək üçün.

Şərti Formatlaşdırma (Conditional Formatting):
Biznes hədəflərini vizual olaraq anında fərqləndirmək üçün pivot cədvəllərdə şərti formatlaşdırma tətbiq olunmuşdur. Şirkətə yüksək xalis mənfəət qazandıran və hədəfi keçən kateqoriyalar (məsələn, Office Supplies) xüsusi yaşıl rəng indikatoru ilə vurğulanmışdır.

###Checkpoint 6: Formulaların Texniki Quruluşu və Sənədləşmə
1. Pivot Cədvəllərin Quruluş Arxitekturası (Checkpoint 2)
Məhsul Portfeli: Satırlar: Category -> Sub-Category | Dəyərlər: Sum of Profit

* **Region və Şəhər:** Satırlar: Region -> City | Dəyərlər: Sum of Sales, Sum of Profit | Filtr: Profit < 0

* **Endirim Strategiyası:** Satırlar: Discount | Dəyərlər: Sum of Profit

* **Müştəri Riskləri:** Satırlar: Customer Name | Dəyərlər: Sum of Profit | Sıralama: Profit (Artan sıra ilə)

* **İllik Trend:** Satırlar: Order Date (Years) | Dəyərlər: Sum of Sales, Sum of Profit

* **Mövsümlülük:** Satırlar: Order Date (Months) | Dəyərlər: Count of Order ID

* **Aylıq Trend:** Satırlar: Order Date (Months) | Sütunlar: Order Date (Years) | Dəyərlər: Sum of Profit

###2. Dashboard Cədvəl Quruluşları (Checkpoint 5)
* **Regionlar üzrə Satış Payı (Pie Chart):** Satırlar: Region | Dəyərlər: Sum of Sales

* **Kateqoriyalar üzrə Mənfəət (Column Chart):** Satırlar: Category | Dəyərlər: Sum of Profit

* **Statusun Sayı (Bar Chart):** Satırlar: Status | Dəyərlər: Count of Status

* **Qeyd:** Dashboard vizualının daha peşəkar görünməsi üçün bütün Pivot qrafiklərinin sahə düymələri (Field Buttons) gizlədilmişdir.

🔗 Dashboard Faylına baxış: Google Drive Linki: image/excelDashboard.png
