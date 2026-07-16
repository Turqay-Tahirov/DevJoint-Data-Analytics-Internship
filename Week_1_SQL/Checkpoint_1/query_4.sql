/*Müştəriyə hələ göndərilməmiş ən təcili ilk 5 sifariş hansıdı? */
/*Bu sorğu, yola çıxmayan sifarişləri çatdırılma vaxtına görə ən təcilidən başlayaraq sıralayır. */

select OrderID, CustomerID, OrderDate, RequiredDate, ShippedDate from Orders 
where ShippedDate is null
order by RequiredDate asc
limit 5;
