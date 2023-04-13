select 
row_number() over(order by Breed) as BreedSK,
Breed
from(
select 
Breed1  as Breed from Petdata_DES
union all
select Breed2 from Petdata_DES) as data