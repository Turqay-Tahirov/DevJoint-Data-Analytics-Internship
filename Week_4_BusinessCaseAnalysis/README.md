# 📊 Marketing Performance Analysis (2024 vs 2025)

Bu layihə İyul–Dekabr dövrü (2024 vs 2025) üzrə əsas müştəri cəlbetmə kanalları və regional bazarlar boyunca marketinq kampaniyalarının effektivliyinin uçdan-uca (end-to-end) qiymətləndirilməsini təqdim edir. Analiz kanal səmərəsizliklərini, gəlir mövsümlülüyünü və mənfəətlilik trendlərini üzə çıxarmaq üçün SQLite-da datanın çıxarılması ilə Microsoft Power BI-da datanın vizuallaşdırılmasını bir araya gətirir.

---
📌 **Project Overview**

This project presents an end-to-end evaluation of marketing campaign performance across key acquisition channels and regional markets for the July–December period (2024 vs 2025). The analysis combines data extraction in SQLite with data visualization in Microsoft Power BI to uncover channel inefficiencies, revenue seasonalities, and profitability trends.

---

### CHECKPOINT 1: Biznes sualına uygun 3–5 KPI/metrikanın müəyyən edilməsi

Seçdiyim metrikalar və izahı:

1. **Revenue (Gəlir):** Kampaniyalardan gələn yekun məbləği müqayisə etməyə imkan verir.
2. **Sessions / Traffic:** Reklamların sayta neçə potensial alıcı cəlb etdiyini görmək üçündür.
3. **Conversion Rate (Konversiya dərəcəsi):** Sayta daxil olan istifadəçilərin neçə faizinin faktiki alıcıya çevrildiyini hesablayır.
4. **ROAS (Return on Ad Spend):** Reklama xərclənən hər 1 manatın neçə manat gəlir gətirdiyini hesablayır və səmərəsiz reklamları aşkar edib tənzimləməyə kömək edir.
5. **CPA (Cost per Acquisition):** Bir alıcı əldə etməyin şirkətə neçəyə başa gəldiyini görmək üçün istifadə olunur.

---

### CHECKPOINT 2: Lazımi datanın çıxarılması/aqreqasiyası üçün SQL sorğuları

```sql
SELECT 
    c.channel,                      -- reklamın getdiyi kanallar
    c.campaign_objective,          -- kampaniyanın məqsədi
    cust.region,                   -- müştərinin yaşadığı region
    SUM(m.sessions) AS total_sessions,          -- sayta ümumi daxilolma sayı
    SUM(m.conversions) AS total_conversions,    -- uğurla tamamlanan ümumi satış sayı
    ROUND(SUM(m.spend), 2) AS total_spend,      -- reklama xərclənən ümumi pul
    ROUND(SUM(m.revenue), 2) AS total_revenue,  -- reklamdan qazanılan ümumi gəlir
    ROUND(SUM(m.revenue) / NULLIF(SUM(m.spend), 0), 2) AS roas  -- ROAS-ın hesablanması (gəlir / xərc)

FROM marketing_events m
JOIN campaigns c ON m.campaign_id = c.campaign_id
JOIN customers cust ON m.customer_id = cust.customer_id

GROUP BY c.channel, c.campaign_objective, cust.region
ORDER BY total_revenue DESC;
```
Sorğunun izahı:
1. Əsas satış və trafik datamız marketing_events cədvəlində olduğu üçün onu mərkəzə qoyub (Fact Table), kanal, kampaniya məqsədi və region məlumatlarını götürmək üçün campaigns və customers cədvəllərini JOIN etdim.
2. Datanı eyni vaxtda 3 fərqli tərəfdən (kanal, kampaniya məqsədi və region) GROUP BY ilə qruplaşdırdım.
3. SUM funksiyası ilə ümumi daxilolma (sessions), satış (conversions), xərc (spend) və gəlir (revenue) toplandı. ROUND funksiyası ilə nöqtədən sonra 2 rəqəm saxlanıldı.
4. Reklamın effektivliyini ölçmək üçün gəlir / xərc nisbəti (ROAS) sıfıra bölünmə xətası (NULLIF) nəzərə alınaraq hesablandı.

---

### CHECKPOINT 3: Kök-səbəb araşdırması

```
SQL
/* 1. Kanal və Region üzrə səmərəlilik */
SELECT 
    c.channel, 
    cust.region, 
    SUM(m.spend) AS total_spend, 
    SUM(m.revenue) AS total_revenue, 
    ROUND(SUM(m.revenue) / NULLIF(SUM(m.spend), 0), 2) AS roas 
FROM marketing_events m 
JOIN campaigns c ON m.campaign_id = c.campaign_id 
JOIN customers cust ON m.customer_id = cust.customer_id 
GROUP BY c.channel, cust.region 
ORDER BY roas ASC;
```
```
/* 2. Zaman və mövsümlülük trendi */
SELECT 
    strftime('%Y-%m', m.date) AS month, 
    SUM(m.spend) AS total_spend, 
    SUM(m.revenue) AS total_revenue, 
    ROUND(SUM(m.revenue) / NULLIF(SUM(m.spend), 0), 2) AS roas 
FROM marketing_events m 
GROUP BY month 
ORDER BY month ASC;
```
Kök-səbəb araşdırmasının nəticəsi:

1. Makro nəticə: Ümumi gəlir yüksək görünür, amma mənfəətlilik (ROAS) ilin sonuna doğru azalır.
2. Kanal və Region üzrə Kök-səbəb: Paid Social ən zəif kanaldır (North regionunda ROAS cəmi 4.03). Yüksək xərclərə (~100k$) baxmayaraq mənfəətliliyi çox aşağıdır. Email və Organic Search isə ən yüksək mənfəəti verir (ROAS 100–130 arası).
3. Mövsümlülük: Hər ilin Noyabr ayında (2025-ci ilin Noyabrında 1.35M$) gəlir pik həddə çatır. Bu artım reklamın effekti yox, Black Friday mövsümüdür. İyuldan Dekabra doğru xərclər artdıqca ROAS 19.1-dən 11.58-ə düşür.

Yekun Kök-səbəb: İlin sonuna doğru Paid Social kimi baha kanallara artıq büdcə ayrılması və ROAS-ın düşməsidir. Black Friday gəliri bu səmərəsizliyi müvəqqəti gizlədir.

### CHECKPOINT 4: Narrativi dəstəkləyən vizuallaşdırma

**Ekran görüntüsü linki:**  
*[image/CP4_Marketing_Performance_Analysis.png]*

**İzah:**  
Təqdim olunan vizuallaşdırma iki əsas biznes iddiasını sübut edir:

* **Sol qrafik:** Paid Social kanalının kəskin aşağı ROAS (~4) verməsini və Email/Organic Search-ün əsas mənfəət mənbəyi olduğunu göstərir.
* **Sağ qrafik:** Noyabr ayındakı gəlir pikini (~1.35M$) və mövsümlülük (Black Friday) effektini aydın şəkildə nümayiş etdirir.

---

### CHECKPOINT 5: Yazılı xülasə

**Ümumi vəziyyət**  
2024 və 2025-ci illərin ikinci yarısını (İyul–Dekabr) müqayisə edəndə görürük ki, ümumi gəlirimiz artıb. Xüsusən Noyabr ayında Black Friday endirimləri sayəsində satışlar pik həddə çatır. Amma gəlir artsa da, reklam kanallarının qazancı (ROAS) arasında böyük fərq var — bəzi kanallar çox yaxşı qazandırır, bəziləri isə demək olar ki, havaya xərcdir.

**Əsas Tapıntılar:**  
* **Pul tələb edən reklamlar zəifdir:** Ən çox pul tökdüyümüz Paid Social (ROAS: 4) və Paid Search (ROAS: 5) reklamları xərcini çətin çıxarır.
* **Pulsuz/ucuz kanallar qazandırır:** Email (ROAS: 130) və Organic Search / SEO (ROAS: 106) bizə demək olar ki, xərcsiz ən böyük mənfəəti gətirir.
* **Noyabr bumu:** 2025-ci ilin Noyabrında gəlirimiz 2024-ün eyni ayı ilə müqayisədə 1.22M$-dan 1.35M$-a qalxıb.

**Tövsiyə:**  
* Qazanc gətirməyən Paid Social və Paid Search reklamlarının büdcəsini azaldıb tənzimləmək lazımdır.
* Ən çox mənfəət gətirən Email göndərişlərinə və saytın axtarışda öndə çıxmasına (SEO) daha çox diqqət ayırmaq lazımdır.
* Reklam büdcəsinin böyük hissəsini Dekabrda xərcləməkdənsə, satışın coşduğu Noyabr (Black Friday) ərəfəsinə saxlamalıyıq.

---

### CHECKPOINT 6: Ən azı 1 konkret, əməli tövsiyə

Bizim analizin nəticəsinə əsasən, belə bir konkret addım atmaq lazımdır:

1. **Reklam pulunu gəlirli kanallara köçürmək:**  
Paid Social reklamlarına (xüsusən North regionunda) 100 min dollara yaxın böyük pul xərclənsə də, gətirdiyi qazanc (ROAS: 4.03) çox aşağıdır və çəkilən xərci çətin çıxarır. Əvəzində Email və Organic Search kanalları 100–130 arası ROAS ilə bizə ən böyük mənfəəti verir. Bu səbəbdən Paid Social kanalının dörddəbirlik (Q4) büdcəsindən 35% kəsib, birbaşa Email və SEO (Organic Search) işlərinə keçirməliyik.

2. **Xərcləri aylara görə düzgün bölmək:**  
İlin sonuna doğru reklam xərcləri artdıqca ümumi mənfəətlilik 19.1-dən 11.58-ə düşür. Noyabrda gəlirin 1.35M$-a çatması reklamın nəticəsi yox, Black Friday endirim dövrüdür. Buna görə də Dekabr ayında havaya xərclənən büdcəni 20% azaldıb, həmin pulu satışı artıran Oktyabr və Noyabr aylarına keçirməliyik.

