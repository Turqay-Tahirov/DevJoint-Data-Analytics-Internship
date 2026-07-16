/* Sual 2: Londonda yaşayan rəhbər şəxslər (Owner və ya Manager) kimlərdi? */
/*Bu sorğu, Londonda yerləşən müştərilərimizin rəhbər işçilərini əlifba sırası ilə sıralayır. */

select ContactName, ContactTitle, City, Phone  from Customers 
where City = 'London' and (ContactTitle like '%Owner%' or ContactTitle like '%Manager%')
ORDER BY ContactName ASC;
