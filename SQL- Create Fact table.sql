
--Create Age_Fact table
if not exists(select * from sys.tables where name = 'Age_Fact')
begin
create table Age_Fact(
Pet_ID int primary Key,
Age int
)
alter table Age_Fact
add constraint fk_petID_PetDim foreign key(Pet_ID) references Pet_DIM(Pet_key)
On delete cascade
end
select * from sys.tables where name = 'Age_Fact'


--Create Fee_Fact table
if not exists(select * from sys.tables where name = 'Fee_Fact')
begin
create table Fee_Fact(
Pet_ID int primary Key,
Fee int
)
alter table Fee_Fact
add constraint fk_petID_fee foreign key(Pet_ID) references Pet_DIM(Pet_key)
On delete cascade
end
select * from sys.tables where name = 'Fee_Fact'


--Create Quantity Fact table

if not exists(select * from sys.tables where name = 'Quantity_Fact')
begin
create table Quantity_Fact(
Pet_ID int primary Key,
Quantity int
)
alter table Quantity_Fact
add constraint fk_petID_quantity foreign key(Pet_ID) references Pet_DIM(Pet_key)
On delete cascade
end
select * from sys.tables where name = 'Quantity_Fact'

truncate table [dbo].[Pet_DIM]