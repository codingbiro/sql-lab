select count(*)
from Megrendeles m join statusz s on m.statuszid=s.id
where s.nev != 'Kiszállítva'

select f.mod
from Megrendeles m right join fizetesmod f on m.fizetesmodid=f.id
where m.id is null

insert into vevo(Nev, Login, Jelszo, Email)
values ('wasd asd','asds','asd','asd@asd')

select @@identity

update Kategoria
set Nev='Fakockák'
where Nev='Fajáték'

select nev
from Kategoria

select top 1 nev, (select count(*) from Termek where Termek.KategoriaID =k.id) as db
from Kategoria k
order by db desc
