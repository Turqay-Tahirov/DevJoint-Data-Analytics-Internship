/* Sual 3: ABŞ daxilində karqo pulu 150 dollardan çox olan ilk 10 baha sifariş hansıdı? */
/*Bu sorğu, Amerikada çatdırılma xərci ən yüksək olan 10 böyük sifarişi göstərir. */

select OrderID, ShipName, ShipCity, ShipCountry, Freight 
from Orders 
where ShipCountry = 'USA' and Freight > 150
order by Freight desc
limit 10;
