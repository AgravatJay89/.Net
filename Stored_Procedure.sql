--Stored Procedure

--SELECT ALL--

--1) SELECT ALL - CITY

-- TO EXECUTE -> [dbo].[PR_City_SelectAll]

Create procedure [dbo].[PR_City_SelectAll]
AS

SELECT  [dbo].[LOC_City].[Citycode],
		[dbo].[LOC_City].[CityID],
		[dbo].[LOC_City].[CityName],
		[dbo].[LOC_City].[CountryID],
		[dbo].[LOC_City].[CreationDate],
		[dbo].[LOC_City].[Modified],
		[dbo].[LOC_City].[StateID]
From [dbo].[LOC_City]

INNER JOIN [dbo].[LOC_State]
ON [dbo].[LOC_State].[StateID] = [dbo].[LOC_City].[StateID]

INNER JOIN [dbo].[LOC_Country]
ON [dbo].[LOC_Country].[CountryID] = [dbo].[LOC_City].[StateID]

ORDER BY [dbo].[LOC_Country].[CountryName],
		 [dbo].[LOC_State].[StateName],
		 [dbo].[LOC_City].[CityName]



--2) SELECT ALL - Country

-- TO EXECUTE -> [dbo].[PR_Country_SelectAll]

Create procedure [dbo].[PR_Country_SelectAll]
AS

SELECT  [dbo].[LOC_Country].[CountryCode],
		[dbo].[LOC_Country].[CountryID],
		[dbo].[LOC_Country].[CountryName],
		[dbo].[LOC_Country].[Created],
		[dbo].[LOC_Country].[Modified]
From [dbo].[LOC_Country]


--3) SELECT ALL - State

-- TO EXECUTE -> [dbo].[PR_State_SelectAll]


Create procedure [dbo].[PR_State_SelectAll]
AS

SELECT  [dbo].[LOC_State].[StateCode],
		[dbo].[LOC_State].[CountryID],
		[dbo].[LOC_State].[StateName],
		[dbo].[LOC_State].[CountryID],
		[dbo].[LOC_State].[Modified],
		[dbo].[LOC_State].[StateID]
From [dbo].[LOC_State]

INNER JOIN [dbo].[LOC_Country]
ON [dbo].[LOC_Country].[CountryID] = [dbo].[LOC_State].[StateID]

ORDER BY [dbo].[LOC_Country].[CountryName],
		 [dbo].[LOC_State].[StateName]



		 
--4) SELECT ALL - Branch

-- TO EXECUTE -> [dbo].[PR_Branch_SelectAll]

Create procedure [dbo].[PR_Branch_SelectAll]
AS

SELECT  [dbo].[MST_Branch].[BranchCode],
		[dbo].[MST_Branch].[BranchID],
		[dbo].[MST_Branch].[BranchName],
		[dbo].[MST_Branch].[Created],
		[dbo].[MST_Branch].[Modified]
From [dbo].[MST_Branch]



--5) SELECT ALL - Student

-- TO EXECUTE -> [dbo].[PR_Student_SelectAll]


Create procedure [dbo].[PR_Student_SelectAll]
AS

SELECT  [dbo].[MST_Student].[StudentID],
		[dbo].[MST_Student].[StudentName],
		[dbo].[MST_Student].[BranchID],
		[dbo].[MST_Student].[CityID],
		[dbo].[MST_Student].[StudentName],
		[dbo].[MST_Student].[MobileNoStudent],
		[dbo].[MST_Student].[Email],
		[dbo].[MST_Student].[MobileNoFather],
		[dbo].[MST_Student].[Address],
		[dbo].[MST_Student].[BirthDate],
		[dbo].[MST_Student].[Age],
		[dbo].[MST_Student].[IsActive],
		[dbo].[MST_Student].[Gender],
		[dbo].[MST_Student].[Password],
		[dbo].[MST_Student].[Created],
		[dbo].[MST_Student].[Modified]

From [dbo].[MST_Student]

INNER JOIN [dbo].[MST_Branch]
ON [dbo].[MST_Branch].[BranchID] = [dbo].[MST_Student].[BranchID]

INNER JOIN [dbo].[LOC_City]
ON [dbo].[LOC_City].[CityID] = [dbo].[MST_Student].[CityID]

ORDER BY [dbo].[MST_Branch].[BranchID],
		 [dbo].[LOC_City].[CityID]







--SelectByPK Procedure--

--6) SELECTByPk - City

-- TO EXECUTE -> [dbo].[PR_City_SelectByPK] 2

create procedure [dbo].[PR_City_SelectByPK]
@CityID int
AS

select [dbo].[LOC_City].[CityID],
	   [dbo].[LOC_City].[CityName],
	   [dbo].[LOC_City].[StateID],
	   [dbo].[LOC_City].[CountryID],
	   [dbo].[LOC_City].[Citycode],
	   [dbo].[LOC_City].[CreationDate],
	   [dbo].[LOC_City].[Modified]
	from [dbo].[LOC_City]

	INNER JOIN	[dbo].[LOC_State]
	ON [dbo].[LOC_State].[StateID] = [dbo].[LOC_City].[StateID]

	INNER JOIN	[dbo].[LOC_Country]
	ON [dbo].[LOC_Country].[CountryID] = [dbo].[LOC_City].[CountryID]

	WHERE [dbo].[LOC_City].[CityID] = @CityID

	ORDER BY [dbo].[LOC_Country].[CountryName],
			 [dbo].[LOC_State].[StateName],
			 [dbo].[LOC_City].[CityName]


--7)  SELECTByPk - Country

-- TO EXECUTE -> [dbo].[PR_Country_SelectByPK] 1

ALTER PROCEDURE [dbo].[PR_Country_SelectByPK]
@CountryID int
AS

select [dbo].[LOC_Country].[CountryID],
	   [dbo].[LOC_Country].[CountryName],
	   [dbo].[LOC_Country].[CountryID],
	   [dbo].[LOC_Country].[Created],
	   [dbo].[LOC_Country].[Modified]
	from [dbo].[LOC_Country]

WHERE [dbo].[LOC_Country].[CountryID] = @CountryID
			 

--8)  SELECTByPk - State

-- TO EXECUTE -> [dbo].[PR_State_SelectByPK] 3

CREATE PROCEDURE [dbo].[PR_State_SelectByPK]
@StateID int
AS

select [dbo].[LOC_State].[StateID],
	   [dbo].[LOC_State].[CountryID],
	   [dbo].[LOC_State].[StateName],
	   [dbo].[LOC_State].[StateCode],
	   [dbo].[LOC_State].[Created],
	   [dbo].[LOC_State].[Modified]
	from [dbo].[LOC_State]

	INNER JOIN	[dbo].[LOC_Country]
	ON [dbo].[LOC_Country].[CountryID] = [dbo].[LOC_State].[CountryID]

WHERE [dbo].[LOC_State].[StateID] = @StateID


		 
--9) SELECByPK - Branch

-- TO EXECUTE -> [dbo].[PR_Branch_SELECByPK] 1

Create procedure [dbo].[PR_Branch_SELECByPK]
@BranchID int
AS

SELECT  [dbo].[MST_Branch].[BranchCode],
		[dbo].[MST_Branch].[BranchID],
		[dbo].[MST_Branch].[BranchName],
		[dbo].[MST_Branch].[Created],
		[dbo].[MST_Branch].[Modified]
From [dbo].[MST_Branch]

WHERE  [dbo].[MST_Branch].[BranchID]= @BranchID



--10) SELECByPK - Student

-- TO EXECUTE -> [dbo].[PR_Student_SelectByPK] 1


Alter procedure [dbo].[PR_Student_SelectByPK]
@StudentID int
AS

SELECT  [dbo].[MST_Student].[StudentID],
		[dbo].[MST_Student].[StudentName],
		[dbo].[MST_Student].[BranchID],
		[dbo].[MST_Student].[CityID],
		[dbo].[MST_Student].[StudentName],
		[dbo].[MST_Student].[MobileNoStudent],
		[dbo].[MST_Student].[Email],
		[dbo].[MST_Student].[MobileNoFather],
		[dbo].[MST_Student].[Address],
		[dbo].[MST_Student].[BirthDate],
		[dbo].[MST_Student].[Age],
		[dbo].[MST_Student].[IsActive],
		[dbo].[MST_Student].[Gender],
		[dbo].[MST_Student].[Password],
		[dbo].[MST_Student].[Created],
		[dbo].[MST_Student].[Modified]

From [dbo].[MST_Student]

INNER JOIN [dbo].[MST_Branch]
ON [dbo].[MST_Branch].[BranchID] = [dbo].[MST_Student].[BranchID]

INNER JOIN [dbo].[LOC_City]
ON [dbo].[LOC_City].[CityID] = [dbo].[MST_Student].[CityID]

WHERE  [dbo].[MST_Student].[StudentID]= @StudentID

ORDER BY [dbo].[MST_Branch].[BranchID],
		 [dbo].[LOC_City].[CityID]




-- INSERT PROCEDUIRE

--11) insert - City

--TO EXECUTE -> [dbo].[PR_City_Insert] Hydrabad,1,1,hrd

Alter PROCEDURE [dbo].[PR_City_Insert]

	
	 @CityName		varchar(100),
	 @StateID		int,
	 @CountryID		int,
	 @Citycode		varchar(50)
	
AS

INSERT INTO [dbo].[LOC_City]
(
		[CityName],
		[StateID],
		[CountryID],
		[Citycode]
		
)
VALUES 
(	
	@CityName,		
	@StateID,	
	@CountryID,	
	@Citycode	
)


--12) insert - Country

--TO EXECUTE -> [dbo].[PR_Country_Insert] Brazil,brz

CREATE PROCEDURE [dbo].[PR_Country_Insert]

	@CountryName		varchar(100),
	@CountryCode		varchar(50)
	
	
AS

INSERT INTO [dbo].[LOC_Country]
(
		[CountryName],
		[CountryCode]
		
)
VALUES 
(	
	@CountryName,
	@CountryCode
	
)	 



--13) insert - State

--TO EXECUTE -> [dbo].[PR_State_Insert] 1,Rajasthan,rj

CREATE PROCEDURE [dbo].[PR_State_Insert]

	@CountryID		int,
	@StateName		varchar(100),
	@StateCode		varchar(50)
	
	
AS

INSERT INTO [dbo].[LOC_State]
(
		[CountryID],
		[StateName],
		[StateCode]
		
)
VALUES 
(	
	@CountryID,
	@StateName,
	@StateCode
)	 


--14) insert - Branch

--TO EXECUTE -> [dbo].[PR_Branch_Insert] Electrical,ee

CREATE PROCEDURE [dbo].[PR_Branch_Insert]

	
	@BranchName		varchar(100),
	@BranchCode		varchar(50)
	
	
AS

INSERT INTO [dbo].[MST_Branch]
(
		[BranchName],
		[BranchCode]
)
VALUES 
(	
	@BranchName,
	@BranchCode	
)



--15) insert - Student

--TO EXECUTE -> [dbo].[PR_Student_Insert] 5,2,3,"Tirth","4569321780","tirthpatel45@gmail.com","1236547890","Rajkot,Mavdi Road,360001",
--"2004-05-02","18","1","Meal","8965","2022-09-08","2023-09-09"

ALTER PROCEDURE [dbo].[PR_Student_Insert]
		@StudentID         int, 
		@BranchID          int,
		@CityID            int,
		@StudentName       Varchar(100),
		@MobileNoStudent   Varchar(100),
		@Email             Varchar(100),
		@MobileNoFather    Varchar(100),
		@Address           Varchar(100),
		@BirthDate         Datetime,
		@Age               int,
		@IsActive          Varchar(50),
		@Gender            Varchar(50),
		@Password          Varchar(50),
		@Created           DateTime,
		@Modified          DateTime
AS
INSERT INTO [dbo].[MST_Student]
(
		[StudentID],
		[BranchID],
		[CityID],
		[StudentName],
		[MobileNoStudent],
		[Email],
		[MobileNoFather],
		[Address],
		[BirthDate],
		[Age],
		[IsActive],
		[Gender],
		[Password],
		[Created],
		[Modified]
)
VALUES(
		@StudentID,
		@BranchID,
		@CityID,
		@StudentName,
		@MobileNoStudent,
		@Email,
		@MobileNoFather,
		@Address,
		@BirthDate,
		@Age,
		@IsActive,
		@Gender,
		@Password,
		@Created,
		@Modified
)




-----UpdateByPK PROCEDURE

--16) UPDATE - CITY

--TO EXECUTE -> [dbo].[PR_City_UpdateByPK] 4,Hydrabad,1,1,HRD

CREATE PROCEDURE [dbo].[PR_City_UpdateByPK]

	@CityID			int,
	@CityName		varchar(100),
	@StateID		int,
	@CountryID		int,
	@CityCode		varchar(50)

AS

UPDATE [dbo].[LOC_City]

	SET [CityName]	=	@CityName,
		[StateID]	=	@StateID,
		[CountryID]	=	@CountryID,
		[CityCode]	=	@CityCode

	WHERE [dbo].[LOC_City].[CityID] = @CityID


--17) UPDATE - Country

--TO EXECUTE -> [dbo].[PR_Country_UpdateByPK] 3,Brazil,BRZ

CREATE PROCEDURE [dbo].[PR_Country_UpdateByPK]

	@CountryID			int,
	@CountryName		varchar(100),
	@CountryCode		varchar(50)

AS

UPDATE [dbo].[LOC_Country]

	SET [CountryName]	=	@CountryName,
		[CountryCode]	=	@CountryCode

	WHERE [dbo].[LOC_Country].[CountryID] = @CountryID


--18) UPDATE - State

--TO EXECUTE -> [dbo].[PR_State_UpdateByPK] 4,Rajasthan,1,RJ

CREATE PROCEDURE [dbo].[PR_State_UpdateByPK]

	@StateID		int,
	@StateName		varchar(100),
	@CountryID		int,
	@StateCode		varchar(50)

AS

UPDATE [dbo].[LOC_State]

	SET [StateName]	=	@StateName,
		[CountryID]	=	@CountryID,
		[StateCode]	=	@StateCode

	WHERE [dbo].[LOC_State].[StateID] = @StateID




--19) UPDATE - Branch

--TO EXECUTE -> [dbo].[PR_Branch_UpdateByPK] 3,Electrical,EE

CREATE PROCEDURE [dbo].[PR_Branch_UpdateByPK]

	@BranchID		int,
	@BranchName		varchar(100),
	@BranchCode		varchar(50)

AS

UPDATE [dbo].[MST_Branch]

	SET [BranchName]	=	@BranchName,
		[BranchCode]	=	@BranchCode

	WHERE [dbo].[MST_Branch].[BranchID] = @BranchID




--20) UPDATE - Student

--TO EXECUTE -> [dbo].[PR_Student_UpdateByPK] 2,1,3,AJAY,9825969009,'21010101007@darshan.ac.in',9632587445,Bhanvad,'2004-08-10',21,1,Male,AJ@y200463

CREATE PROCEDURE [dbo].[PR_Student_UpdateByPK]

	@StudentID			int,
	@BranchID			int,
	@CityID				int,
	@StudentName		varchar(100),
	@MobileNOStudent	varchar(100),
	@Email				varchar(100),
	@MobileNoFather		varchar(100),
	@Address			varchar(500),
	@BirthDate			datetime,
	@Age				int,
	@IsActive			bit,
	@Gender				varchar(50),
	@Password			varchar(100)


AS

UPDATE [dbo].[MST_Student]

	SET	[StudentID]			=	@StudentID,		
		[BranchID]			=	@BranchID,		
		[CityID]			=	@CityID,			
		[StudentName]		=	@StudentName,	
		[MobileNOStudent]	=	@MobileNOStudent,
		[Email]				=	@Email,			
		[MobileNoFather]	=	@MobileNoFather,	
		[Address]			=	@Address,		
		[BirthDate]			=	@BirthDate,		
		[Age]				=	@Age,			
		[IsActive]			=	@IsActive,		
		[Gender]			=	@Gender,			
		[Password]			=	@Password		
	

	WHERE [dbo].[MST_Student].[StudentID] = @StudentID





----DELETE PROCEDURE----

--21) DELETE - City

--TO EXECUTE -> [dbo].[PR_City_DeleteByPK] 3

CREATE PROCEDURE [dbo].[PR_City_DeleteBYPK]
	@CityID int
AS
DELETE
FROM [dbo].[LOC_City]
WHERE [dbo].[LOC_City].[CityID] = @CityID



--22) DELETE - Country

--TO EXECUTE -> [dbo].[PR_Country_DeleteByPK] 3

CREATE PROCEDURE [dbo].[PR_Country_DeleteBYPK]
	@CountryID int
AS
DELETE
FROM [dbo].[LOC_Country]
WHERE [dbo].[LOC_Country].[CountryID] = @CountryID



--23) DELETE - State

--TO EXECUTE -> [dbo].[PR_State_DeleteByPK] 4

CREATE PROCEDURE [dbo].[PR_State_DeleteBYPK]
	@StateID int
AS
DELETE
FROM [dbo].[LOC_State]
WHERE [dbo].[LOC_State].[StateID] = @StateID



--24) DELETE - Branch

--TO EXECUTE -> [dbo].[PR_Branch_DeleteByPK] 3

CREATE PROCEDURE [dbo].[PR_Branch_DeleteBYPK]
	@BranchID int
AS
DELETE
FROM [dbo].[MST_Branch]
WHERE [dbo].[MST_Branch].[BranchID] = @BranchID



--25) DELETE - Student

--TO EXECUTE -> [dbo].[PR_Student_DeleteByPK] 2

CREATE PROCEDURE [dbo].[PR_Student_DeleteBYPK]
	@StudentID int
AS
DELETE
FROM [dbo].[MST_Student]
WHERE [dbo].[MST_Student].[StudentID] = @StudentID