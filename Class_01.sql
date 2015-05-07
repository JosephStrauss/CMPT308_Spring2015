create table people(
	name		text,
	favoriteColor	text,
	favoriteNumber	int
)

insert into people (name, favoriteColor, favoriteNumber)
		value('Alan', 'blue', 007)

select *
from people
