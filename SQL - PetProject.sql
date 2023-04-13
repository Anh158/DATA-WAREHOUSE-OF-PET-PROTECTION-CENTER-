create database SourcePet
create database StagingPet
create database DestinationPet
go
--create source table inorder to import data from flat file beacause CDC only work on SQL server
use SourcePet 
CREATE TABLE [Petdata_Source] (
    [PetID] int primary key,
    [Type] varchar(3),
    [Age] int,
    [Breed1] nvarchar(255),
    [Breed2] nvarchar(255),
    [Gender] nvarchar(6),
    [Color1] nvarchar(255),
    [Color2] nvarchar(255),
    [Color3] nvarchar(255),
    [MaturitySize] nvarchar(13),
    [FurLength] nvarchar(13),
    [Vaccinated] nvarchar(8),
    [Dewormed] nvarchar(8),
    [Sterilized] nvarchar(8),
    [Health] nvarchar(14),
    [Quantity] int,
    [Fee] int,
    [State] nvarchar(255),
    [RescuerID] int
)
go

use StagingPet
CREATE TABLE [Petdata_STG] (
    [PetID] int,
    [Type] varchar(3),
    [Age] int,
    [Breed1] varchar(255),
    [Breed2] varchar(255),
    [Gender] varchar(6),
    [Color1] varchar(255),
    [Color2] varchar(255),
    [Color3] varchar(255),
    [MaturitySize] varchar(13),
    [FurLength] varchar(13),
    [Vaccinated] varchar(8),
    [Dewormed] varchar(8),
    [Sterilized] varchar(8),
    [Health] varchar(14),
    [Quantity] int,
    [Fee] int,
    [State] varchar(255),
    [RescuerID] int
)
go

use DestinationPet
go
CREATE TABLE [Petdata_DES] (
    [PetID] int primary key,
    [Type] nvarchar(3),
    [Age] int,
    [Breed1] nvarchar(255),
    [Breed2] nvarchar(255),
    [Gender] nvarchar(6),
    [Color1] nvarchar(255),
    [Color2] nvarchar(255),
    [Color3] nvarchar(255),
    [MaturitySize] nvarchar(13),
    [FurLength] nvarchar(13),
    [Vaccinated] nvarchar(8),
    [Dewormed] nvarchar(8),
    [Sterilized] nvarchar(8),
    [Health] nvarchar(14),
    [Quantity] int,
    [Fee] int,
    [State] nvarchar(255),
    [RescuerID] int
)
go

--enable CDC for  Source_Pet
use SourcePet
exec sys.sp_cdc_enable_db 

exec sys.sp_cdc_enable_table
@source_schema =  'dbo',
@source_name = 'Petdata_Source',
@role_name = 'cdc_admin',
@supports_net_changes = 1

--Create Staging table to load data from CDC source 
use StagingPet
CREATE TABLE [Petdata_INS] (
    [PetID] int primary key,
    [Type] nvarchar(3),
    [Age] int,
    [Breed1] nvarchar(255),
    [Breed2] nvarchar(255),
    [Gender] nvarchar(6),
    [Color1] nvarchar(255),
    [Color2] nvarchar(255),
    [Color3] nvarchar(255),
    [MaturitySize] nvarchar(13),
    [FurLength] nvarchar(13),
    [Vaccinated] nvarchar(8),
    [Dewormed] nvarchar(8),
    [Sterilized] nvarchar(8),
    [Health] nvarchar(14),
    [Quantity] int,
    [Fee] int,
    [State] nvarchar(255),
    [RescuerID] int
)
go
CREATE TABLE [Petdata_UDP] (
        [PetID] int primary key,
    [Type] nvarchar(3),
    [Age] int,
    [Breed1] nvarchar(255),
    [Breed2] nvarchar(255),
    [Gender] nvarchar(6),
    [Color1] nvarchar(255),
    [Color2] nvarchar(255),
    [Color3] nvarchar(255),
    [MaturitySize] nvarchar(13),
    [FurLength] nvarchar(13),
    [Vaccinated] nvarchar(8),
    [Dewormed] nvarchar(8),
    [Sterilized] nvarchar(8),
    [Health] nvarchar(14),
    [Quantity] int,
    [Fee] int,
    [State] nvarchar(255),
    [RescuerID] int
)
go
CREATE TABLE [Petdata_DEL] (
        [PetID] int primary key,
    [Type] nvarchar(3),
    [Age] int,
    [Breed1] nvarchar(255),
    [Breed2] nvarchar(255),
    [Gender] nvarchar(6),
    [Color1] nvarchar(255),
    [Color2] nvarchar(255),
    [Color3] nvarchar(255),
    [MaturitySize] nvarchar(13),
    [FurLength] nvarchar(13),
    [Vaccinated] nvarchar(8),
    [Dewormed] nvarchar(8),
    [Sterilized] nvarchar(8),
    [Health] nvarchar(14),
    [Quantity] int,
    [Fee] int,
    [State] nvarchar(255),
    [RescuerID] int
	)
go

use [DestinationPet]
truncate table [dbo].[Petdata_DES]
go
use [Source_Pet]
insert into Petdata_Source
values 
(9001,'Dog',4,'Mixed Breed','None','Male','Brown','None','None','Medium','Short','Yes','Yes','Not Sure','Healthy',1,0,'Negeri Sembilan',8747840)


alter table Petdata_Source
alter column Type nvarchar(3)

alter table [dbo].[Petdata_DES]
add constraint pk_petID primary key(PetID) 

exec sys.sp_cdc_disable_table
@source_schema =  'dbo',
@source_name = 'Petdata_Source',
@capture_instance = 'dbo_Petdata_Source'

truncate table Petdata_Source