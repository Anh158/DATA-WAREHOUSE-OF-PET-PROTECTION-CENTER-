use DestinationPet
create table Pet_DIM(
Pet_key int Primary key identity(100000,1),
Pet_ID int,
Type int foreign key references [dbo].[Type_DIM](type_key),
Breed1 int foreign key references [dbo].[Breeds_DIM](breed_key),
Breed2 int foreign key references [dbo].[Breeds_DIM]([breed_key]),
Gender int foreign key references [dbo].[Gender_DIM](gender_key),
Color1 int foreign key references [dbo].[Color_DIM](color_key),
Color2 int foreign key references [dbo].[Color_DIM](color_key),
Color3 int foreign key references [dbo].[Color_DIM](color_key),
MatureSize int foreign key references [dbo].[MartureSize_DIM](MaturitySize_key),
Furlength int foreign key references [dbo].[FurLength_DIM](Furlength_key),
Vaccinated int foreign key references [dbo].[Vaccinated_DIM](vaccinated_key), 
Dewormed int foreign key references [dbo].[Dewormed_DIM](dewormed_key),
Sterilized int foreign key references [dbo].[sterilized_DIM](sterilized_key),
Health int foreign key references [dbo].[Health_DIM](Health_key),
State int foreign key references [dbo].[State_DIM](State_key),
Rescure int foreign key references [dbo].[Rescure_DIM](Rescure_key),
StartDate datetime,
Endate datetime,
)
go