/* 
Sual: Almaniyadakı ilk 5 müştəri kimlərdir? 
İzah: Bu sorğu, Almaniyada olan müştəriləri əlifba sırası ilə düzüb ilk 5 dənəsini gətirir.
*/

SELECT CustomerID, CompanyName, ContactName, Country  
FROM Customers  
WHERE Country = 'Germany'
ORDER BY CompanyName ASC
LIMIT 5;
