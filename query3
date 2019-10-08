create trigger StatuszKarbantartas
on Megrendeles
for update
as

update MegrendelesTetel
set StatuszID=i.statuszid
from MegrendelesTetel mt
inner join inserted i on i.ID=mt.MegrendelesID
inner join deleted d on d.Id=mt.MegrendelesID
where i.statuszID != d.statuszID
	and mt.StatuszID=d.statuszID
  
********************************************************
select MegrendelesTetel.StatuszID, Megrendeles.StatuszID
from MegrendelesTetel join Megrendeles 
	on Megrendelestetel.megrendelesid = megrendeles.id
where Megrendeles.ID=1

update Megrendeles
set StatuszID=4
where ID=1
