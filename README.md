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
   * **Məntiq:** Almaniyada olan müştəriləri əlifba sırası ilə sıralayıb ilk 5 nəticəni gətirir.
     ![Query 1 Result](/images/query_1.png)

2. **Sual 2: Londonda yaşayan rəhbər şəxslər (Owner və ya Manager) kimlərdir?**
   * **Kod faylı:** [`query_2.sql`](./Week_1_SQL/Checkpoint_1/query_2.sql)
   * **Məntiq:** Londonda yaşayan və vəzifə adında "Owner" və ya "Manager" olan kontaktları tapır.
     ![Query 2 Result](/images/query_2.png)

3. **Sual 3: ABŞ daxilində karqo pulu 150$-dan çox olan ilk 10 baha sifariş hansıdır?**
   * **Kod faylı:** [`query_3.sql`](./Week_1_SQL/Checkpoint_1/query_3.sql)
   * **Məntiq:** Amerikaya göndərilən və çatdırılma xərci ən yüksək olan 10 böyük sifarişi azalan sıra ilə göstərir.
     ![Query 3 Result](/images/query_3.png)

4. **Sual 4: Müştəriyə hələ göndərilməmiş ən təcili ilk 5 sifariş hansıdır?**
   * **Kod faylı:** [`query_4.sql`](./Week_1_SQL/Checkpoint_1/query_4.sql)
   * **Məntiq:** Göndərilmə tarixi (ShippedDate) boş olan sifarişləri tələb olunan çatdırılma tarixinə (RequiredDate) görə artan sıra ilə düzür.
     ![Query 4 Result](/images/query_4.png)

5. **Sual 5: Fransaya göndərilən və dəyəri 1000$-dan baha olan ilk 5 satış hansıdır?**
   * **Kod faylı:** [`query_5.sql`](./Week_1_SQL/Checkpoint_1/query_5.sql)
   * **Məntiq:** Fransaya gedən və tək məhsul satışı üzrə faktura dəyəri 1000 dollardan yüksək olan ən böyük 5 fərdi satışı gətirir.
     ![Query 5 Result](/images/query_5.png)
