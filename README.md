# 📊 DevJoint Data Analytics Internship Program

Bu repozitoriya, **DevJoint** tərəfindən təşkil olunmuş 4 həftəlik Data Analitika təcrübə proqramı çərçivəsində hazırladığım bütün tapşırıqları, SQL sorğularını, data analizlərini və hesabatlarımı özündə birləşdirir.

---

### 📁 Layihə Quruluşu (Project Structure)

Layihə həftəlik tapşırıqlara uyğun olaraq aşağıdakı şəkildə strukturlaşdırılıb:

| Qovluq / Fayl | Təsvir | Status |
| :--- | :--- | :--- |
| 📁 **`Week_1_SQL_Basics_to_Advanced/`** | SQL sorğuları (Əsas və JOIN-lar) | 🔄 Yoxlamadadır |
| └── 📄 *`northwind.db`* | Layihədə istifadə olunan verilənlər bazası | ✅ Əlavə edilib |
| 📁 **`Week_2_Excel_Google_Sheets_Analysis/`** | Excel analitikası və Dashboard | ⏳ Tezliklə |
| 📁 **`Week_3_BI_Dashboard/`** | Power BI / Tableau vizuallaşdırma | ⏳ Tezliklə |
| 📁 **`Week_4_Business_Case_Analysis/`** | Biznes Keys analizi və hesabat | ⏳ Tezliklə |
---

### 🔑 Week 1: SQL Əsaslardan Qabaqcıl Səviyyəyə (İcmal)

Bu həftə **Northwind** verilənlər bazası üzərində real biznes ssenarilərinə uyğun fərqli çətinlikli SQL sorğuları icra edilmişdir.

---

### 🛠️ İstifadə Olunan SQL Alətləri
* **Filtrləmə:** `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`, `LIKE`, `IS NULL`.
* **Birləşdirilmə:** `INNER JOIN`, `LEFT JOIN` və `SELF JOIN` (cədvəlin özünə qoşulması).
* **Aqreqasiya:** `GROUP BY` funksiyaları və şərt tətbiq etmək üçün `HAVING`.
* **Mürəkkəb Məntiq:** Alt sorğular (`Subquery`) və müvəqqəti cədvəllər (`CTE - WITH`).
* **Analitik Funksiyalar:** `ROW_NUMBER()`, `RANK()` və kumulyativ cəmlər (`SUM() OVER`).
* **Optimallaşdırma:** `Correlated Subquery`-nin `INNER JOIN`-la əvəzlənməsi və İndeksləmə (`CREATE INDEX`).

---

### 🔍 Cavab Tapılan Biznes Sualları
* **Satış və Müştəri:** Regionlar üzrə top müştərilərin tapılması, gecikmə riski olan sifarişlərin izlənilməsi və 1000$-dan baha satışların analizi.
* **Logistika:** Ölkələr üzrə sifariş sıxlığının analizi və yüksək xərcli karqo daşımalarının müəyyən edilməsi.
* **İdarəetmə:** İşçilərin birbaşa rəhbərləri ilə birlikdə iyerarxik analizi və təcrübəli əməkdaşların tapılması.
* **Məhsul:** Kateqoriya daxilində qiymət sıralaması və ümumi ortalamanı keçən bahalı məhsulların siyahılanması.

---

### 📈 Qazanılan Bacarıqlar
* **Data Təhlili:** Minlərlə sətirlik datanı təmizləyərək mənalı biznes KPI-ları çıxarmağı öyrəndim.
* **Biznes Düşüncəsi:** Real idarəetmə suallarını effektiv SQL sorğularına çevirməyi mənimsədim.
* **Performans:** Böyük verilənlərdə sorğuların saniyələr daxilində işləməsi üçün kodun optimallaşdırılmasını və indeksləmə məntiqini praktiki təcrübə etdim.

### 🔑 Week 2: Excel / Google Sheets Analizi (İcmal)

Bu həftə Excel mühitində böyük satış datası üzərində məlumatların təmizlənməsi, funksiyalarla zənginləşdirilməsi, biznes keys analizi və vizual hesabat panelinin (Dashboard) qurulması prosesi tam icra edilmişdir.

---

### 🛠️ Data Təmizlənməsi və Hazırlıq (Data Cleaning)
* **Dublikat və Boşluqlar:** `Remove Duplicates` və `Go To Special (Blanks)` əmrləri ilə lazımsız sətirlər və gizli boşluqlar saniyələr içində tamamilə təmizləndi.
*  **ID Sürüşməsinin və Ardıcıllığın Bərpası:** Sistem xətası ucbatından tamamilə fərqli məlumatları əks etdirən sətirlərə eyni ID-lərin təyin olunduğu (ID sürüşməsi) aşkarlandı. Bu xətanı aradan qaldırmaq üçün təkrarlanmanın başladığı sətirdən etibarən unikal ID ardıcıllığı `auto-fill` vasitəsilə yenidən nömrələnərək bərpa edildi.
* **Formatlaşdırma:** `Short Date` formatı ilə tarixlər, `Decrease Decimal` düyməsi ilə pul göstəriciləri (vergüldən sonra 2 rəqəm) standart formata salındı.
* **Mənfi Dəyərlər:** `Profit` sütunundakı mənfi rəqəmlərin sistem xətası deyil, 70-80%-lik endirimlərdən yaranan real ziyan olduğu analitik olaraq sübut edildi və datada saxlanıldı.

---

### 🧩 Düsturlar və Data İnteqrasiyası (Advanced Formulas)
* **Çarpaz Axtarış (`XLOOKUP`):** Sifariş koduna əsasən geri qaytarılan mallar (`Returns`) və məhsul koduna görə tədarükçü (`Supplier`) məlumatları fərqli vərəqlərdən ana cədvələ inteqrasiya olundu.
* **Dəqiq Maya Dəyəri (`INDEX & MATCH`):** Məhsul kodunun yerinə görə cədvəldən nöqtə atışı ilə dəqiq maya dəyəri (`Unit Cost`) tapılaraq əlavə edildi.
* **Şərtli Hesablama (`SUMIFS`):** Hər bir satış sətrinə aid olduğu regionun ümumi satış həcmini dinamik toplayan `Region_Total_Sales` sütunu yaradıldı.
* **Məntiqi Funksiya (`IF`):** Mənfəət dəyərinə əsasən hər bir tranzaksiyaya avtomatik "Gəlir" və ya "Zərər" statusu təyin edildi.

---

### 🔍 Cavab Tapılan Biznes Sualları və Qərarlar
* **Məhsul Portfeli:** *Tables* və *Bookcases* kateqoriyalarının ciddi zərər etdiyi, *Technology* sahəsinin isə ən çox qazandıran olduğu tapıldı. (Qərar: Masaların satışı azaldılmalı, resurslar *Copiers* və *Phones* istiqamətinə yönəldilməlidir).
* **Region və Şəhər Riskləri:** Filtrlənmiş zərərli şəhərlərin (xüsusilə *Philadelphia* və *Houston*) şirkətə xalis zərər vurduğu aşkarlandı. (Qərar: Logistika xərcləri təftiş olunmalı və bu şəhərlərdəki aqressiv satış dayandırılmalıdır).
* **Endirim Strategiyası:** 20%-ə qədər endirimlərin gəlirli olduğu, lakin 30% və üzəri endirimlərin şirkəti birbaşa zərərə apardığı müəyyən edildi. (Qərar: Şirkətdə maksimum endirim limiti 20% olaraq bloklanmalıdır).
* **Müştəri Riskləri:** Şirkətə ən çox zərər vuran top müştərilər (*Cindy Stewart*, *Grant Thornton*) müəyyən olundu. (Qərar: Növbəti sifarişlərdə onlara edilən endirimlər tam kəsilməlidir).
* **Trend və Mövsümlülük:** Biznesin ildən-ilə stabil böyüdüyü (2023-2026), sifariş yükünün isə Noyabr-Dekabr aylarında pik həddə çatdığı, Fevralda isə ən aşağı səviyyəyə düşdüyü tapıldı. (Qərar: Payızın sonu logistika işçi qüvvəsi artırılmalı, Yanvar-Aprel dalğalanmalarına qarşı Dekabr mənfəətindən maliyyə yastığı ayrılmalıdır).

---

### 📊 Vizual Hesabatlıq (Interactive Dashboard)
* **Bazar Payı Analizi:** Regionlar üzrə ümumi satış payını göstərən `Pie Chart`.
* **Mənfəət Müqayisəsi:** Kateqoriyalar üzrə qazancları vizuallaşdıran `Column Chart`.
* **Tranzaksiya Həcmi:** Gəlir/Zərər statuslarının say bölgüsünü izləyən `Bar Chart`.
* **Şərti Formatlaşdırma:** Biznes hədəflərini keçən və yüksək xalis mənfəət qazandıran kateqoriyaları (*Office Supplies*) anında fərqləndirən **yaşıl rəng indikatoru** tətbiq edildi.
📁 **Dashboard faylının vizualı üçün baxın:** `image/excelDashboard.png`

✍️ **Müəllif:** Turqay Tahirov  
*Bu layihə DevJoint Təcrübə Proqramı çərçivəsində, real data üzərində analitik və biznes hesabatlığı bacarıqlarını nümayiş etdirmək üçün hazırlanmışdır.*
