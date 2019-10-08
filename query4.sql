alter table vevo add vegosszeg float

declare cur_vevo cursor
	for select ID from Vevo

declare @vevoId int
declare @osszeg float

open cur_vevo
fetch next from cur_vevo into @vevoId
while @@FETCH_STATUS=0
begin	
	select @osszeg = SUM(mt.Mennyiseg * mt.NettoAr)
	from Telephely t
	inner join Megrendeles m on m.TelephelyID = t.ID
	inner join MegrendelesTetel mt on mt.MegrendelesID=m.ID
	where t.VevoID = @vevoId

	update Vevo
	set vegosszeg = isnull(@osszeg, 0)
	where ID = @vevoId

	fetch next from cur_vevo into @vevoId
end

close cur_vevo
deallocate cur_vevo
