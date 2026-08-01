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

# 📊 Sales & Profit Analytics Dashboard (Excel)

Bu repository, **Northwind** verilənlər bazasından çıxarılan xam satış verilənlərinin Excel mühitində təmizlənməsi, qabaqcıl verilən inteqrasiyası funksiyaları ilə relyasion modelin qurulması və rəhbərlik üçün interaktiv hesabat panelinin (**Dashboard**) hazırlanması prosesini əhatə edir.

> 🛠️ **Texnologiyalar:** MS Excel  
> 📁 **Resurslar:** `northwind_database.db` | `excelDashboard.png` (Dashboard Vizualı)

---

### 🗺️ Layihənin Yol Xəritəsi (Mövzular və Checkpoint-lər)

Məlumatların idarə edilməsi və analitik hesabatlıq mərhələlərini bir baxışda anlamaq üçün icmal cədvəli:

| Checkpoint | Excel Mövzuları / Funksiyaları | Biznes Ssenarisi və Analitik Tapşırıq |
| :--- | :--- | :--- |
| **📌 CP 1** | `LEFT`, `RIGHT`, `MID`, Data Cleaning | Dublikat/boş sətirlərin silinməsi, rəqəm və tarix formatlarının standartlaşdırılması |
| **📌 CP 2** | `Pivot Tables`, `Data Visualization` | Məhsul, region, endirim strategiyası, müştəri riskləri və mövsümlülük üzrə 7 kritik biznes sualının təhlili |
| **📌 CP 3** | `XLOOKUP`, `INDEX & MATCH` | `Returns` və `Products` vərəqlərindən geri qaytarılma, tədarükçü və maya dəyəri məlumatlarının əsas cədvələ inteqrasiyası |
| **📌 CP 4** | `SUMIFS`, `IF`, `AND`, `OR` | Region üzrə ümumi satış gücünün və mənfəətə görə "Gəlir/Zərər" statusunun dinamik hesablanması |
| **📌 CP 5** | `Pie, Column & Bar Charts`, `Slicers` | Region satışı, kateqoriya mənfəəti və tranzaksiya statuslarını göstərən interaktiv idarəetmə panelinin qurulması |
| **📌 CP 6** | Formula Sənədləşdirilməsi | Tətbiq olunan makro-funksiyaların, pivot arxitekturalarının və KPI kartlarının strukturlaşdırılması |

---

### 📊 Biznes İnsaydları və Strateji Qərarlar (Executive Summary)

Pivot Table analizi nəticəsində şirkətin rentabelliyini artırmaq üçün növbəti addımlar müəyyən edilmişdir:

*   **Məhsul Portfeli:** *Tables* (-17,753.21$) və *Bookcases* (-3,632.07$) alt kateqoriyalarının ciddi zərər etdiyi, *Technology* kateqoriyasının isə ən böyük gəlir mənbəyi olduğu tapılmışdır. (Qərar: Zərərli sahələrdə qiymət artımı edilməli, resurslar *Copiers* və *Phones* satışına yönəldilməlidir).
*   **Region və Müştəri Riskləri:** *Philadelphia* və *Houston* şəhərlərinin, eləcə də müəyyən riskli müştəri qruplarının şirkətə ciddi xalis zərər vurduğu aşkar edilmişdir. (Qərar: Logistika xərcləri təftiş edilməli, bu subyektlərə tətbiq olunan xüsusi endirimlər ləğv olunmalıdır).
*   **Endirim Strategiyası:** 20%-ə qədər olan endirimlərin gəlirli olduğu, lakin 30% və üzəri endirimlərin birbaşa zərər yaratdığı sübut edilmişdir. (Qərar: Şirkət üzrə maksimum endirim limiti 20% olaraq bloklanmalıdır).
*   **Mövsümlülük (Seasonality):** Sifariş yükünün Noyabr və Dekabr aylarında pik həddə çatdığı, Fevralda isə minimuma endiyi tapılmışdır. (Qərar: Payızın son rübündə anbar işçi qüvvəsi artırılmalı, Yanvar ayı üçün Dekabr gəlirlərindən maliyyə yastığı ayrılmalıdır).

---

### 🎯 Qazanılan Bacarıqlar

*   **Məlumatların Təmizlənməsi (Data Cleaning):** Xam datadakı sistem xətalarını, dublikatları və format uyuşmazlıqlarını aradan qaldırmaq.
*   **Relyasion Model Qurulması:** Excel-i bir verilənlər bazası kimi istifadə edərək fərqli vərəqlərdəki dataları açar sütunlar üzərindən əlaqələndirmək.
*   **İnteraktiv Hesabatlıq (Dashboarding):** Dilimləyicilər (Slicers) və şərti formatlaşdırma vasitəsilə rəhbərliyin anlıq qərar qəbul edə biləcəyi vizual iyerarxiya qurmaq.

📁 **Dashboard faylının vizualı üçün baxın:** `image/excelDashboard.png`

✍️ **Müəllif:** Turqay Tahirov  
*Bu layihə DevJoint Təcrübə Proqramı çərçivəsində, real data üzərində analitik və biznes hesabatlığı bacarıqlarını nümayiş etdirmək üçün hazırlanmışdır.*

