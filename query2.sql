create procedure UjKategoria
	@Kategoria nvarchar(50),
	@SzuloKategoria nvarchar(50)
as

begin tran

declare @SzuloKategoriaId int
declare @Id int

select @Id=id
from Kategoria with (TABLOCKX)
where upper(Nev) = upper(@Kategoria)

if @Id is not null
begin
	rollback
	raiserror(' A %s kategoria mar letezik', 16, 1, @Kategoria)
	return
end

if @SzuloKategoria is not null
begin
	select @SzuloKategoriaId=id
	from Kategoria
	where upper(Nev) = upper(@SzuloKategoria)

	if @SzuloKategoriaId is null
	begin
		rollback
		raiserror ('A %s kategoria nem letezik',1,16, @SzuloKategoria)
		return
	end
end

insert into Kategoria
values(@Kategoria, @SzuloKategoriaId)

commit
