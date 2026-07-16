/* Sual 5: Fransaya göndərilən və qiyməti 1000 dollardan baha olan ilk 5 satış hansıdı? */
/*Bu sorğu, Fransa bazarında tək məhsul üzrə edilən ən böyük 5 fərdi satışı gətirir. */

select OrderID, CustomerName, ProductName, ExtendedPrice, ShipCountry from Invoices
where ShipCountry = 'France' and ExtendedPrice > 1000
order by ExtendedPrice desc
limit 5;
