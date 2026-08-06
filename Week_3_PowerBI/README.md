DevJoint InternShip Program - Week_3 - BI Dashboard (Tableau Public / Power BI)

## 📌 Layihə Haqqında İcmal
Bu layihə şirkətin satış dinamikasını, hədəflərə çatma dərəcəsini və kateqoriyalar üzrə mənfəətliliyini təhlil etmək üçün **Power BI** mühitində hazırlanmış interaktiv analitik dashboard proyektidir. Layihədə məlumatların inteqrasiyası, **Star Schema** modeli əsasında data modelləşdirmə, dinamik **DAX** ölçülərinin yaradılması və modern **Dark Theme UI/UX** standartlarına uyğun vizuallaşdırma həyata keçirilmişdir.

---

## 🏗️ Checkpoint 1: Data İmport və Data Modelləşdirmə

### 1. Məlumatların İnteqrasiyası (Data Import)
Məlumatlar CSV formatında sistemə import olunmuşdur:
* `FactSales` (Faktiki satış əməliyyatları cədvəli)
* `FactSalesTarget` (Satış hədəfləri cədvəli)
* `DimCustomer`, `DimProduct`, `DimEmployee`, `DimGeography`, `DimDate2` (Ölçü cədvəlləri)

### 2. Data Modelləşdirmə (Star Schema)
Avtomatik yaranan yanlış və passiv əlaqələr silinmiş, data modeli optimallaşdırılaraq **Star Schema** strukturuna gətirilmişdir. `FactSales` cədvəli mərkəzdə yerləşdirilərək dimension cədvəlləri ilə **1-to-Many (1:*)** əlaqələr qurulmuşdur:

* `DimCustomer [CustomerKey]` -> `FactSales [CustomerKey]`
* `DimProduct [ProductKey]` -> `FactSales [ProductKey]`
* `DimEmployee [EmployeeKey]` -> `FactSales [EmployeeKey]`
* `DimGeography [GeographyKey]` -> `FactSales [GeographyKey]`
* `DimDate2 [DateKey]` -> `FactSales [OrderDateKey]`
* `DimProduct [Category]` -> `FactSalesTarget [Category]` *(Hədəflərin analiz edilməsi üçün)*

---

## 📈 Checkpoint 2, 3 & 4: Vizual Analiz və KPI İndikatorları

Dashboard-da biznes performansını operativ qiymətləndirmək üçün 5 ana müqayisəli KPI kartı və müxtəlif analitik vizuallar tətbiq olunmuşdur:

### 1. Ana KPI Xülasə Kartları
* **Satış Məbləği:** 70.64M
* **Hədəf Satış:** 74.17M
* **Hədəfə Çatma Faizi:** 95.24% *(Faktiki satışın planlaşdırılan hədəfə nisbəti)*
* **Ümumi Mənfəət:** 25.12M
* **Satış Miqdarı:** 300K

### 2. Əsas Vizual Analizlər
* **Sifariş Prioritetinə Göre Satış Məbləği:** Sifarişlərin prioritet dərəcəsinə (Low, Medium, High) görə paylanması.
* **Kateqoriyalar Üzrə Mənfəət:** Ən çox gəlir gətirən məhsul kateqoriyalarının üfüqi bar chart üzərində müqayisəsi.
* **Vəzifələr Üzrə Mənfəət Paylanması:** Şirkət əməkdaşlarının (Warehouse, Manager, Digital Marketing və s.) mənfəətə töhfəsi.
* **Ən Çox Satılan 5 Alt-Kateqoriya:** Yüksək paya malik alt-kateqoriyaların donut chart ilə təhlili.
* **İllər Üzrə Satış Dinamikası:** Satışın illər üzrə trendini göstərən zaman sırası qrafiki (Line Chart).

---

## 🎨 Checkpoint 5: Dashboard Dizaynı və UI/UX

* **Vizual İyerarxiya:** Əsas göstəricilər (KPI-lar) yuxarı paneldə, süzgəclər (Slicers) sol menyuda, detallı vizuallar isə mərkəzdə rahat oxunacaq strukturda yerləşdirilmişdir.
* **Ardıcıl Rəng Sxemi:** Modern tünd mövzu (Dark Theme) tətbiq olunmuş, kontrast təmin etmək üçün neon mavi və tünd göy tonlarından istifadə edilmişdir.
* **İnteraktiv Süzgəclər (Slicers):** Dashboard *Tarix Aralığı*, *Satış Kanalı*, *Ölkə* və *Loyallıq Dərəcəsi* süzgəcləri vasitəsilə dinamik filtrasiya olunur.

---

## 🧮 Checkpoint 6: Daxil Edilmiş DAX Ölçüləri (Measures)

Hesabatda nisbi müqayisələri və performans faizlərini hesablamaq üçün istifadə olunan DAX düsturları:

### 1. Hədəfə Çatma Faizi (Target Attainment %)
```dax
Hədəfə Çatma Faizi = 
DIVIDE(
    SUM(FactSales[SalesAmount]), 
    SUM(FactSalesTarget[TargetSalesAmount]), 
    0
)
```
### 1. Hədəfə Çatma Faizi (Target Attainment %)
```dax
Mənfəət Faizi = 
DIVIDE(
    SUM(FactSales[Profit]), 
    SUM(FactSales[SalesAmount]), 
    0
)
