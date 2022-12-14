USE [master]
GO
/****** Object:  Database [osuccme-dev]    Script Date: 9/24/2022 9:54:45 AM ******/
CREATE DATABASE [osuccme-dev]
 WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS
GO
ALTER DATABASE [osuccme-dev] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [osuccme-dev].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [osuccme-dev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [osuccme-dev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [osuccme-dev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [osuccme-dev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [osuccme-dev] SET ARITHABORT OFF 
GO
ALTER DATABASE [osuccme-dev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [osuccme-dev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [osuccme-dev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [osuccme-dev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [osuccme-dev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [osuccme-dev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [osuccme-dev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [osuccme-dev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [osuccme-dev] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [osuccme-dev] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [osuccme-dev] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [osuccme-dev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [osuccme-dev] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [osuccme-dev] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [osuccme-dev] SET  MULTI_USER 
GO
ALTER DATABASE [osuccme-dev] SET DB_CHAINING OFF 
GO
ALTER DATABASE [osuccme-dev] SET QUERY_STORE = ON
GO
ALTER DATABASE [osuccme-dev] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [osuccme-dev]
GO
/****** Object:  User [##MS_SyncAccount##]    Script Date: 9/24/2022 9:54:45 AM ******/
CREATE USER [##MS_SyncAccount##]
GO
/****** Object:  DatabaseRole [DataSync_reader]    Script Date: 9/24/2022 9:54:45 AM ******/
CREATE ROLE [DataSync_reader]
GO
/****** Object:  DatabaseRole [DataSync_executor]    Script Date: 9/24/2022 9:54:46 AM ******/
CREATE ROLE [DataSync_executor]
GO
/****** Object:  DatabaseRole [DataSync_admin]    Script Date: 9/24/2022 9:54:46 AM ******/
CREATE ROLE [DataSync_admin]
GO
ALTER ROLE [DataSync_admin] ADD MEMBER [##MS_SyncAccount##]
GO
/****** Object:  Schema [DataSync]    Script Date: 9/24/2022 9:54:46 AM ******/
CREATE SCHEMA [DataSync]
GO
/****** Object:  Schema [dss]    Script Date: 9/24/2022 9:54:46 AM ******/
CREATE SCHEMA [dss]
GO
/****** Object:  Schema [HangFire]    Script Date: 9/24/2022 9:54:46 AM ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  Schema [TaskHosting]    Script Date: 9/24/2022 9:54:46 AM ******/
CREATE SCHEMA [TaskHosting]
GO
/****** Object:  UserDefinedDataType [dss].[DB_SCHEMA]    Script Date: 9/24/2022 9:54:46 AM ******/
CREATE TYPE [dss].[DB_SCHEMA] FROM [nvarchar](max) NULL
GO
/****** Object:  UserDefinedDataType [dss].[DISPLAY_NAME]    Script Date: 9/24/2022 9:54:46 AM ******/
CREATE TYPE [dss].[DISPLAY_NAME] FROM [nvarchar](140) NOT NULL
GO
/****** Object:  UserDefinedDataType [dss].[EMAIL_ADDRESS]    Script Date: 9/24/2022 9:54:46 AM ******/
CREATE TYPE [dss].[EMAIL_ADDRESS] FROM [nvarchar](256) NULL
GO
/****** Object:  UserDefinedDataType [dss].[LIVE_PUID]    Script Date: 9/24/2022 9:54:46 AM ******/
CREATE TYPE [dss].[LIVE_PUID] FROM [bigint] NULL
GO
/****** Object:  UserDefinedDataType [dss].[PASSWORD_HASH]    Script Date: 9/24/2022 9:54:46 AM ******/
CREATE TYPE [dss].[PASSWORD_HASH] FROM [varbinary](256) NOT NULL
GO
/****** Object:  UserDefinedDataType [dss].[PASSWORD_SALT]    Script Date: 9/24/2022 9:54:46 AM ******/
CREATE TYPE [dss].[PASSWORD_SALT] FROM [varbinary](256) NOT NULL
GO
/****** Object:  UserDefinedDataType [dss].[TASK_REQUEST_RESPONSE]    Script Date: 9/24/2022 9:54:46 AM ******/
CREATE TYPE [dss].[TASK_REQUEST_RESPONSE] FROM [varbinary](max) NOT NULL
GO
/****** Object:  UserDefinedDataType [dss].[VERSION]    Script Date: 9/24/2022 9:54:46 AM ******/
CREATE TYPE [dss].[VERSION] FROM [nvarchar](40) NOT NULL
GO
/****** Object:  UserDefinedTableType [DataSync].[ConferenceRegistrations_dss_BulkType_b453db25-2ba4-4e34-82d0-67141fe8639b]    Script Date: 9/24/2022 9:54:46 AM ******/
CREATE TYPE [DataSync].[ConferenceRegistrations_dss_BulkType_b453db25-2ba4-4e34-82d0-67141fe8639b] AS TABLE(
	[ID] [int] NOT NULL,
	[ConferenceID] [int] NULL,
	[UserID] [nvarchar](128) NULL,
	[CreditHours] [decimal](18, 2) NULL,
	[IsCanceled] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[sync_update_peer_timestamp] [bigint] NULL,
	[sync_update_peer_key] [int] NULL,
	[sync_create_peer_timestamp] [bigint] NULL,
	[sync_create_peer_key] [int] NULL,
	PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedTableType [DataSync].[Conferences_dss_BulkType_b453db25-2ba4-4e34-82d0-67141fe8639b]    Script Date: 9/24/2022 9:54:46 AM ******/
CREATE TYPE [DataSync].[Conferences_dss_BulkType_b453db25-2ba4-4e34-82d0-67141fe8639b] AS TABLE(
	[ID] [int] NOT NULL,
	[Title] [nvarchar](256) NULL,
	[URL] [nvarchar](300) NULL,
	[Description] [nvarchar](max) NULL,
	[Objectives] [nvarchar](max) NULL,
	[Providership] [nvarchar](50) NULL,
	[StartDate] [smalldatetime] NULL,
	[EndDate] [smalldatetime] NULL,
	[Credits] [decimal](18, 2) NULL,
	[IsAccredited] [bit] NULL,
	[LocationKnown] [bit] NULL,
	[LocationName] [nvarchar](256) NULL,
	[LocationAddressLine1] [nvarchar](256) NULL,
	[LocationAddressLine2] [nvarchar](256) NULL,
	[LocationCity] [nvarchar](100) NULL,
	[LocationState] [nvarchar](2) NULL,
	[LocationZipCode] [nvarchar](5) NULL,
	[Latitude] [decimal](18, 6) NULL,
	[Longitude] [decimal](18, 6) NULL,
	[Status] [nvarchar](50) NULL,
	[ContactName] [nvarchar](256) NULL,
	[ContactDepartment] [nvarchar](256) NULL,
	[ContactEmail] [nvarchar](256) NULL,
	[ContactPhone] [nvarchar](50) NULL,
	[AdditionalInformation] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[LocationCountry] [nvarchar](2) NULL,
	[LocationProvinceRegion] [nvarchar](256) NULL,
	[LocationPostalCode] [nvarchar](25) NULL,
	[sync_update_peer_timestamp] [bigint] NULL,
	[sync_update_peer_key] [int] NULL,
	[sync_create_peer_timestamp] [bigint] NULL,
	[sync_create_peer_key] [int] NULL,
	PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedTableType [DataSync].[Degrees_dss_BulkType_b453db25-2ba4-4e34-82d0-67141fe8639b]    Script Date: 9/24/2022 9:54:46 AM ******/
CREATE TYPE [DataSync].[Degrees_dss_BulkType_b453db25-2ba4-4e34-82d0-67141fe8639b] AS TABLE(
	[ID] [int] NOT NULL,
	[Degree] [nvarchar](50) NULL,
	[CountsAsPhysician] [bit] NULL,
	[sync_update_peer_timestamp] [bigint] NULL,
	[sync_update_peer_key] [int] NULL,
	[sync_create_peer_timestamp] [bigint] NULL,
	[sync_create_peer_key] [int] NULL,
	PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedTableType [DataSync].[Professions_dss_BulkType_b453db25-2ba4-4e34-82d0-67141fe8639b]    Script Date: 9/24/2022 9:54:46 AM ******/
CREATE TYPE [DataSync].[Professions_dss_BulkType_b453db25-2ba4-4e34-82d0-67141fe8639b] AS TABLE(
	[ID] [int] NOT NULL,
	[Profession] [nvarchar](50) NULL,
	[sync_update_peer_timestamp] [bigint] NULL,
	[sync_update_peer_key] [int] NULL,
	[sync_create_peer_timestamp] [bigint] NULL,
	[sync_create_peer_key] [int] NULL,
	PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedTableType [DataSync].[RSSeries_dss_BulkType_b453db25-2ba4-4e34-82d0-67141fe8639b]    Script Date: 9/24/2022 9:54:46 AM ******/
CREATE TYPE [DataSync].[RSSeries_dss_BulkType_b453db25-2ba4-4e34-82d0-67141fe8639b] AS TABLE(
	[ID] [int] NOT NULL,
	[SeriesID] [int] NULL,
	[Title] [nvarchar](256) NULL,
	[URL] [nvarchar](300) NULL,
	[Description] [nvarchar](max) NULL,
	[Objectives] [nvarchar](max) NULL,
	[IsFacultyDevelopment] [bit] NULL,
	[Providership] [nvarchar](50) NULL,
	[StartDate] [smalldatetime] NULL,
	[EndDate] [smalldatetime] NULL,
	[Credits] [decimal](18, 2) NULL,
	[IsAccredited] [bit] NULL,
	[LocationKnown] [bit] NULL,
	[LocationName] [nvarchar](256) NULL,
	[LocationAddressLine1] [nvarchar](256) NULL,
	[LocationAddressLine2] [nvarchar](256) NULL,
	[LocationCity] [nvarchar](100) NULL,
	[LocationState] [nvarchar](2) NULL,
	[LocationZipCode] [nvarchar](5) NULL,
	[Latitude] [decimal](18, 6) NULL,
	[Longitude] [decimal](18, 6) NULL,
	[Status] [nvarchar](50) NULL,
	[ContactName] [nvarchar](256) NULL,
	[ContactDepartment] [nvarchar](256) NULL,
	[ContactEmail] [nvarchar](256) NULL,
	[ContactPhone] [nvarchar](50) NULL,
	[AdditionalInformation] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[sync_update_peer_timestamp] [bigint] NULL,
	[sync_update_peer_key] [int] NULL,
	[sync_create_peer_timestamp] [bigint] NULL,
	[sync_create_peer_key] [int] NULL,
	PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedTableType [DataSync].[RSSeriesRegistrations_dss_BulkType_b453db25-2ba4-4e34-82d0-67141fe8639b]    Script Date: 9/24/2022 9:54:46 AM ******/
CREATE TYPE [DataSync].[RSSeriesRegistrations_dss_BulkType_b453db25-2ba4-4e34-82d0-67141fe8639b] AS TABLE(
	[ID] [int] NOT NULL,
	[RSSeriesID] [int] NULL,
	[UserID] [nvarchar](128) NULL,
	[CreditHours] [decimal](18, 2) NULL,
	[IsDeleted] [bit] NULL,
	[sync_update_peer_timestamp] [bigint] NULL,
	[sync_update_peer_key] [int] NULL,
	[sync_create_peer_timestamp] [bigint] NULL,
	[sync_create_peer_key] [int] NULL,
	PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedTableType [DataSync].[RSSeriesSeries_dss_BulkType_b453db25-2ba4-4e34-82d0-67141fe8639b]    Script Date: 9/24/2022 9:54:46 AM ******/
CREATE TYPE [DataSync].[RSSeriesSeries_dss_BulkType_b453db25-2ba4-4e34-82d0-67141fe8639b] AS TABLE(
	[ID] [int] NOT NULL,
	[Name] [nvarchar](128) NULL,
	[URL] [nvarchar](128) NULL,
	[IsDeleted] [bit] NULL,
	[sync_update_peer_timestamp] [bigint] NULL,
	[sync_update_peer_key] [int] NULL,
	[sync_create_peer_timestamp] [bigint] NULL,
	[sync_create_peer_key] [int] NULL,
	PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedTableType [DataSync].[Specialties_dss_BulkType_b453db25-2ba4-4e34-82d0-67141fe8639b]    Script Date: 9/24/2022 9:54:46 AM ******/
CREATE TYPE [DataSync].[Specialties_dss_BulkType_b453db25-2ba4-4e34-82d0-67141fe8639b] AS TABLE(
	[ID] [int] NOT NULL,
	[Specialty] [nvarchar](128) NULL,
	[sync_update_peer_timestamp] [bigint] NULL,
	[sync_update_peer_key] [int] NULL,
	[sync_create_peer_timestamp] [bigint] NULL,
	[sync_create_peer_key] [int] NULL,
	PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedTableType [DataSync].[SubSpecialties_dss_BulkType_b453db25-2ba4-4e34-82d0-67141fe8639b]    Script Date: 9/24/2022 9:54:46 AM ******/
CREATE TYPE [DataSync].[SubSpecialties_dss_BulkType_b453db25-2ba4-4e34-82d0-67141fe8639b] AS TABLE(
	[ID] [int] NOT NULL,
	[ParentSpecialtyID] [int] NULL,
	[SubSpecialty] [nvarchar](128) NULL,
	[sync_update_peer_timestamp] [bigint] NULL,
	[sync_update_peer_key] [int] NULL,
	[sync_create_peer_timestamp] [bigint] NULL,
	[sync_create_peer_key] [int] NULL,
	PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedTableType [DataSync].[Titles_dss_BulkType_b453db25-2ba4-4e34-82d0-67141fe8639b]    Script Date: 9/24/2022 9:54:46 AM ******/
CREATE TYPE [DataSync].[Titles_dss_BulkType_b453db25-2ba4-4e34-82d0-67141fe8639b] AS TABLE(
	[ID] [int] NOT NULL,
	[Title] [nvarchar](25) NULL,
	[sync_update_peer_timestamp] [bigint] NULL,
	[sync_update_peer_key] [int] NULL,
	[sync_create_peer_timestamp] [bigint] NULL,
	[sync_create_peer_key] [int] NULL,
	PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedTableType [DataSync].[UserProfiles_dss_BulkType_b453db25-2ba4-4e34-82d0-67141fe8639b]    Script Date: 9/24/2022 9:54:46 AM ******/
CREATE TYPE [DataSync].[UserProfiles_dss_BulkType_b453db25-2ba4-4e34-82d0-67141fe8639b] AS TABLE(
	[UserID] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[TitleID] [int] NULL,
	[FirstName] [nvarchar](60) NULL,
	[MiddleName] [nvarchar](60) NULL,
	[LastName] [nvarchar](60) NULL,
	[ProfessionID] [int] NULL,
	[DegreeID] [int] NULL,
	[TraineeType] [nvarchar](128) NULL,
	[SpecialtyID] [int] NULL,
	[SubSpecialtyID] [int] NULL,
	[Phone] [nvarchar](50) NULL,
	[PhoneExtension] [nvarchar](50) NULL,
	[Fax] [nvarchar](50) NULL,
	[SpecialNeeds] [nvarchar](256) NULL,
	[Department] [nvarchar](128) NULL,
	[NameTag] [nvarchar](128) NULL,
	[Address1] [nvarchar](256) NULL,
	[Address2] [nvarchar](256) NULL,
	[City] [nvarchar](256) NULL,
	[State] [nvarchar](256) NULL,
	[ProvinceRegion] [nvarchar](256) NULL,
	[Country] [nvarchar](2) NULL,
	[ZipCode] [nvarchar](25) NULL,
	[PostalCode] [nvarchar](25) NULL,
	[IsDeleted] [bit] NULL,
	[StonyBrookID] [nvarchar](256) NULL,
	[NationalProviderIdentifier] [nvarchar](256) NULL,
	[StonyBrookMSOProviderID] [nvarchar](256) NULL,
	[sync_update_peer_timestamp] [bigint] NULL,
	[sync_update_peer_key] [int] NULL,
	[sync_create_peer_timestamp] [bigint] NULL,
	[sync_create_peer_key] [int] NULL,
	PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedTableType [dss].[TaskDependencyTableType]    Script Date: 9/24/2022 9:54:46 AM ******/
CREATE TYPE [dss].[TaskDependencyTableType] AS TABLE(
	[nexttaskid] [uniqueidentifier] NULL,
	[prevtaskid] [uniqueidentifier] NULL
)
GO
/****** Object:  UserDefinedTableType [dss].[TaskTableTypeV2]    Script Date: 9/24/2022 9:54:46 AM ******/
CREATE TYPE [dss].[TaskTableTypeV2] AS TABLE(
	[id] [uniqueidentifier] NULL,
	[actionid] [uniqueidentifier] NULL,
	[agentid] [uniqueidentifier] NULL,
	[request] [dss].[TASK_REQUEST_RESPONSE] NULL,
	[dependency_count] [int] NULL,
	[priority] [int] NULL DEFAULT ((100)),
	[type] [int] NULL,
	[version] [bigint] NULL DEFAULT ((0))
)
GO
/****** Object:  UserDefinedTableType [TaskHosting].[MessageListType]    Script Date: 9/24/2022 9:54:46 AM ******/
CREATE TYPE [TaskHosting].[MessageListType] AS TABLE(
	[MessageId] [uniqueidentifier] NOT NULL,
	[JobId] [uniqueidentifier] NOT NULL,
	[MessageType] [int] NOT NULL DEFAULT ((0)),
	[MessageData] [nvarchar](max) NULL,
	[Version] [bigint] NOT NULL DEFAULT ((0)),
	[TracingId] [uniqueidentifier] NULL,
	[QueueId] [uniqueidentifier] NULL
)
GO
/****** Object:  UserDefinedFunction [TaskHosting].[GetNextRunTime]    Script Date: 9/24/2022 9:54:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- create function to calculate the next run time of the schedule.

CREATE FUNCTION [TaskHosting].[GetNextRunTime]
	(@ScheduleId int)
	RETURNS DateTime
AS
BEGIN

DECLARE @type int
DECLARE @interval int

SELECT @Type = s.FreqType, @interval = s.FreqInterval
FROM TaskHosting.Schedule AS s
WHERE s.ScheduleId = @ScheduleId

IF (@@ROWCOUNT <= 0)
BEGIN
	return cast('No Such an ID.' as int);
END

DECLARE @NextRunTime DATETIME
IF (@Type = 2)
BEGIN
	SET @NextRunTime=DATEADD(SECOND, @interval, GETUTCDate())
END
ELSE IF (@Type = 4)
BEGIN
	SET @NextRunTime=DATEADD(MINUTE, @interval, GETUTCDate())
END
ELSE IF (@Type=8)
BEGIN
	SET @NextRunTime=DATEADD(HOUR, @interval, GETUTCDate())
END
ELSE
BEGIN
	return cast('No Such an type.' as int);
END


RETURN @NextRunTime


END



GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 9/24/2022 9:54:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 9/24/2022 9:54:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 9/24/2022 9:54:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 9/24/2022 9:54:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 9/24/2022 9:54:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[PasswordHashUpdated] [bit] NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Boards]    Script Date: 9/24/2022 9:54:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Boards](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Abbreviation] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Boards] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryMapping]    Script Date: 9/24/2022 9:54:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryMapping](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OldID] [int] NULL,
	[NewID] [int] NULL,
 CONSTRAINT [PK_CategoryMapping] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceCreditImportErrors]    Script Date: 9/24/2022 9:54:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceCreditImportErrors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreditImportID] [int] NOT NULL,
	[UserID] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[FirstName] [nvarchar](256) NOT NULL,
	[LastName] [nvarchar](256) NOT NULL,
	[Error] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ConferenceCreditImportErrors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceCreditImportRecords]    Script Date: 9/24/2022 9:54:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceCreditImportRecords](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreditImportID] [int] NOT NULL,
	[UserID] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[FirstName] [nvarchar](256) NOT NULL,
	[LastName] [nvarchar](256) NOT NULL,
	[CreditHours] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_ConferenceCreditImportRecords] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceCreditImports]    Script Date: 9/24/2022 9:54:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceCreditImports](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[FileLocation] [nvarchar](max) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[CreditNotificationsEnabled] [bit] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_ConferenceCreditImports] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceEvaluationCompetencies]    Script Date: 9/24/2022 9:54:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceEvaluationCompetencies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceEvaluationID] [int] NOT NULL,
	[Competency] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_ConferenceEvaluationCompetencies] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceEvaluationPanels]    Script Date: 9/24/2022 9:54:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceEvaluationPanels](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceEvaluationID] [int] NOT NULL,
	[ConferencePanelID] [int] NOT NULL,
	[ConferencePanelName] [nvarchar](256) NOT NULL,
	[PertinenceOfLecture] [int] NULL,
	[EffectivenessOfPresentation] [int] NULL,
	[UseOfAudioVisual] [int] NULL,
	[ComprehensivenessOfMaterial] [int] NULL,
	[PresentationFreeOfCommercialBias] [bit] NULL,
	[NoCommercialBiasReason] [int] NULL,
 CONSTRAINT [PK_ConferenceEvaluatonPanels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceEvaluationProgramResults]    Script Date: 9/24/2022 9:54:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceEvaluationProgramResults](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceEvaluationID] [int] NOT NULL,
	[Result] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_ConferenceEvaluationProgramResults] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceEvaluations]    Script Date: 9/24/2022 9:54:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceEvaluations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[ReferralSource] [nvarchar](128) NOT NULL,
	[WillYouMakeChanges] [bit] NOT NULL,
	[WillYouMakeChangesComments] [nvarchar](max) NOT NULL,
	[AdditionalComments] [nvarchar](max) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ReferralSourceOther] [nvarchar](max) NULL,
 CONSTRAINT [PK_ConferenceEvaluations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceEvaluationSpeakers]    Script Date: 9/24/2022 9:54:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceEvaluationSpeakers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceEvaluationID] [int] NOT NULL,
	[ConferenceSpeakerID] [int] NOT NULL,
	[SpeakerName] [nvarchar](121) NOT NULL,
	[SpeakerTitle] [nvarchar](50) NOT NULL,
	[TopicID] [int] NOT NULL,
	[Topic] [nvarchar](256) NOT NULL,
	[PertinenceOfLecture] [int] NULL,
	[EffectivenessOfPresentation] [int] NULL,
	[UseOfAudioVisual] [int] NULL,
	[ComprehensivenessOfMaterial] [int] NULL,
	[PresentationFreeOfCommercialBias] [bit] NULL,
	[NoCommercialBiasReason] [int] NULL,
 CONSTRAINT [PK_ConferenceEvaluatonSpeakers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceFiles]    Script Date: 9/24/2022 9:54:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceFiles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[Title] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
	[FileName] [nvarchar](256) NOT NULL,
	[Location] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[Rank] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[LoginRequired] [bit] NOT NULL,
	[RegisteredRequired] [bit] NOT NULL,
 CONSTRAINT [PK_ConferenceFiles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceJointProviders]    Script Date: 9/24/2022 9:54:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceJointProviders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_ConferenceJointProviders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceNotes]    Script Date: 9/24/2022 9:54:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceNotes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[Note] [nvarchar](max) NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ConferenceNotes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceOptions]    Script Date: 9/24/2022 9:54:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceOptions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Rank] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_ConferenceOptions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceOptionsGroups]    Script Date: 9/24/2022 9:54:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceOptionsGroups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
	[Required] [bit] NOT NULL,
	[MaxOneSelection] [bit] NOT NULL,
	[Rank] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ConferenceOptionsGroups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferencePanels]    Script Date: 9/24/2022 9:54:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferencePanels](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[PanelName] [nvarchar](256) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ConferencePanels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferencePanelSpeakers]    Script Date: 9/24/2022 9:54:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferencePanelSpeakers](
	[ConferenceSpeakerID] [int] NOT NULL,
	[ConferencePanelID] [int] NOT NULL,
 CONSTRAINT [PK_ConferencePanelSpeakers_1] PRIMARY KEY CLUSTERED 
(
	[ConferenceSpeakerID] ASC,
	[ConferencePanelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferencePrices]    Script Date: 9/24/2022 9:54:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferencePrices](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[Tier] [nvarchar](256) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[Rank] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ConferencePrices] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceQuestions]    Script Date: 9/24/2022 9:54:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceQuestions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[Question] [nvarchar](max) NULL,
 CONSTRAINT [PK_ConferenceQuestions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceRegistrationItems]    Script Date: 9/24/2022 9:54:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceRegistrationItems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceRegistrationID] [int] NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[PriceID] [int] NULL,
	[OptionID] [int] NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_ConferenceRegistrationItems] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceRegistrations]    Script Date: 9/24/2022 9:54:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceRegistrations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[CreditHours] [decimal](18, 2) NULL,
	[CreditAssignedOn] [datetime] NULL,
	[CreditAssignedBy] [nvarchar](128) NULL,
	[CreditLastUpdatedOn] [datetime] NULL,
	[CreditLastUpdatedBy] [nvarchar](128) NULL,
	[PaymentMethod] [nvarchar](50) NOT NULL,
	[PaymentAmount] [decimal](18, 2) NOT NULL,
	[IsCanceled] [bit] NULL,
	[IsDeleted] [bit] NOT NULL,
	[ConfirmationNumber] [nvarchar](256) NOT NULL,
	[EvaluationSent] [bit] NOT NULL,
	[EvaluationSentOn] [datetime] NULL,
	[EvaluationID] [int] NULL,
	[EvaluationCompletedOn] [datetime] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[FileAccessEnabled] [bit] NOT NULL,
	[MOCPoints] [decimal](18, 2) NULL,
	[MOCPointsAssignedOn] [datetime] NULL,
	[MOCPointsAssignedBy] [nvarchar](128) NULL,
	[MOCLastUpdatedOn] [datetime] NULL,
	[MOCLastUpdatedBy] [nvarchar](128) NULL,
 CONSTRAINT [PK_ConferenceRegistrations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conferences]    Script Date: 9/24/2022 9:54:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conferences](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](256) NOT NULL,
	[URL] [nvarchar](300) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Objectives] [nvarchar](max) NOT NULL,
	[Agenda] [nvarchar](max) NULL,
	[CEUs] [nvarchar](max) NULL,
	[Providership] [nvarchar](50) NOT NULL,
	[StartDate] [smalldatetime] NOT NULL,
	[EndDate] [smalldatetime] NOT NULL,
	[Credits] [decimal](18, 2) NULL,
	[IsAccredited] [bit] NOT NULL,
	[RegisterForMIPS] [bit] NULL,
	[LocationKnown] [bit] NOT NULL,
	[LocationName] [nvarchar](256) NOT NULL,
	[LocationAddressLine1] [nvarchar](256) NOT NULL,
	[LocationAddressLine2] [nvarchar](256) NOT NULL,
	[LocationCity] [nvarchar](100) NOT NULL,
	[LocationState] [nvarchar](2) NOT NULL,
	[LocationZipCode] [nvarchar](5) NOT NULL,
	[Latitude] [decimal](18, 6) NULL,
	[Longitude] [decimal](18, 6) NULL,
	[Status] [nvarchar](50) NOT NULL,
	[ContactName] [nvarchar](256) NOT NULL,
	[ContactDepartment] [nvarchar](256) NOT NULL,
	[ContactEmail] [nvarchar](256) NOT NULL,
	[ContactPhone] [nvarchar](50) NOT NULL,
	[MaxRegistrations] [int] NOT NULL,
	[WaitingListEnabled] [bit] NOT NULL,
	[PublicRegistrationEnabled] [bit] NOT NULL,
	[RegistrationNoticeEmails] [nvarchar](256) NOT NULL,
	[AdditionalInformation] [nvarchar](max) NOT NULL,
	[SendCreditNotifications] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ABMSPatientCareAndProceduralSkills] [bit] NOT NULL,
	[ABMSMedicalKnowledge] [bit] NOT NULL,
	[ABMSPracticeBasedLearningAndImprovement] [bit] NOT NULL,
	[ABMSInterpersonalAndCommunicationSkills] [bit] NOT NULL,
	[ABMSProfessionalism] [bit] NOT NULL,
	[ABMSSystemsBasedPractice] [bit] NOT NULL,
	[IOMProvidePatientCenteredCare] [bit] NOT NULL,
	[IOMWorkInInterdisciplinaryTeams] [bit] NOT NULL,
	[IOMEmployEvidenceBasedPractice] [bit] NOT NULL,
	[IOMApplyQualityImprovement] [bit] NOT NULL,
	[IOMUtilizeInformatics] [bit] NOT NULL,
	[IECValueEthicsForInterprofessionalPractice] [bit] NOT NULL,
	[IECRolesResponsibilities] [bit] NOT NULL,
	[IECInterprofessionalCommunication] [bit] NOT NULL,
	[IECTeamsAndTeamwork] [bit] NOT NULL,
	[OCCompetenciesOtherThanThoseListedWereAddressed] [bit] NOT NULL,
	[LocationCountry] [nvarchar](2) NOT NULL,
	[LocationProvinceRegion] [nvarchar](256) NOT NULL,
	[LocationPostalCode] [nvarchar](25) NOT NULL,
	[ExternalRegistrationButtonEnabled] [bit] NULL,
	[PublicRegistrationLinkText] [nvarchar](256) NULL,
	[PublicRegistrationLinkUrl] [nvarchar](max) NULL,
	[ConferenceType] [nvarchar](100) NULL,
	[MOCPoints] [decimal](18, 2) NULL,
	[IsMOCEligible] [bit] NULL,
	[ShowContactInformation] [bit] NULL,
	[LearnerCompetence] [bit] NULL,
	[LearnerCompetenceObjective] [bit] NULL,
	[LearnerCompetenceSubjective] [bit] NULL,
	[LearnerPerformance] [bit] NULL,
	[LearnerPerformanceObjective] [bit] NULL,
	[LearnerPerformanceSubjective] [bit] NULL,
	[PatientHealth] [bit] NULL,
	[PatientHealthObjective] [bit] NULL,
	[PatientHealthSubjective] [bit] NULL,
	[CommunityPopulationHealth] [bit] NULL,
	[CommunityPopulationHealthObjective] [bit] NULL,
	[CommunityPopulationHealthSubjective] [bit] NULL,
 CONSTRAINT [PK_Conferences] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceSpeakerChecklistAVNeeds]    Script Date: 9/24/2022 9:54:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceSpeakerChecklistAVNeeds](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceSpeakerChecklistID] [int] NOT NULL,
	[Need] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ConferenceSpeakerChecklistAVNeeds] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceSpeakerChecklistCVs]    Script Date: 9/24/2022 9:54:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceSpeakerChecklistCVs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceSpeakerChecklistID] [int] NOT NULL,
	[FileName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[FileLocation] [nvarchar](max) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_ConferenceSpeakerChecklistCVs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceSpeakerChecklistPresentationFiles]    Script Date: 9/24/2022 9:54:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceSpeakerChecklistPresentationFiles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceSpeakerChecklistID] [int] NOT NULL,
	[FileName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[FileLocation] [nvarchar](max) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[IsTemp] [bit] NOT NULL,
	[ProcessJobID] [nvarchar](max) NOT NULL,
	[ProcessTimeStamp] [datetime] NULL,
	[CompletedTimeStamp] [datetime] NULL,
 CONSTRAINT [PK_ConferenceSpeakerChecklistPresentationFiles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceSpeakerChecklists]    Script Date: 9/24/2022 9:54:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceSpeakerChecklists](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[ConferenceSpeakerID] [int] NOT NULL,
	[ObjectivesStatus] [nvarchar](50) NOT NULL,
	[ObjectivesValue] [nvarchar](max) NOT NULL,
	[ReferencesStatus] [nvarchar](50) NOT NULL,
	[ReferencesValue] [nvarchar](max) NOT NULL,
	[CVStatus] [nvarchar](50) NOT NULL,
	[PresentationFilesStatus] [nvarchar](50) NOT NULL,
	[AVNeedsStatus] [nvarchar](50) NOT NULL,
	[ReceiveEvaluationSummary] [bit] NOT NULL,
	[IsCompleted] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_ConferenceSpeakerChecklist] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceSpeakers]    Script Date: 9/24/2022 9:54:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceSpeakers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[SpeakerHours] [decimal](18, 2) NULL,
	[SpeakerHoursAssignedOn] [datetime] NULL,
	[SpeakerHoursAssignedBy] [nvarchar](128) NULL,
	[SpeakerHoursLastUpdatedOn] [datetime] NULL,
	[SpeakerHoursLastUpdatedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[FacultyDisclosureLastSent] [datetime] NULL,
	[FacultyDisclosureOnFile] [bit] NOT NULL,
	[FacultyDisclosureID] [int] NULL,
	[SpeakerCheckListLastSent] [datetime] NULL,
	[SpeakerCheckListOnFile] [bit] NOT NULL,
	[SpeakercheckListID] [int] NULL,
 CONSTRAINT [PK_ConferenceSpeakers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceSpeakerTopics]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceSpeakerTopics](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[ConferenceSpeakerID] [int] NOT NULL,
	[Topic] [nvarchar](256) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ConferenceSpeakerTopics] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceSpecialties]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceSpecialties](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[SpecialtyID] [int] NOT NULL,
 CONSTRAINT [PK_ConferenceSpecailties] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceStreams]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceStreams](
	[ID] [int] NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[StreamTitle] [nvarchar](256) NOT NULL,
	[StreamDescription] [nvarchar](max) NOT NULL,
	[StreamType] [nvarchar](100) NOT NULL,
	[StreamURL] [nvarchar](256) NOT NULL,
	[StartDateTime] [smalldatetime] NOT NULL,
	[EndDateTime] [smalldatetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ConferenceStreams] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceStreamViews]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceStreamViews](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[ConferenceStreamID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_ConferenceStreamViews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceViews]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceViews](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[IPAddress] [nvarchar](50) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_ConferenceViews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceWaitlist]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceWaitlist](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NULL,
	[LastUpdatedBy] [nvarchar](128) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsRegistered] [bit] NOT NULL,
 CONSTRAINT [PK_ConferenceWaitlist] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceWaitlistSettings]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceWaitlistSettings](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[WaitlistEnabled] [bit] NOT NULL,
	[MaxNumberRegistered] [int] NULL,
	[WaitlistNoticeEmails] [nvarchar](max) NULL,
 CONSTRAINT [PK_ConferenceWaitlistSettings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentManagementSystem]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentManagementSystem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MetaTitle] [nvarchar](256) NOT NULL,
	[MetaKeywords] [nvarchar](512) NOT NULL,
	[MetaDescription] [nvarchar](512) NOT NULL,
	[Page] [nvarchar](128) NOT NULL,
	[URL] [nvarchar](256) NOT NULL,
	[Headline] [nvarchar](256) NOT NULL,
	[Body] [nvarchar](max) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_ContentManagementSystem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Abbreviation] [nvarchar](2) NOT NULL,
	[Name] [nvarchar](80) NOT NULL,
	[UppercaseName] [nvarchar](80) NOT NULL,
	[AbbreviationThree] [nvarchar](3) NOT NULL,
	[NumberCode] [int] NOT NULL,
	[PhoneCode] [int] NOT NULL,
 CONSTRAINT [PK__Countrie__9C41170FBF4A75F1] PRIMARY KEY CLUSTERED 
(
	[Abbreviation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CreditNotifications]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreditNotifications](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[EventType] [nvarchar](50) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[SentOn] [datetime] NOT NULL,
	[SentBy] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_CreditNotifications] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Criteria]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Criteria](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[EventType] [nvarchar](100) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdateOn] [datetime] NULL,
	[LastUpdetedBy] [nvarchar](128) NULL,
	[CriteriaIsCompleted] [bit] NULL,
 CONSTRAINT [PK_Criteria] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Criteria23]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Criteria23](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[EnentType] [nvarchar](100) NOT NULL,
	[ActivityTitle] [nvarchar](max) NULL,
	[ActivityDate] [datetime] NULL,
	[ActivityFormat] [nvarchar](100) NULL,
	[PlannerProfessions] [nvarchar](max) NULL,
	[FacultyProfessions] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_CriteriaC23] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Criteria24]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Criteria24](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[EventType] [nvarchar](100) NOT NULL,
	[ActivityTitle] [nvarchar](max) NULL,
	[ActivityDate] [datetime] NULL,
	[ActivityFormat] [nvarchar](100) NULL,
	[PlannerList] [nvarchar](max) NULL,
	[FacultyList] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Criteria24] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Criteria25]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Criteria25](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[EventType] [nvarchar](100) NOT NULL,
	[ActivityTitle] [nvarchar](max) NULL,
	[ActivityDate] [datetime] NULL,
	[ActivityFormat] [nvarchar](100) NULL,
	[PlannerDescription] [nvarchar](max) NULL,
	[AttendeeDescription] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_CriteriaC25] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Criteria27]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Criteria27](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[EventType] [nvarchar](100) NOT NULL,
	[ActivityTitle] [nvarchar](max) NULL,
	[ActivityDate] [datetime] NULL,
	[ActivityFormat] [nvarchar](100) NULL,
	[StrategyDescription] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Criteria27] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Criteria28]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Criteria28](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[EventType] [nvarchar](100) NOT NULL,
	[CollabDescription1] [nvarchar](max) NULL,
	[CollabDescription2] [nvarchar](max) NULL,
	[CollabDescription3] [nvarchar](max) NULL,
	[CollabDescription4] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Criteria28] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Criteria30]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Criteria30](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[EventType] [nvarchar](100) NOT NULL,
	[ActivityName] [nvarchar](max) NULL,
	[ActivityDate] [datetime] NULL,
	[ActivityFormat] [nvarchar](100) NULL,
	[SkillDescription] [nvarchar](max) NULL,
	[FileUploadLocation] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Criteria30] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Criteria32]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Criteria32](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[EventType] [nvarchar](100) NOT NULL,
	[ActivityTitle] [nvarchar](max) NULL,
	[ActivityDate] [datetime] NULL,
	[ActivityFormat] [nvarchar](100) NULL,
	[SupportDescription] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Criteria32] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Criteria35]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Criteria35](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[EventType] [nvarchar](100) NOT NULL,
	[InnovationDescription1] [nvarchar](max) NULL,
	[InnovationDescription2] [nvarchar](max) NULL,
	[InnovationDescription3] [nvarchar](max) NULL,
	[InnovationDescription4] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Criteria35] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Criteria37]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Criteria37](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[EventType] [nvarchar](100) NOT NULL,
	[ImprovementDescription1] [nvarchar](max) NULL,
	[ImprovementDescription2] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Criteria37] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DegreeMapping]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DegreeMapping](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OldID] [int] NULL,
	[OldDegreeName] [nvarchar](256) NULL,
	[NewID] [int] NULL,
	[NewDegreeName] [nvarchar](256) NULL,
 CONSTRAINT [PK_DegreeMapping] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Degrees]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Degrees](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Degree] [nvarchar](50) NOT NULL,
	[IsEditable] [bit] NOT NULL,
	[CountsAsPhysician] [bit] NOT NULL,
	[OldID] [int] NULL,
 CONSTRAINT [PK_Degrees] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DuplicateUserRunIgnoreRecords]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DuplicateUserRunIgnoreRecords](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DuplicateUserRunID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[DuplicateUserID] [nvarchar](128) NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_DuplicateUserRunIgnoreRecords] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DuplicateUserRunRecords]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DuplicateUserRunRecords](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DuplicateUserRunID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[DuplicateUserID] [nvarchar](128) NOT NULL,
	[OSUIDMatch] [bit] NOT NULL,
	[NationalProviderIdentifierMatch] [bit] NOT NULL,
	[NameMatch] [bit] NOT NULL,
 CONSTRAINT [PK_DuplicateUserRunRecords] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DuplicateUserRuns]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DuplicateUserRuns](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DuplicateRunTime] [smalldatetime] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[IsComplete] [bit] NOT NULL,
	[Records] [int] NULL,
	[Completed] [int] NULL,
	[StartTimeStamp] [smalldatetime] NULL,
	[EndTimeStamp] [smalldatetime] NULL,
 CONSTRAINT [PK_DuplicateUserRuns] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailFrequencies]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailFrequencies](
	[Frequency] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EmailFrequencies_1] PRIMARY KEY CLUSTERED 
(
	[Frequency] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailHistory]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[EmailType] [nvarchar](50) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[SentBy] [nvarchar](128) NOT NULL,
	[EmailMessage] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_EmailHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailPreferences]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailPreferences](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[EmailType] [nvarchar](50) NOT NULL,
	[EmailFrequency] [nvarchar](50) NOT NULL,
	[LastUpdated] [datetime] NULL,
 CONSTRAINT [PK_EmailPreferences] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailQueueMessages]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailQueueMessages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmailQueueID] [int] NOT NULL,
	[SendDateTime] [smalldatetime] NOT NULL,
	[Parameters] [nvarchar](max) NOT NULL,
	[SendToUserID] [nvarchar](128) NOT NULL,
	[IsSent] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[SentOn] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_EmailQueueMessages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailQueues]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailQueues](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QueueName] [nvarchar](128) NOT NULL,
	[QueuePriority] [int] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_EmailQueues] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailTypes]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailTypes](
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EmailTypes] PRIMARY KEY CLUSTERED 
(
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialBoards]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialBoards](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialID] [int] NOT NULL,
	[BoardID] [int] NOT NULL,
 CONSTRAINT [PK_EnduringMaterialMOCBoards] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialCreditImportErrors]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialCreditImportErrors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreditImportID] [int] NOT NULL,
	[UserID] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[FirstName] [nvarchar](256) NOT NULL,
	[LastName] [nvarchar](256) NOT NULL,
	[Error] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_EnduringMaterialCreditImportErrors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialCreditImportRecords]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialCreditImportRecords](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreditImportID] [int] NOT NULL,
	[UserID] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[FirstName] [nvarchar](256) NOT NULL,
	[LastName] [nvarchar](256) NOT NULL,
	[CreditHours] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_EnduringMaterialCreditImportRecords] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialCreditImports]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialCreditImports](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialID] [int] NOT NULL,
	[FileLocation] [nvarchar](max) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[CreditNotificationsEnabled] [bit] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_EnduringMaterialCreditImports] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialEvaluationCompetencies]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialEvaluationCompetencies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialEvaluationID] [int] NOT NULL,
	[Competency] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_EnduringMaterialEvaluationCompetencies] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialEvaluationPanels]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialEvaluationPanels](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialEvaluationID] [int] NOT NULL,
	[EnduringMaterialPanelID] [int] NOT NULL,
	[EnduringMaterialPanelName] [nvarchar](256) NOT NULL,
	[PertinenceOfLecture] [int] NULL,
	[EffectivenessOfPresentation] [int] NULL,
	[UseOfAudioVisual] [int] NULL,
	[ComprehensivenessOfMaterial] [int] NULL,
	[PresentationFreeOfCommercialBias] [bit] NULL,
	[NoCommercialBiasReason] [int] NULL,
 CONSTRAINT [PK_EnduringMaterialEvaluatonPanels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialEvaluationProgramResults]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialEvaluationProgramResults](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialEvaluationID] [int] NOT NULL,
	[Result] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_EnduringMaterialEvaluationProgramResults] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialEvaluations]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialEvaluations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[EnduringMaterialID] [int] NOT NULL,
	[ReferralSource] [nvarchar](128) NOT NULL,
	[WillYouMakeChanges] [bit] NOT NULL,
	[WillYouMakeChangesComments] [nvarchar](max) NOT NULL,
	[AdditionalComments] [nvarchar](max) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ReferralSourceOther] [nvarchar](max) NULL,
 CONSTRAINT [PK_EnduringMaterialEvaluations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialEvaluationSpeakers]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialEvaluationSpeakers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialEvaluationID] [int] NOT NULL,
	[EnduringMaterialSpeakerID] [int] NOT NULL,
	[SpeakerName] [nvarchar](121) NOT NULL,
	[SpeakerTitle] [nvarchar](50) NOT NULL,
	[TopicID] [int] NOT NULL,
	[Topic] [nvarchar](256) NOT NULL,
	[PertinenceOfLecture] [int] NULL,
	[EffectivenessOfPresentation] [int] NULL,
	[UseOfAudioVisual] [int] NULL,
	[ComprehensivenessOfMaterial] [int] NULL,
	[PresentationFreeOfCommercialBias] [bit] NULL,
	[NoCommercialBiasReason] [int] NULL,
 CONSTRAINT [PK_EnduringMaterialEvaluatonSpeakers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialFiles]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialFiles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialID] [int] NOT NULL,
	[Title] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
	[FileName] [nvarchar](256) NOT NULL,
	[Location] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[Rank] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[LoginRequired] [bit] NOT NULL,
	[RegisteredRequired] [bit] NOT NULL,
 CONSTRAINT [PK_EnduringMaterialFiles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialJointProviders]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialJointProviders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialID] [int] NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_EnduringMaterialJointProviders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialNotes]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialNotes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialID] [int] NOT NULL,
	[Note] [nvarchar](max) NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_EnduringMaterialNotes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialOptions]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialOptions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Rank] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_EnduringMaterialOptions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialOptionsGroups]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialOptionsGroups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialID] [int] NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
	[Required] [bit] NOT NULL,
	[MaxOneSelection] [bit] NOT NULL,
	[Rank] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_EnduringMaterialOptionsGroups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialPanels]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialPanels](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialID] [int] NOT NULL,
	[PanelName] [nvarchar](256) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_EnduringMaterialPanels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialPanelSpeakers]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialPanelSpeakers](
	[EnduringMaterialSpeakerID] [int] NOT NULL,
	[EnduringMaterialPanelID] [int] NOT NULL,
 CONSTRAINT [PK_EnduringMaterialSpeakers_1] PRIMARY KEY CLUSTERED 
(
	[EnduringMaterialSpeakerID] ASC,
	[EnduringMaterialPanelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialPrices]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialPrices](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialID] [int] NOT NULL,
	[Tier] [nvarchar](256) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[Rank] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_EnduringMaterialPrices] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialRegistrationItems]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialRegistrationItems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialRegistrationID] [int] NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[PriceID] [int] NULL,
	[OptionID] [int] NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_EnduringMaterialRegistrationItems] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialRegistrations]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialRegistrations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[CreditHours] [decimal](18, 2) NULL,
	[CreditAssignedOn] [datetime] NULL,
	[CreditAssignedBy] [nvarchar](128) NULL,
	[CreditLastUpdatedOn] [datetime] NULL,
	[CreditLastUpdatedBy] [nvarchar](128) NULL,
	[PaymentMethod] [nvarchar](50) NOT NULL,
	[PaymentAmount] [decimal](18, 2) NOT NULL,
	[ConfirmationNumber] [nvarchar](256) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[EvaluationSent] [bit] NOT NULL,
	[EvaluationSentOn] [datetime] NULL,
	[EvaluationID] [int] NULL,
	[EvaluationCompletedOn] [datetime] NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[MOCPoints] [decimal](18, 2) NULL,
	[MOCPointsAssignedOn] [datetime] NULL,
	[MOCPointsAssignedBy] [nvarchar](128) NULL,
	[MOCLastUpdatedOn] [datetime] NULL,
	[MOCLastUpdatedBy] [nvarchar](128) NULL,
	[FileAccessEnabled] [bit] NOT NULL,
 CONSTRAINT [PK_EnduringMaterialRegistrations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterials]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterials](
	[ID] [int] NOT NULL,
	[EnduringMaterialSeriesID] [int] NOT NULL,
	[Title] [nvarchar](256) NOT NULL,
	[URL] [nvarchar](300) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Objectives] [nvarchar](max) NOT NULL,
	[IsFacultyDevelopment] [bit] NOT NULL,
	[Providership] [nvarchar](50) NOT NULL,
	[StartDate] [smalldatetime] NOT NULL,
	[EndDate] [smalldatetime] NOT NULL,
	[Credits] [decimal](18, 2) NULL,
	[IsAccredited] [bit] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[PublicRegistrationEnabled] [bit] NOT NULL,
	[PublicRegistrationLinkUrl] [nchar](512) NULL,
	[PublicRegistrationLinkText] [nchar](256) NULL,
	[ContactName] [nvarchar](256) NOT NULL,
	[ContactDepartment] [nvarchar](256) NOT NULL,
	[ContactEmail] [nvarchar](256) NOT NULL,
	[ContactPhone] [nvarchar](50) NOT NULL,
	[AdditionalInformation] [nvarchar](max) NOT NULL,
	[SendCreditNotifications] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ABMSPatientCareAndProceduralSkills] [bit] NOT NULL,
	[ABMSMedicalKnowledge] [bit] NOT NULL,
	[ABMSPracticeBasedLearningAndImprovement] [bit] NOT NULL,
	[ABMSInterpersonalAndCommunicationSkills] [bit] NOT NULL,
	[ABMSProfessionalism] [bit] NOT NULL,
	[ABMSSystemsBasedPractice] [bit] NOT NULL,
	[IOMProvidePatientCenteredCare] [bit] NOT NULL,
	[IOMWorkInInterdisciplinaryTeams] [bit] NOT NULL,
	[IOMEmployEvidenceBasedPractice] [bit] NOT NULL,
	[IOMApplyQualityImprovement] [bit] NOT NULL,
	[IOMUtilizeInformatics] [bit] NOT NULL,
	[IECValueEthicsForInterprofessionalPractice] [bit] NOT NULL,
	[IECRolesResponsibilities] [bit] NOT NULL,
	[IECInterprofessionalCommunication] [bit] NOT NULL,
	[IECTeamsAndTeamwork] [bit] NOT NULL,
	[OCCompetenciesOtherThanThoseListedWereAddressed] [bit] NOT NULL,
	[EnduringMaterialURL] [nvarchar](300) NULL,
	[ZipURL] [nvarchar](300) NULL,
	[Author] [nvarchar](max) NULL,
	[ExternalRegistrationButtonEnabled] [bit] NULL,
	[RegistrationNoticeEmails] [nvarchar](256) NULL,
	[Price] [decimal](18, 2) NULL,
	[IsMOCEligible] [bit] NULL,
	[MOCPoints] [decimal](18, 2) NULL,
	[MOCNotes] [nvarchar](max) NULL,
	[ACCMEActivityID] [nvarchar](128) NULL,
	[MOCReviewers] [nvarchar](max) NULL,
	[RegisterForMIPS] [bit] NULL,
	[LearnerCompetence] [bit] NULL,
	[LearnerCompetenceObjective] [bit] NULL,
	[LearnerCompetenceSubjective] [bit] NULL,
	[LearnerPerformance] [bit] NULL,
	[LearnerPerformanceObjective] [bit] NULL,
	[LearnerPerformanceSubjective] [bit] NULL,
	[PatientHealth] [bit] NULL,
	[PatientHealthObjective] [bit] NULL,
	[PatientHealthSubjective] [bit] NULL,
	[CommunityPopulationHealth] [bit] NULL,
	[CommunityPopulationHealthObjective] [bit] NULL,
	[CommunityPopulationHealthSubjective] [bit] NULL,
 CONSTRAINT [PK_EnduringMaterials] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialSeries]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialSeries](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[URL] [nvarchar](128) NOT NULL,
	[AttendanceOverrideExpiration] [datetime] NULL,
	[CreatedOn] [smalldatetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [smalldatetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_EnduringMaterialSeries] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialSpeakerChecklistCVs]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialSpeakerChecklistCVs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialSpeakerChecklistID] [int] NOT NULL,
	[FileName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[FileLocation] [nvarchar](max) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_EnduringMaterialSpeakerChecklistCVs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialSpeakerChecklistPresentationFiles]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialSpeakerChecklistPresentationFiles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialSpeakerChecklistID] [int] NOT NULL,
	[FileName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[FileLocation] [nvarchar](max) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[IsTemp] [bit] NOT NULL,
	[ProcessJobID] [nvarchar](max) NOT NULL,
	[ProcessTimeStamp] [datetime] NULL,
	[CompletedTimeStamp] [datetime] NULL,
 CONSTRAINT [PK_EnduringMaterialSpeakerChecklistPresentationFiles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialSpeakerChecklists]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialSpeakerChecklists](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[EnduringMaterialID] [int] NOT NULL,
	[EnduringMaterialSpeakerID] [int] NOT NULL,
	[ObjectivesStatus] [nvarchar](50) NOT NULL,
	[ObjectivesValue] [nvarchar](max) NOT NULL,
	[ReferencesStatus] [nvarchar](50) NOT NULL,
	[ReferencesValue] [nvarchar](max) NOT NULL,
	[CVStatus] [nvarchar](50) NOT NULL,
	[PresentationFilesStatus] [nvarchar](50) NOT NULL,
	[PresenterConsentFormStatus] [nvarchar](50) NOT NULL,
	[ReceiveEvaluationSummary] [bit] NOT NULL,
	[IsCompleted] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [date] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_EnduringMaterialSpeakerChecklist] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialSpeakerConsentForms]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialSpeakerConsentForms](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialID] [int] NOT NULL,
	[EnduringMaterialSpeakerID] [int] NOT NULL,
	[EnduringMaterialSpeakerChecklistID] [int] NOT NULL,
	[Status] [nchar](256) NOT NULL,
	[Type] [nchar](256) NOT NULL,
	[Signature] [nchar](256) NOT NULL,
	[SignatureDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_EnduringMaterialSpeakerConsentForms] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialSpeakers]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialSpeakers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[SpeakerHours] [decimal](18, 2) NULL,
	[SpeakerHoursAssignedOn] [datetime] NULL,
	[SpeakerHoursAssignedBy] [nvarchar](128) NULL,
	[SpeakerHoursLastUpdatedOn] [datetime] NULL,
	[SpeakerHoursLastUpdatedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[FacultyDisclosureLastSent] [datetime] NULL,
	[FacultyDisclosureOnFile] [bit] NOT NULL,
	[FacultyDisclosureID] [int] NULL,
	[SpeakerCheckListLastSent] [datetime] NULL,
	[SpeakerCheckListOnFile] [bit] NOT NULL,
	[SpeakercheckListID] [int] NULL,
 CONSTRAINT [PK_EnduringMaterialSpeakers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialSpeakerTopics]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialSpeakerTopics](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialID] [int] NOT NULL,
	[EnduringMaterialSpeakerID] [int] NOT NULL,
	[Topic] [nvarchar](256) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_EnduringMaterialSpeakerTopics] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialSpecialties]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialSpecialties](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialID] [int] NOT NULL,
	[SpecialtyID] [int] NOT NULL,
 CONSTRAINT [PK_EnduringMaterialSpecialties] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnduringMaterialViews]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnduringMaterialViews](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnduringMaterialID] [int] NOT NULL,
	[IPAddress] [nvarchar](50) NOT NULL,
	[TimeStamp] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_EnduringMaterialViews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Page] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[ErrorMessage] [nvarchar](max) NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Errors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventAdvertisers]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventAdvertisers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventType] [nvarchar](50) NOT NULL,
	[EventID] [int] NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Value] [decimal](18, 2) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_EventDisplays] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventExpenses]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventExpenses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventType] [nvarchar](50) NOT NULL,
	[EventID] [int] NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Value] [decimal](18, 2) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_EventExpenses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventPromoCode]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventPromoCode](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[EventType] [nvarchar](150) NOT NULL,
	[Code] [nvarchar](256) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[IsEmailRestricted] [bit] NOT NULL,
	[IsProfessionsRestricted] [bit] NOT NULL,
	[IsDegreesRestricted] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[LastUpdatedOn] [datetime] NULL,
	[LastUpdatedBy] [nvarchar](256) NULL,
	[RestrictedEmails] [nvarchar](512) NULL,
 CONSTRAINT [PK_EventPromoCode] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventPromoCodeDegreeRestriction]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventPromoCodeDegreeRestriction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventPromoCodeID] [int] NOT NULL,
	[DegreeID] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[LastUpdatedOn] [datetime] NULL,
	[LastUpdatedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_EventPromoCodeDegreeRestriction] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventPromoCodeEmailRestriction]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventPromoCodeEmailRestriction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventPromoCodeID] [int] NOT NULL,
	[EmailRestriction] [nvarchar](150) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[LastUpdatedOn] [datetime] NULL,
	[LastUpdatedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_EventPromoCodeEmailRestriction] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventPromoCodeProfessionRestriction]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventPromoCodeProfessionRestriction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventPromoCodeID] [int] NOT NULL,
	[ProfessionID] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[LastUpdatedOn] [datetime] NULL,
	[LastUpdatedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_EventPromoCodeProfessionRestriction] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventProvidership]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventProvidership](
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Providership] PRIMARY KEY CLUSTERED 
(
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventRevenues]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventRevenues](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventType] [nvarchar](50) NOT NULL,
	[EventID] [int] NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Type] [nvarchar](256) NOT NULL,
	[Value] [decimal](18, 2) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_EventRevenues] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventStatus]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventStatus](
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EventStatus] PRIMARY KEY CLUSTERED 
(
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventSupport]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventSupport](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventType] [nvarchar](50) NOT NULL,
	[EventID] [int] NOT NULL,
	[Type] [nvarchar](256) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Value] [decimal](18, 2) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[OtherText] [nvarchar](max) NULL,
 CONSTRAINT [PK_EventSupport] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventTypes]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventTypes](
	[EventType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EventTypes_1] PRIMARY KEY CLUSTERED 
(
	[EventType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacultyDisclosureCommercialInterests]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacultyDisclosureCommercialInterests](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FacultyDisclosureID] [int] NOT NULL,
	[CompanyName] [nvarchar](256) NOT NULL,
	[Relationship] [nvarchar](256) NOT NULL,
	[RelationshipEnded] [bit] NULL,
 CONSTRAINT [PK_FacultyDisclosureCommercialInterests] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacultyDisclosureRoles]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacultyDisclosureRoles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FacultyDisclosureID] [int] NOT NULL,
	[Role] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_FacultyDisclosureRoles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacultyDisclosures]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacultyDisclosures](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[EventType] [nvarchar](50) NULL,
	[EventID] [int] NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[Disclosure] [bit] NOT NULL,
	[ResolutionOfConflictPresentersAuthors] [nvarchar](max) NOT NULL,
	[ResolutionOfConflictPlannersActivityDirectors] [nvarchar](max) NOT NULL,
	[NonConflictedCoDirector] [nvarchar](256) NOT NULL,
	[FullName] [nvarchar](256) NOT NULL,
	[Expires] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_FacultyDisclosures] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HospitalAdmins]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HospitalAdmins](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HospitalID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[CreatedOn] [smalldatetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [smalldatetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_HospitalAdmins] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HospitalDocuments]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HospitalDocuments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[FileLocation] [nvarchar](max) NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[FileName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_HospitalDocuments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HospitalDocumentsHospitals]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HospitalDocumentsHospitals](
	[HospitalID] [int] NOT NULL,
	[DocumentID] [int] NOT NULL,
 CONSTRAINT [PK_HospitalDocumentsHospitals] PRIMARY KEY CLUSTERED 
(
	[HospitalID] ASC,
	[DocumentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HospitalGroupHospitals]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HospitalGroupHospitals](
	[GroupID] [int] NOT NULL,
	[HospitalID] [int] NOT NULL,
 CONSTRAINT [PK_HospitalGroupHospitals] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[HospitalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HospitalGroups]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HospitalGroups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HospitalGroupName] [nvarchar](256) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsDefault] [bit] NULL,
 CONSTRAINT [PK_HospitalGroups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hospitals]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospitals](
	[ID] [int] NOT NULL,
	[HospitalName] [nvarchar](256) NOT NULL,
	[MasterContactEmail] [nvarchar](256) NULL,
	[EmailContains] [nvarchar](max) NULL,
	[WebcastAccess] [bit] NOT NULL,
	[DownloadAccess] [bit] NOT NULL,
	[EnduringMaterialsAccess] [bit] NOT NULL,
	[AutoApprove] [bit] NOT NULL,
	[SendApprovalNotifications] [bit] NOT NULL,
	[SendCreditNotifications] [bit] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[Archived] [bit] NULL,
	[IsUpdated] [bit] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Hospitals] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HospitalUsers]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HospitalUsers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[HospitalID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsApproved] [bit] NULL,
	[RequestTimeStamp] [datetime] NULL,
	[ReviewedTimeStamp] [datetime] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](128) NULL,
 CONSTRAINT [PK_HospitalUsers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginLog]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[IPAddress] [nvarchar](256) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[AdminUserID] [nvarchar](128) NULL,
 CONSTRAINT [PK_LoginLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MOCCreditTypes]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MOCCreditTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_MOCCreditTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NelnetTransactionLog]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NelnetTransactionLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TransactionType] [nvarchar](256) NULL,
	[TransactionStatus] [nvarchar](256) NULL,
	[TransactionID] [nvarchar](256) NULL,
	[TransactionTotalAmount] [nvarchar](256) NULL,
	[OrderNumber] [nvarchar](256) NULL,
	[TrasactionDate] [nvarchar](256) NULL,
 CONSTRAINT [PK_NelnetTransactionLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentHistory]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventType] [nvarchar](50) NOT NULL,
	[EventID] [int] NOT NULL,
	[PaymentMethod] [nvarchar](50) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[ConfirmationNumber] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_PaymentHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethods]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethods](
	[Method] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PaymentMethods] PRIMARY KEY CLUSTERED 
(
	[Method] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProfessionMapping]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfessionMapping](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OldID] [int] NULL,
	[NewID] [int] NULL,
 CONSTRAINT [PK_ProfessionMapping] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Professions]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Profession] [nvarchar](50) NOT NULL,
	[OldID] [int] NULL,
 CONSTRAINT [PK_Professions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeries]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeries](
	[ID] [int] NOT NULL,
	[SeriesID] [int] NOT NULL,
	[Title] [nvarchar](256) NOT NULL,
	[URL] [nvarchar](300) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Objectives] [nvarchar](max) NOT NULL,
	[IsFacultyDevelopment] [bit] NOT NULL,
	[Providership] [nvarchar](50) NOT NULL,
	[StartDate] [smalldatetime] NOT NULL,
	[EndDate] [smalldatetime] NOT NULL,
	[Credits] [decimal](18, 2) NULL,
	[IsAccredited] [bit] NOT NULL,
	[LocationKnown] [bit] NOT NULL,
	[LocationName] [nvarchar](256) NOT NULL,
	[LocationAddressLine1] [nvarchar](256) NOT NULL,
	[LocationAddressLine2] [nvarchar](256) NOT NULL,
	[LocationCity] [nvarchar](100) NOT NULL,
	[LocationState] [nvarchar](2) NOT NULL,
	[LocationZipCode] [nvarchar](5) NOT NULL,
	[Latitude] [decimal](18, 6) NULL,
	[Longitude] [decimal](18, 6) NULL,
	[Status] [nvarchar](50) NOT NULL,
	[ContactName] [nvarchar](256) NOT NULL,
	[ContactDepartment] [nvarchar](256) NOT NULL,
	[ContactEmail] [nvarchar](256) NOT NULL,
	[ContactPhone] [nvarchar](50) NOT NULL,
	[AdditionalInformation] [nvarchar](max) NOT NULL,
	[SendCreditNotifications] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ABMSPatientCareAndProceduralSkills] [bit] NOT NULL,
	[ABMSMedicalKnowledge] [bit] NOT NULL,
	[ABMSPracticeBasedLearningAndImprovement] [bit] NOT NULL,
	[ABMSInterpersonalAndCommunicationSkills] [bit] NOT NULL,
	[ABMSProfessionalism] [bit] NOT NULL,
	[ABMSSystemsBasedPractice] [bit] NOT NULL,
	[IOMProvidePatientCenteredCare] [bit] NOT NULL,
	[IOMWorkInInterdisciplinaryTeams] [bit] NOT NULL,
	[IOMEmployEvidenceBasedPractice] [bit] NOT NULL,
	[IOMApplyQualityImprovement] [bit] NOT NULL,
	[IOMUtilizeInformatics] [bit] NOT NULL,
	[IECValueEthicsForInterprofessionalPractice] [bit] NOT NULL,
	[IECRolesResponsibilities] [bit] NOT NULL,
	[IECInterprofessionalCommunication] [bit] NOT NULL,
	[IECTeamsAndTeamwork] [bit] NOT NULL,
	[OCCompetenciesOtherThanThoseListedWereAddressed] [bit] NOT NULL,
	[RSSeriesType] [nvarchar](100) NULL,
	[IsMOCEligible] [bit] NULL,
	[MOCPoints] [decimal](18, 2) NULL,
	[ShowContactInformation] [bit] NULL,
	[LearnerCompetence] [bit] NULL,
	[LearnerCompetenceObjective] [bit] NULL,
	[LearnerCompetenceSubjective] [bit] NULL,
	[LearnerPerformance] [bit] NULL,
	[LearnerPerformanceObjective] [bit] NULL,
	[LearnerPerformanceSubjective] [bit] NULL,
	[PatientHealth] [bit] NULL,
	[PatientHealthObjective] [bit] NULL,
	[PatientHealthSubjective] [bit] NULL,
	[CommunityPopulationHealth] [bit] NULL,
	[CommunityPopulationHealthObjective] [bit] NULL,
	[CommunityPopulationHealthSubjective] [bit] NULL,
 CONSTRAINT [PK_RSSeries] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesCreditImportErrors]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesCreditImportErrors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreditImportID] [int] NOT NULL,
	[UserID] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[FirstName] [nvarchar](256) NOT NULL,
	[LastName] [nvarchar](256) NOT NULL,
	[Error] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_RSSeriesCreditImportErrors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesCreditImportRecords]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesCreditImportRecords](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreditImportID] [int] NOT NULL,
	[UserID] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[FirstName] [nvarchar](256) NOT NULL,
	[LastName] [nvarchar](256) NOT NULL,
	[CreditHours] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_RSSeriesCreditImportRecords] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesCreditImports]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesCreditImports](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesID] [int] NOT NULL,
	[FileLocation] [nvarchar](max) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[CreditNotificationsEnabled] [bit] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_RSSeriesCreditImports] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesEvaluationCompetencies]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesEvaluationCompetencies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesEvaluationID] [int] NOT NULL,
	[Competency] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_RSSeriesEvaluationCompetencies] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesEvaluationPanels]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesEvaluationPanels](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesEvaluationID] [int] NOT NULL,
	[RSSeriesPanelID] [int] NOT NULL,
	[RSSeriesPanelName] [nvarchar](256) NOT NULL,
	[PertinenceOfLecture] [int] NULL,
	[EffectivenessOfPresentation] [int] NULL,
	[UseOfAudioVisual] [int] NULL,
	[ComprehensivenessOfMaterial] [int] NULL,
	[PresentationFreeOfCommercialBias] [bit] NULL,
	[NoCommercialBiasReason] [int] NULL,
 CONSTRAINT [PK_RSSeriesEvaluatonPanels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesEvaluationProgramResults]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesEvaluationProgramResults](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesEvaluationID] [int] NOT NULL,
	[Result] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_RSSeriesEvaluationProgramResults] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesEvaluations]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesEvaluations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[RSSeriesID] [int] NOT NULL,
	[ReferralSource] [nvarchar](128) NOT NULL,
	[WillYouMakeChanges] [bit] NOT NULL,
	[WillYouMakeChangesComments] [nvarchar](max) NOT NULL,
	[AdditionalComments] [nvarchar](max) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ReferralSourceOther] [nvarchar](max) NULL,
 CONSTRAINT [PK_RSSeriesEvaluations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesEvaluationSpeakers]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesEvaluationSpeakers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesEvaluationID] [int] NOT NULL,
	[RSSeriesSpeakerID] [int] NOT NULL,
	[SpeakerName] [nvarchar](121) NOT NULL,
	[SpeakerTitle] [nvarchar](50) NOT NULL,
	[TopicID] [int] NOT NULL,
	[Topic] [nvarchar](256) NOT NULL,
	[PertinenceOfLecture] [int] NULL,
	[EffectivenessOfPresentation] [int] NULL,
	[UseOfAudioVisual] [int] NULL,
	[ComprehensivenessOfMaterial] [int] NULL,
	[PresentationFreeOfCommercialBias] [bit] NULL,
	[NoCommercialBiasReason] [int] NULL,
 CONSTRAINT [PK_RSSeriesEvaluatonSpeakers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesFiles]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesFiles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesID] [int] NOT NULL,
	[Title] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
	[FileName] [nvarchar](256) NOT NULL,
	[Location] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[Rank] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[LoginRequired] [bit] NOT NULL,
	[RegisteredRequired] [bit] NOT NULL,
 CONSTRAINT [PK_RSSeriesFiles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesJointProviders]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesJointProviders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesID] [int] NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_RSSeriesJointProviders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesNotes]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesNotes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesID] [int] NOT NULL,
	[Note] [nvarchar](max) NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_RSSeriesNotes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesPanels]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesPanels](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesID] [int] NOT NULL,
	[PanelName] [nvarchar](256) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_RSSeriesPanels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesPanelSpeakers]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesPanelSpeakers](
	[RSSeriesSpeakerID] [int] NOT NULL,
	[RSSeriesPanelID] [int] NOT NULL,
 CONSTRAINT [PK_RSSeriesPanelSpeakers_1] PRIMARY KEY CLUSTERED 
(
	[RSSeriesSpeakerID] ASC,
	[RSSeriesPanelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesRegistrations]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesRegistrations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[CreditHours] [decimal](18, 2) NULL,
	[CreditAssignedOn] [datetime] NULL,
	[CreditAssignedBy] [nvarchar](128) NULL,
	[CreditLastUpdatedOn] [datetime] NULL,
	[CreditLastUpdatedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[EvaluationSent] [bit] NOT NULL,
	[EvaluationSentOn] [datetime] NULL,
	[EvaluationID] [int] NULL,
	[EvaluationCompletedOn] [datetime] NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[MOCPoints] [decimal](18, 2) NULL,
	[MOCPointsAssignedOn] [datetime] NULL,
	[MOCPointsAssignedBy] [nvarchar](128) NULL,
	[MOCLastUpdatedOn] [datetime] NULL,
	[MOCLastUpdatedBy] [nvarchar](128) NULL,
 CONSTRAINT [PK_RSSeriesRegistrations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesSeries]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesSeries](
	[ID] [int] IDENTITY(113,1) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[URL] [nvarchar](128) NOT NULL,
	[AttendanceOverrideExpiration] [datetime] NULL,
	[CreatedOn] [smalldatetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [smalldatetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_RSSeriesSeries] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesSeriesAdmins]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesSeriesAdmins](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SeriesID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[CreatedOn] [smalldatetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [smalldatetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_RSSeriesSeriesAdmins] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesSeriesNotes]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesSeriesNotes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesSeriesID] [int] NOT NULL,
	[Note] [nvarchar](max) NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_RSSeriesSeriesNotes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesSeriesYearlyInfo]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesSeriesYearlyInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SeriesID] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[ActivityID] [nvarchar](128) NOT NULL,
	[IsMOCEligible] [bit] NULL,
	[MOCReviewers] [nvarchar](max) NULL,
	[Frequency] [nvarchar](max) NULL,
 CONSTRAINT [PK_RSSeriesActivityIDs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesSpeakerChecklistCVs]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesSpeakerChecklistCVs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesSpeakerChecklistID] [int] NOT NULL,
	[FileName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[FileLocation] [nvarchar](max) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_RSSeriesSpeakerChecklistCVs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesSpeakerChecklistPresentationFiles]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesSpeakerChecklistPresentationFiles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesSpeakerChecklistID] [int] NOT NULL,
	[FileName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[FileLocation] [nvarchar](max) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[IsTemp] [bit] NOT NULL,
	[ProcessJobID] [nvarchar](max) NOT NULL,
	[ProcessTimeStamp] [datetime] NULL,
	[CompletedTimeStamp] [datetime] NULL,
 CONSTRAINT [PK_RSSeriesSpeakerChecklistPresentationFiles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesSpeakerChecklists]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesSpeakerChecklists](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[RSSeriesID] [int] NOT NULL,
	[RSSeriesSpeakerID] [int] NOT NULL,
	[ObjectivesStatus] [nvarchar](50) NOT NULL,
	[ObjectivesValue] [nvarchar](max) NOT NULL,
	[ReferencesStatus] [nvarchar](50) NOT NULL,
	[ReferencesValue] [nvarchar](max) NOT NULL,
	[CVStatus] [nvarchar](50) NOT NULL,
	[PresentationFilesStatus] [nvarchar](50) NOT NULL,
	[ReceiveEvaluationSummary] [bit] NOT NULL,
	[IsCompleted] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [date] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_RSSeriesSpeakerChecklist] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesSpeakers]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesSpeakers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[SpeakerHours] [decimal](18, 2) NULL,
	[SpeakerHoursAssignedOn] [datetime] NULL,
	[SpeakerHoursAssignedBy] [nvarchar](128) NULL,
	[SpeakerHoursLastUpdatedOn] [datetime] NULL,
	[SpeakerHoursLastUpdatedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[FacultyDisclosureLastSent] [datetime] NULL,
	[FacultyDisclosureOnFile] [bit] NOT NULL,
	[FacultyDisclosureID] [int] NULL,
	[SpeakerCheckListLastSent] [datetime] NULL,
	[SpeakerCheckListOnFile] [bit] NOT NULL,
	[SpeakercheckListID] [int] NULL,
 CONSTRAINT [PK_RSSeriesSpeakers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesSpeakerTopics]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesSpeakerTopics](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesID] [int] NOT NULL,
	[RSSeriesSpeakerID] [int] NOT NULL,
	[Topic] [nvarchar](256) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_RSSeriesSpeakerTopics] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesSpecialties]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesSpecialties](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesID] [int] NOT NULL,
	[SpecialtyID] [int] NOT NULL,
 CONSTRAINT [PK_RSSeriesSpecialties] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesStreams]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesStreams](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesID] [int] NOT NULL,
	[StreamTitle] [nvarchar](256) NOT NULL,
	[StreamDescription] [nvarchar](max) NOT NULL,
	[StreamType] [nvarchar](100) NOT NULL,
	[StreamURL] [nvarchar](256) NOT NULL,
	[StartDateTime] [smalldatetime] NOT NULL,
	[EndDateTime] [smalldatetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_RSSeriesStreams] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesStreamViews]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesStreamViews](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesID] [int] NOT NULL,
	[RSSeriesStreamID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[AutoAttendanceAwarded] [bit] NULL,
	[AutoAttendanceAwardedOn] [datetime] NULL,
 CONSTRAINT [PK_RSSeriesStreamViews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSSeriesViews]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSSeriesViews](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RSSeriesID] [int] NOT NULL,
	[IPAddress] [nvarchar](50) NOT NULL,
	[TimeStamp] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_RSSeriesViews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
	[ItemCount] [int] NOT NULL,
	[IsDeleted] [bit] NULL,
	[IsCompleted] [bit] NULL,
	[PaidOn] [datetime] NULL,
	[ConfirmationNumber] [nvarchar](150) NULL,
	[AmountPaid] [decimal](18, 2) NULL,
 CONSTRAINT [PK_ShoppingCart] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCartItems]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCartItems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ShoppingCartID] [int] NOT NULL,
	[ItemType] [nvarchar](150) NOT NULL,
	[EventID] [int] NOT NULL,
	[PriceID] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Tier] [nvarchar](150) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ShoppingCartItems] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCartOptions]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCartOptions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CartItemID] [int] NOT NULL,
	[Value] [decimal](18, 2) NOT NULL,
	[Tier] [nvarchar](150) NOT NULL,
	[GroupID] [int] NOT NULL,
	[GroupName] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_ShoppingCartOptions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCartPromoCodes]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCartPromoCodes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ShoppingCartID] [int] NOT NULL,
	[PromoCodeID] [int] NOT NULL,
	[CartItemID] [int] NOT NULL,
	[EventID] [int] NOT NULL,
	[EventType] [nvarchar](150) NOT NULL,
	[Code] [nvarchar](150) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[StartDate] [smalldatetime] NOT NULL,
	[EndDate] [smalldatetime] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[LastUpdatedOn] [datetime] NULL,
	[LastUpdatedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NULL,
	[DiscountAmount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_ShoppingCartPromoCodes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SingleSignOnTokens]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SingleSignOnTokens](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[Token] [nvarchar](384) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUsed] [datetime] NULL,
	[IsUsed] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_SingleSignOnTokens] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specialties]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialties](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Specialty] [nvarchar](128) NOT NULL,
	[OldID] [int] NULL,
 CONSTRAINT [PK_Specialties] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpecialtyMapping]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecialtyMapping](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OldID] [int] NULL,
	[NewID] [int] NULL,
 CONSTRAINT [PK_SpecialtyMapping] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubSpecialties]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubSpecialties](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ParentSpecialtyID] [int] NOT NULL,
	[SubSpecialty] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_SubSpecialties] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Testing]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Testing](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[EventType] [nvarchar](100) NOT NULL,
	[TestType] [nvarchar](50) NOT NULL,
	[PassingGrade] [int] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[NumberOfAttempts] [int] NOT NULL,
	[Random] [bit] NULL,
	[Layout] [nvarchar](50) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Testing] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestingQuestions]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestingQuestions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TestID] [int] NOT NULL,
	[Rank] [int] NOT NULL,
	[QuestionTypeID] [int] NOT NULL,
	[QuestionText] [nvarchar](max) NOT NULL,
	[Explanation] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NULL,
	[LastUpdatedBy] [nvarchar](128) NULL,
	[FileName] [nvarchar](256) NULL,
	[VideoName] [nvarchar](128) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_TestingQuestions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestingQuestionsAnswers]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestingQuestionsAnswers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionID] [int] NOT NULL,
	[Position] [int] NOT NULL,
	[AnswerText] [nvarchar](max) NOT NULL,
	[CorrectAnswer] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NULL,
	[LastUpdatedBy] [nvarchar](128) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_TestingQuestionsAnswers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestingQuestionsFiles]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestingQuestionsFiles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionID] [int] NOT NULL,
	[FileName] [nvarchar](128) NOT NULL,
	[Location] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NULL,
	[LastUpdatedBy] [nvarchar](128) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_TestingQuestionsFiles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestingQuestionsTypes]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestingQuestionsTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Types] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_QuestionTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TitleMapping]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TitleMapping](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OldID] [int] NULL,
	[NewID] [int] NULL,
 CONSTRAINT [PK_TitleMapping] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Titles]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Titles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_Titles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UploadedFiles]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UploadedFiles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](256) NOT NULL,
	[FileLocation] [nvarchar](max) NOT NULL,
	[DateUploaded] [datetime] NOT NULL,
	[Folder] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_UploadedFiles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UploadedImages]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UploadedImages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](256) NOT NULL,
	[ImageLocation] [nvarchar](max) NOT NULL,
	[DateUploaded] [datetime] NOT NULL,
	[Folder] [nvarchar](256) NOT NULL,
 CONSTRAINT [PrimaryKey_c90fb949-a994-485f-bc56-cdc1f1cbe435] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserBoardIdentificationNumbers]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserBoardIdentificationNumbers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserProfileID] [nvarchar](128) NOT NULL,
	[BoardID] [int] NOT NULL,
	[IdentificationNumber] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_UserBoardIdentificationNumbers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserIDMapping]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserIDMapping](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OldUserID] [nvarchar](256) NOT NULL,
	[NewUserID] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_UserIDMapping] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserImportErrors]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserImportErrors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserImportID] [int] NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[FirstName] [nvarchar](256) NOT NULL,
	[LastName] [nvarchar](256) NOT NULL,
	[Error] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_UserImportErrors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserImportRecords]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserImportRecords](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserImportID] [int] NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[Title] [nvarchar](256) NOT NULL,
	[FirstName] [nvarchar](256) NOT NULL,
	[MiddleName] [nvarchar](256) NOT NULL,
	[LastName] [nvarchar](256) NOT NULL,
	[Profession] [nvarchar](256) NOT NULL,
	[Degree] [nvarchar](256) NOT NULL,
	[Specialty] [nvarchar](256) NOT NULL,
	[Phone] [nvarchar](256) NOT NULL,
	[PhoneExtension] [nvarchar](256) NOT NULL,
	[Fax] [nvarchar](256) NOT NULL,
	[SpecialNeeds] [nvarchar](256) NOT NULL,
	[Department] [nvarchar](256) NOT NULL,
	[NameTag] [nvarchar](256) NOT NULL,
	[Address1] [nvarchar](256) NOT NULL,
	[Address2] [nvarchar](256) NOT NULL,
	[City] [nvarchar](256) NOT NULL,
	[State] [nvarchar](256) NOT NULL,
	[ProvinceRegion] [nvarchar](256) NOT NULL,
	[Country] [nvarchar](256) NOT NULL,
	[ZipCode] [nvarchar](256) NOT NULL,
	[PostalCode] [nvarchar](256) NOT NULL,
	[NationalProviderIdentifier] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_UserImportRecords] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserImports]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserImports](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FileLocation] [nvarchar](max) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_UserImports] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserNotes]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserNotes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[Note] [nvarchar](max) NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_UserNotes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfiles]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfiles](
	[UserID] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[TitleID] [int] NOT NULL,
	[FirstName] [nvarchar](60) NOT NULL,
	[MiddleName] [nvarchar](60) NOT NULL,
	[LastName] [nvarchar](60) NOT NULL,
	[FullName]  AS (([FirstName]+' ')+[LastName]) PERSISTED NOT NULL,
	[ProfessionID] [int] NOT NULL,
	[DegreeID] [int] NOT NULL,
	[TraineeType] [nvarchar](128) NOT NULL,
	[SpecialtyID] [int] NOT NULL,
	[SubSpecialtyID] [int] NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[PhoneExtension] [nvarchar](50) NOT NULL,
	[Fax] [nvarchar](50) NOT NULL,
	[SpecialNeeds] [nvarchar](256) NOT NULL,
	[Department] [nvarchar](128) NOT NULL,
	[NameTag] [nvarchar](128) NOT NULL,
	[Address1] [nvarchar](256) NOT NULL,
	[Address2] [nvarchar](256) NOT NULL,
	[City] [nvarchar](256) NOT NULL,
	[State] [nvarchar](256) NOT NULL,
	[ProvinceRegion] [nvarchar](256) NOT NULL,
	[Country] [nvarchar](2) NOT NULL,
	[ZipCode] [nvarchar](25) NOT NULL,
	[PostalCode] [nvarchar](25) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[LastUpdatedOn] [datetime] NULL,
	[LastAccessedOn] [datetime] NULL,
	[EmailLastConfirmedOn] [smalldatetime] NULL,
	[ArchivedOn] [smalldatetime] NULL,
	[IsDeceased] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[OSUID] [nvarchar](256) NULL,
	[NationalProviderIdentifier] [nvarchar](256) NOT NULL,
	[AnnualFacultyDisclosureOverrideEnabled] [bit] NOT NULL,
	[AnnualFacultyDisclosureOverrideUpdatedOn] [datetime] NULL,
	[AnnualFacultyDisclosureOverrideUpdatedBy] [nvarchar](128) NULL,
	[AnnualFacultyDisclosureAccess]  AS (CONVERT([bit],case when [AnnualFacultyDisclosureOverrideEnabled]=(1) OR [Email] like '%@stonybrookmedicine.edu' OR [Email] like '%@stonybrook.edu' then (1) else (0) end)) PERSISTED,
	[IsBoardCertifiedPhysician] [bit] NULL,
	[Birthdate] [smalldatetime] NULL,
	[ABIMDiplomatNumber] [nvarchar](256) NULL,
	[HasAttested] [bit] NULL,
	[ProfileUpdated] [datetime] NULL,
 CONSTRAINT [PK__UserProf__1788CCAC69A80EED] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTestQuestionAnswers]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTestQuestionAnswers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserTestQuestionID] [int] NOT NULL,
	[TestingQuestionsAnswersID] [int] NULL,
	[AnswerText] [nvarchar](max) NULL,
	[FreeTextAnswer] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NULL,
	[LastUpdatedBy] [nvarchar](128) NULL,
 CONSTRAINT [PK_UserTestQuestionAnswers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTestQuestions]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTestQuestions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserTestID] [int] NOT NULL,
	[TestingQuestionsID] [int] NOT NULL,
	[QuestionType] [int] NOT NULL,
	[Rank] [int] NULL,
	[CorrectAnswerIDs] [nvarchar](max) NOT NULL,
	[CorrectAnswerText] [nvarchar](max) NOT NULL,
	[IsCorrect] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NULL,
	[LastUpdatedBy] [nvarchar](128) NULL,
 CONSTRAINT [PK_UserTestQuestions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTests]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTests](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TestingID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[EventID] [int] NOT NULL,
	[EventType] [nvarchar](100) NOT NULL,
	[TestType] [nvarchar](100) NOT NULL,
	[PaymentType] [nvarchar](100) NOT NULL,
	[IsSubmitted] [bit] NOT NULL,
	[SubmittedOn] [datetime] NULL,
	[SubmittedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NULL,
	[LastUpdatedBy] [nvarchar](128) NULL,
	[IsDeleted] [bit] NOT NULL,
	[TestPassingGrade] [int] NOT NULL,
	[Grade] [int] NULL,
	[IsPassed] [bit] NULL,
 CONSTRAINT [PK_UserTests] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastACCMEIDs]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastACCMEIDs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[ACCMEActivityID] [nvarchar](128) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_WebcastACCMEIDs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastBoards]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastBoards](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[BoardID] [int] NOT NULL,
 CONSTRAINT [PK_WebcastMOCBoards] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastCreditImportErrors]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastCreditImportErrors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreditImportID] [int] NOT NULL,
	[UserID] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[FirstName] [nvarchar](256) NOT NULL,
	[LastName] [nvarchar](256) NOT NULL,
	[Error] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_WebcastCreditImportErrors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastCreditImportRecords]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastCreditImportRecords](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreditImportID] [int] NOT NULL,
	[UserID] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[FirstName] [nvarchar](256) NOT NULL,
	[LastName] [nvarchar](256) NOT NULL,
	[CreditHours] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_WebcastCreditImportRecords] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastCreditImports]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastCreditImports](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[FileLocation] [nvarchar](max) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[CreditNotificationsEnabled] [bit] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_WebcastCreditImports] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastEvaluationCompetencies]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastEvaluationCompetencies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastEvaluationID] [int] NOT NULL,
	[Competency] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_WebcastEvaluationCompetencies] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastEvaluationPanels]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastEvaluationPanels](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastEvaluationID] [int] NOT NULL,
	[WebcastPanelID] [int] NOT NULL,
	[WebcastPanelName] [nvarchar](256) NOT NULL,
	[PertinenceOfLecture] [int] NULL,
	[EffectivenessOfPresentation] [int] NULL,
	[UseOfAudioVisual] [int] NULL,
	[ComprehensivenessOfMaterial] [int] NULL,
	[PresentationFreeOfCommercialBias] [bit] NULL,
	[NoCommercialBiasReason] [int] NULL,
 CONSTRAINT [PK_WebcastEvaluationPanels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastEvaluationProgramResults]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastEvaluationProgramResults](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastEvaluationID] [int] NOT NULL,
	[Result] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_WebcastEvaluationProgramResults] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastEvaluations]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastEvaluations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[ReferralSource] [nvarchar](128) NOT NULL,
	[WillYouMakeChanges] [bit] NOT NULL,
	[WillYouMakeChangesComments] [nvarchar](max) NOT NULL,
	[AdditionalComments] [nvarchar](max) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ReferralSourceOther] [nvarchar](max) NULL,
 CONSTRAINT [PK_WebcastEvaluations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastEvaluationSpeakers]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastEvaluationSpeakers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastEvaluationID] [int] NOT NULL,
	[WebcastSpeakerID] [int] NOT NULL,
	[SpeakerName] [nvarchar](121) NOT NULL,
	[SpeakerTitle] [nvarchar](50) NOT NULL,
	[TopicID] [int] NOT NULL,
	[Topic] [nvarchar](256) NOT NULL,
	[PertinenceOfLecture] [int] NULL,
	[EffectivenessOfPresentation] [int] NULL,
	[UseOfAudioVisual] [int] NULL,
	[ComprehensivenessOfMaterial] [int] NULL,
	[PresentationFreeOfCommercialBias] [bit] NULL,
	[NoCommercialBiasReason] [int] NULL,
 CONSTRAINT [PK_WebcastEvaluationSpeakers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastFiles]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastFiles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[Title] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
	[FileName] [nvarchar](256) NOT NULL,
	[Location] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[Rank] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[LoginRequired] [bit] NOT NULL,
	[RegisteredRequired] [bit] NOT NULL,
 CONSTRAINT [PK_WebcastFiles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastJointProviders]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastJointProviders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_WebcastJointProviders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastMOC]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastMOC](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[PARsDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_WebcastMOC] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastMOCCreditTypes]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastMOCCreditTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[MOCCreditTypeID] [int] NOT NULL,
 CONSTRAINT [PK_WebcastMOCCreditTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastNotes]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastNotes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[Note] [nvarchar](max) NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_WebcastNotes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastOptions]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastOptions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Rank] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_WebcastOptions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastOptionsGroups]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastOptionsGroups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
	[Required] [bit] NOT NULL,
	[MaxOneSelection] [bit] NOT NULL,
	[Rank] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_WebcastOptionsGroups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastPanels]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastPanels](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[PanelName] [nvarchar](256) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_WebcastPanels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastPanelSpeakers]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastPanelSpeakers](
	[WebcastSpeakerID] [int] NOT NULL,
	[WebcastPanelID] [int] NOT NULL,
 CONSTRAINT [PK_WebcastPanelSpeakers_1] PRIMARY KEY CLUSTERED 
(
	[WebcastSpeakerID] ASC,
	[WebcastPanelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastPrices]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastPrices](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[Tier] [nvarchar](256) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[Rank] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_WebcastPrices] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastQuestions]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastQuestions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TestID] [int] NOT NULL,
	[Question] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_WebcastQuestions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastRegistrationItems]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastRegistrationItems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastRegistrationID] [int] NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[PriceID] [int] NULL,
	[OptionID] [int] NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_WebcastRegistrationItems] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastRegistrations]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastRegistrations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[CreditHours] [decimal](18, 2) NULL,
	[CreditAssignedOn] [datetime] NULL,
	[CreditAssignedBy] [nvarchar](128) NULL,
	[CreditLastUpdatedOn] [datetime] NULL,
	[CreditLastUpdatedBy] [nvarchar](128) NULL,
	[PaymentMethod] [nvarchar](50) NOT NULL,
	[PaymentAmount] [decimal](18, 2) NOT NULL,
	[IsCanceled] [bit] NULL,
	[IsDeleted] [bit] NOT NULL,
	[ConfirmationNumber] [nvarchar](256) NOT NULL,
	[EvaluationSent] [bit] NOT NULL,
	[EvaluationSentOn] [datetime] NULL,
	[EvaluationID] [int] NULL,
	[EvaluationCompletedOn] [datetime] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[FileAccessEnabled] [bit] NOT NULL,
	[MOCPoints] [decimal](18, 2) NULL,
	[MOCPointsAssignedOn] [datetime] NULL,
	[MOCPointsAssignedBy] [nvarchar](128) NULL,
	[MOCLastUpdatedOn] [datetime] NULL,
	[MOCLastUpdatedBy] [nvarchar](128) NULL,
 CONSTRAINT [PK_WebcastRegistrations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Webcasts]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Webcasts](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](256) NOT NULL,
	[URL] [nvarchar](300) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Objectives] [nvarchar](max) NOT NULL,
	[Providership] [nvarchar](50) NOT NULL,
	[StartDate] [smalldatetime] NOT NULL,
	[EndDate] [smalldatetime] NOT NULL,
	[Credits] [decimal](18, 2) NULL,
	[IsAccredited] [bit] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[ContactName] [nvarchar](256) NOT NULL,
	[ContactDepartment] [nvarchar](256) NOT NULL,
	[ContactEmail] [nvarchar](256) NOT NULL,
	[ContactPhone] [nvarchar](50) NOT NULL,
	[PublicRegistrationEnabled] [bit] NOT NULL,
	[RegistrationNoticeEmails] [nvarchar](256) NOT NULL,
	[AdditionalInformation] [nvarchar](max) NULL,
	[SendCreditNotifications] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ABMSPatientCareAndProceduralSkills] [bit] NOT NULL,
	[ABMSMedicalKnowledge] [bit] NOT NULL,
	[ABMSPracticeBasedLearningAndImprovement] [bit] NOT NULL,
	[ABMSInterpersonalAndCommunicationSkills] [bit] NOT NULL,
	[ABMSProfessionalism] [bit] NOT NULL,
	[ABMSSystemsBasedPractice] [bit] NOT NULL,
	[IOMProvidePatientCenteredCare] [bit] NOT NULL,
	[IOMWorkInInterdisciplinaryTeams] [bit] NOT NULL,
	[IOMEmployEvidenceBasedPractice] [bit] NOT NULL,
	[IOMApplyQualityImprovement] [bit] NOT NULL,
	[IOMUtilizeInformatics] [bit] NOT NULL,
	[IECValueEthicsForInterprofessionalPractice] [bit] NOT NULL,
	[IECRolesResponsibilities] [bit] NOT NULL,
	[IECInterprofessionalCommunication] [bit] NOT NULL,
	[IECTeamsAndTeamwork] [bit] NOT NULL,
	[OCCompetenciesOtherThanThoseListedWereAddressed] [bit] NOT NULL,
	[ExternalRegistrationButtonEnabled] [bit] NULL,
	[PublicRegistrationLinkText] [nvarchar](256) NULL,
	[PublicRegistrationLinkUrl] [nvarchar](max) NULL,
	[Author] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NULL,
	[ZipURL] [nvarchar](300) NULL,
	[IsMOCEligible] [bit] NULL,
	[WebcastURL] [nvarchar](300) NULL,
	[MOCPoints] [decimal](18, 2) NULL,
	[MOCNotes] [nvarchar](max) NULL,
	[ACCMEActivityID] [nvarchar](128) NULL,
	[MOCReviewers] [nvarchar](max) NULL,
	[RegisterForMIPS] [bit] NULL,
	[LearnerCompetence] [bit] NULL,
	[LearnerCompetenceObjective] [bit] NULL,
	[LearnerCompetenceSubjective] [bit] NULL,
	[LearnerPerformance] [bit] NULL,
	[LearnerPerformanceObjective] [bit] NULL,
	[LearnerPerformanceSubjective] [bit] NULL,
	[PatientHealth] [bit] NULL,
	[PatientHealthObjective] [bit] NULL,
	[PatientHealthSubjective] [bit] NULL,
	[CommunityPopulationHealth] [bit] NULL,
	[CommunityPopulationHealthObjective] [bit] NULL,
	[CommunityPopulationHealthSubjective] [bit] NULL,
 CONSTRAINT [PK_Webcasts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastSpeakerChecklistAVNeeds]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastSpeakerChecklistAVNeeds](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastSpeakerChecklistID] [int] NOT NULL,
	[Need] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_WebcastSpeakerChecklistAVNeeds] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastSpeakerChecklistCVs]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastSpeakerChecklistCVs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastSpeakerChecklistID] [int] NOT NULL,
	[FileName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[FileLocation] [nvarchar](max) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_WebcastSpeakerChecklistCVs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastSpeakerChecklistPresentationFiles]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastSpeakerChecklistPresentationFiles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastSpeakerChecklistID] [int] NOT NULL,
	[FileName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[FileLocation] [nvarchar](max) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[IsTemp] [bit] NOT NULL,
	[ProcessJobID] [nvarchar](max) NOT NULL,
	[ProcessTimeStamp] [datetime] NULL,
	[CompletedTimeStamp] [datetime] NULL,
 CONSTRAINT [PK_WebcastSpeakerChecklistPresentationFiles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastSpeakerChecklists]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastSpeakerChecklists](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[WebcastSpeakerID] [int] NOT NULL,
	[ObjectivesStatus] [nvarchar](50) NOT NULL,
	[ObjectivesValue] [nvarchar](max) NOT NULL,
	[ReferencesStatus] [nvarchar](50) NOT NULL,
	[ReferencesValue] [nvarchar](max) NOT NULL,
	[CVStatus] [nvarchar](50) NOT NULL,
	[PresentationFilesStatus] [nvarchar](50) NOT NULL,
	[ReceiveEvaluationSummary] [bit] NOT NULL,
	[IsCompleted] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[PresenterConsentFormStatus] [nvarchar](50) NULL,
 CONSTRAINT [PK_WebcastSpeakerChecklist] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastSpeakerConsentForms]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastSpeakerConsentForms](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[WebcastSpeakerID] [int] NOT NULL,
	[WebcastSpeakerChecklistID] [int] NOT NULL,
	[Status] [nchar](256) NOT NULL,
	[Type] [nchar](256) NOT NULL,
	[Signature] [nchar](256) NOT NULL,
	[SignatureDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_WebcastSpeakerConsentForms] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastSpeakers]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastSpeakers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[SpeakerHours] [decimal](18, 2) NULL,
	[SpeakerHoursAssignedOn] [datetime] NULL,
	[SpeakerHoursAssignedBy] [nvarchar](128) NULL,
	[SpeakerHoursLastUpdatedOn] [datetime] NULL,
	[SpeakerHoursLastUpdatedBy] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[FacultyDisclosureLastSent] [datetime] NULL,
	[FacultyDisclosureOnFile] [bit] NOT NULL,
	[FacultyDisclosureID] [int] NULL,
	[SpeakerCheckListLastSent] [datetime] NULL,
	[SpeakerCheckListOnFile] [bit] NOT NULL,
	[SpeakercheckListID] [int] NULL,
 CONSTRAINT [PK_WebcastSpeakers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastSpeakerTopics]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastSpeakerTopics](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[WebcastSpeakerID] [int] NOT NULL,
	[Topic] [nvarchar](256) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_WebcastSpeakerTopics] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastSpecialties]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastSpecialties](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[SpecialtyID] [int] NOT NULL,
 CONSTRAINT [PK_WebcastSpecailties] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastsViews]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastsViews](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_WebcastsViews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastTest]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastTest](
	[ID] [int] NOT NULL,
	[WebcastID] [int] NOT NULL,
	[TestType] [nvarchar](256) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[LastUpdatedOn] [datetime] NULL,
	[LastUpdatedBy] [nvarchar](128) NULL,
	[PassingGrade] [float] NULL,
	[Price] [decimal](18, 2) NULL,
	[IsFree] [bit] NULL,
	[IsOSUFree] [bit] NULL,
	[NumberOfTimesTaken] [int] NULL,
	[IsHospitalSubscriptionFree] [bit] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_WebcastTest] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebcastViews]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebcastViews](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WebcastID] [int] NOT NULL,
	[IPAddress] [nvarchar](50) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_WebcastViews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[AggregatedCounter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [bigint] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_CounterAggregated] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Counter]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Counter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [smallint] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Counter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Hash]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Hash](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Field] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime2](7) NULL,
 CONSTRAINT [PK_HangFire_Hash] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Job]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Job](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StateId] [int] NULL,
	[StateName] [nvarchar](20) NULL,
	[InvocationData] [nvarchar](max) NOT NULL,
	[Arguments] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Job] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobParameter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobId] [int] NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_JobParameter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobQueue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobId] [int] NOT NULL,
	[Queue] [nvarchar](50) NOT NULL,
	[FetchedAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_JobQueue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[List]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[List](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_List] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Schema]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Schema](
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_HangFire_Schema] PRIMARY KEY CLUSTERED 
(
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Server]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Server](
	[Id] [nvarchar](100) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[LastHeartbeat] [datetime] NOT NULL,
 CONSTRAINT [PK_HangFire_Server] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Set]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Set](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Score] [float] NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Set] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[State]    Script Date: 9/24/2022 9:54:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[State](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobId] [int] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Reason] [nvarchar](100) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Data] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_State] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'ConferenceAdmin', N'Conference Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'EnduringMaterialAdmin', N'Enduring Material Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'HospitalAdmin', N'Hospital Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'IndividualHospitalAdmin', N'Individual Hospital Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'IndividualRSSeriesAdmin', N'Individual RSSeries Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'MasterAdmin', N'Master Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'RSSeriesAdmin', N'RSSeries Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'WebcastAdmin', N'Webcast Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'WebsiteAdmin', N'Website Admin')
GO
SET IDENTITY_INSERT [dbo].[Boards] ON 

INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (3, N'ABAI', N'The American Board of Allergy and Immunology ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (4, N'ABA', N'The American Board of Anesthesiology ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (5, N'ABCRS', N'The American Board of Colon and Rectal Surgery ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (6, N'ABD', N'The American Board of Dermatology ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (7, N'ABEM', N'The American Board of Emergency Medicine ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (8, N'ABFM', N'The American Board of Family Medicine ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (9, N'ABIM', N'The American Board of Internal Medicine ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (10, N'ABMGG', N'The American Board of Medical Genetics and Genomics ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (11, N'ABNS', N'The American Board of Neurological Surgery ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (12, N'ABNM', N'The American Board of Nuclear Medicine ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (13, N'ABOG', N'The American Board of Obstetrics and Gynecology ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (14, N'ABOP', N'The American Board of Ophthalmology ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (15, N'ABOS', N'The American Board of Orthopaedic Surgery ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (16, N'ABOTO', N'The American Board of Otolaryngology ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (17, N'ABPATH', N'The American Board of Pathology ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (18, N'ABP', N'The American Board of Pediatrics ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (19, N'ABPMR', N'The American Board of Physical Medicine and Rehabilitation ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (20, N'ABPS', N'The American Board of Plastic Surgery ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (21, N'ABPM', N'The American Board of Preventive Medicine ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (22, N'ABPN', N'The American Board of Psychiatry and Neurology ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (23, N'ABR', N'The American Board of Radiology ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (24, N'ABS', N'The American Board of Surgery ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (25, N'ABTS', N'The American Board of Thoracic Surgery ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (26, N'ABU', N'The American Board of Urology ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (27, N'ABAI', N'The American Board of Allergy and Immunology ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (28, N'ABA', N'The American Board of Anesthesiology ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (29, N'ABCRS', N'The American Board of Colon and Rectal Surgery ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (30, N'ABD', N'The American Board of Dermatology ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (31, N'ABEM', N'The American Board of Emergency Medicine ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (32, N'ABFM', N'The American Board of Family Medicine ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (33, N'ABIM', N'The American Board of Internal Medicine ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (34, N'ABMGG', N'The American Board of Medical Genetics and Genomics ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (35, N'ABNS', N'The American Board of Neurological Surgery ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (36, N'ABNM', N'The American Board of Nuclear Medicine ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (37, N'ABOG', N'The American Board of Obstetrics and Gynecology ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (38, N'ABOP', N'The American Board of Ophthalmology ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (39, N'ABOS', N'The American Board of Orthopaedic Surgery ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (40, N'ABOTO', N'The American Board of Otolaryngology ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (41, N'ABPATH', N'The American Board of Pathology ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (42, N'ABP', N'The American Board of Pediatrics ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (43, N'ABPMR', N'The American Board of Physical Medicine and Rehabilitation ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (44, N'ABPS', N'The American Board of Plastic Surgery ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (45, N'ABPM', N'The American Board of Preventive Medicine ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (46, N'ABPN', N'The American Board of Psychiatry and Neurology ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (47, N'ABR', N'The American Board of Radiology ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (48, N'ABS', N'The American Board of Surgery ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (49, N'ABTS', N'The American Board of Thoracic Surgery ')
INSERT [dbo].[Boards] ([ID], [Abbreviation], [Name]) VALUES (50, N'ABU', N'The American Board of Urology ')
SET IDENTITY_INSERT [dbo].[Boards] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoryMapping] ON 

INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (1, 3, 1)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (2, 120, 1)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (3, 51, 1)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (4, 185, 1)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (5, 100, 1)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (6, 7, 2)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (7, 5, 2)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (8, 24, 3)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (9, 155, 3)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (10, 29, 5)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (11, 32, 6)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (12, 174, 8)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (13, 191, 8)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (14, 37, 8)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (15, 41, 8)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (16, 45, 8)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (17, 53, 9)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (18, 117, 9)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (19, 61, 11)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (20, 65, 12)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (21, 137, 13)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (22, 46, 13)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (23, 68, 13)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (24, 69, 13)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (25, 113, 13)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (26, 173, 14)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (27, 72, 14)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (28, 73, 14)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (29, 74, 16)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (30, 132, 18)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (31, 47, 18)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (32, 4, 19)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (33, 13, 19)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (34, 14, 19)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (35, 22, 19)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (36, 26, 19)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (37, 111, 19)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (38, 8, 20)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (39, 190, 20)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (40, 48, 20)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (41, 75, 20)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (42, 76, 20)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (43, 102, 20)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (44, 6, 21)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (45, 38, 21)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (46, 56, 21)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (47, 58, 21)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (48, 63, 21)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (49, 78, 21)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (50, 23, 21)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (51, 86, 21)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (52, 104, 21)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (53, 148, 21)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (54, 1, 23)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (55, 79, 23)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (56, 172, 25)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (57, 146, 25)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (58, 149, 25)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (59, 84, 25)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (60, 85, 25)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (61, 96, 25)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (62, 87, 26)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (63, 89, 27)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (64, 112, 27)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (65, 181, 29)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (66, 180, 29)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (67, 17, 29)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (68, 168, 29)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (69, 21, 29)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (70, 169, 29)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (71, 31, 29)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (72, 90, 29)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (73, 95, 30)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (74, 43, 31)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (75, 57, 31)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (76, 162, 31)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (77, 106, 32)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (78, 36, 33)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (79, 105, 33)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (80, 179, 34)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (81, 163, 34)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (82, 109, 34)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (83, 110, 35)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (84, 9, 40)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (85, 10, 40)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (86, 11, 40)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (87, 160, 41)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (88, 70, 44)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (89, 136, 44)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (90, 125, 44)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (91, 42, 45)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (92, 135, 45)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (93, 92, 45)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (94, 94, 46)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (95, 138, 49)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (96, 64, 49)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (97, 62, 49)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (98, 159, 49)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (99, 114, 50)
GO
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (100, 101, 51)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (101, 88, 53)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (102, 130, 54)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (103, 161, 55)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (104, 122, 55)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (105, 50, 55)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (106, 77, 55)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (107, 134, 55)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (108, 16, 56)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (109, 141, 56)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (110, 59, 56)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (111, 71, 56)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (112, 140, 56)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (113, 91, 57)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (114, 28, 58)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (115, 150, 59)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (116, 133, 59)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (117, 129, 59)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (118, 12, 59)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (119, 128, 59)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (120, 189, 59)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (121, 97, 59)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (122, 54, 59)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (123, 115, 59)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (124, 131, 59)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (125, 2, 60)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (126, 25, 60)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (127, 18, 62)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (128, 19, 62)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (129, 119, 62)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (130, 20, 62)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (131, 167, 62)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (132, 121, 62)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (133, 170, 62)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (134, 171, 62)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (135, 80, 62)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (136, 188, 62)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (137, 27, 64)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (138, 178, 64)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (139, 142, 64)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (140, 164, 65)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (141, 15, 65)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (142, 30, 65)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (143, 33, 65)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (144, 55, 65)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (145, 152, 65)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (146, 177, 66)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (147, 39, 66)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (148, 40, 66)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (149, 145, 66)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (150, 186, 66)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (151, 166, 67)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (152, 165, 67)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (153, 49, 67)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (154, 158, 67)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (155, 126, 68)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (156, 44, 69)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (157, 182, 70)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (158, 34, 70)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (159, 35, 70)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (160, 183, 70)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (161, 52, 70)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (162, 156, 70)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (163, 157, 70)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (164, 60, 71)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (165, 144, 71)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (166, 66, 72)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (167, 118, 73)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (168, 176, 73)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (169, 175, 73)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (170, 67, 73)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (171, 192, 73)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (172, 103, 74)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (173, 139, 75)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (174, 127, 75)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (175, 107, 75)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (176, 147, 76)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (177, 153, 76)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (178, 108, 76)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (179, 184, 76)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (180, 81, 77)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (181, 83, 77)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (182, 82, 77)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (183, 143, 79)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (184, 151, 79)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (185, 123, 79)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (186, 93, 79)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (187, 98, 79)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (188, 99, 79)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (189, 187, 79)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (190, 124, 79)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (191, 154, 79)
Go
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (192, 193, 81)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (193, 194, 82)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (194, 195, 83)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (195, 196, 84)
INSERT [dbo].[CategoryMapping] ([ID], [OldID], [NewID]) VALUES (196, 197, 85)
SET IDENTITY_INSERT [dbo].[CategoryMapping] OFF
GO
SET IDENTITY_INSERT [dbo].[ContentManagementSystem] ON 

INSERT [dbo].[ContentManagementSystem] ([ID], [MetaTitle], [MetaKeywords], [MetaDescription], [Page], [URL], [Headline], [Body], [LastUpdatedOn], [LastUpdatedBy]) VALUES (1, N'About Us', N'Test Keywords', N'Test Description', N'About Us', N'/additional-information/about-us', N'About Us', N'<p>
                        The Office of Continuing Medical Education (CME) was established shortly after the opening of the Medical School and since 1979 has been fully accredited by the Accreditation Council for Continuing Medical Education as a national provider of CME. After ACCME’s latest review, Stony Brook was awarded Accreditation with Commendation, their highest performance rating. All our CME activities are evidence-based and free of commercial bias.
                    </p>
                    <p>
                        The Medical School has about 860 faculty members representing all specialties of medicine who are available to teach within our active CME program. Their teaching translates cutting-edge research from the laboratory to the bedside and into office practice. Inter-professional training is facilitated by the proximity and culture among the several professional schools within Stony Brook Medicine, our academic medical center. 
                    </p>
                    <p>
                        Educational formats include conferences, grand rounds, seminars and workshops. A case-based or problem-based approach, simulations or role-playing are regularly used in workshops to foster both motivation and interactive involvement in order to facilitate learning. Skills workshops can use anatomy labs, animal surgery; simulated patients or live-case presentations. Other more self-directed types of offerings include self-assessments as part of enduring materials and other web-based activities. We have a wealth of experience from conducting annual CME courses some spanning several decades, e.g., in family medicine, breast imaging, obstetrics and gynecology, orthopedics, which continue to update physicians with new approaches to improving the prevention, diagnosis and management of disease, and for promoting health.
                    </p>
                    <section id="learning-material" style="margin-top: 20px;">
                        <article class="learning-material">
                            <figure class="learning-material-picture"><img src="~/Content/Images/dorothy-lane.jpg" alt=""></figure>
                            <div class="learning-material-description">
                                <h4>Dorothy S. Lane, MD, MPH</h4>
                                <figure>Associate Dean for CME</figure>
                                <p>
                                    Dr. Dorothy Lane is a State University of New York Distinguished Service Professor and the Associate Dean for Continuing Medical Education (CME) at the Stony Brook University School of Medicine.
                                </p>
                                <p><a href="/additional-information/dr-lane-associate-dean-continuing-medical-education" class="read-more">Learn more</a></p>
                            </div>
                        </article>
                    </section>
                    <h2>Purpose</h2>
                    <p>
                        The purpose of Continuing Medical Education is to maintain and improve physician competency to optimize patient care by means of offering quality learning experiences for physicians. These activities should permit physicians to fulfill CME requirements for relicensure, maintenance of certification, hospital privileges and medical or specialty society membership.
                    </p>
                    <h2>Content Areas</h2>
                    <p>
                        The CME content encompasses that body of knowledge and skills generally recognized and accepted by the profession as within the basic medical sciences, the discipline of clinical medicine and the provision of health care to the public. The content of each activity is based on the perceived and documented needs of a specific or target group. The objectives of activities are expressed in terms of measurable outcomes and link the needs in knowledge, competence or performance to the desired results. Recommendations for patient care are evidence-based and free of commercial bias. Specific areas of content to be addressed include the major clinical and research themes of the medical school’s strategic plan: cardiovascular health and disease, cancer, neurosciences, infectious disease and immunology, diseases of women and children, emergency medicine and trauma, and gastrointestinal disease. The content frequently includes the prevention, diagnosis and treatment of disease, clinical research and training the trainers. In addition, the content encompasses the ACGME/ABMS general (core) physician competencies (medical knowledge, patient care, interpersonal communication skills, practice-based learning and improvement, systems-based practice, and professionalism).
                    </p>
                    <h2>Type of Activites</h2>
                    <p>
                        The School of Medicine, through its Office of Continuing Medical Education (OCME), will provide, co-provide or jointly provide Continuing Medical Education (CME) activities including regularly scheduled conferences, courses and enduring materials. The methods of instruction are varied to offer different types of learning experiences, appealing to diverse and individual learning styles and practice setting requirements. They include live conferences; interactive audio, video and electronic programs; self-study materials and hands-on training, e.g., procedural skills training, simulations, standardized patients.
                    </p>
                    <h2>Target Audience</h2>
                    <p>
                        The School of Medicine is the only medical school located in Suffolk County. The population of the county is over 1.5 million people. The number of practicing physicians on Long Island is 11,959. These physicians are a primary group for the medical school to address in Continuing Medical Education in order to spare these physicians excessive travel and loss of time from practice. The School of Medicine also contributes to improvement of the quality of health care nationally through its educational leadership and provision of CME activities for physicians throughout the country.
                    </p>
                    <p>
                        In addition to providing undergraduate medical education, the School of Medicine must inculcate in medical students and residents the awareness of the continuing need for learning throughout their professional careers. To reinforce this principle, the School must demonstrate its commitment to continuing education through provision of resources to support its CME mission of lifelong learning. There will be linkage and collaboration across the continuum of education, encompassing medical students, GME and CME.
                    </p>
                    <h2>
                        Expected Results
                    </h2>
                    <p>
                        Multiple methods will be used to determine and continuously improve our effectiveness in meeting identified gaps between current practice and ideal practice. These methods include pre-post testing, self-reported or observed changes in competence, self-reported or medical record documented changes in practice, patient survey or medical record documented changes in patient outcomes, etc. Both qualitative and quantitative approaches will be incorporated to assess changes in knowledge, competency, or performance or patient outcomes. The expected results of the evaluation of the overall program will be determined by measuring progress towards meeting selected benchmarks and will be used to guide improvements. Specifically these benchmarks include evidence-based measures promulgated by: medical/specialty society practice guidelines, recommendations of the US Preventive Services Task Force, Institute for Healthcare Improvement, Centers for Medicare and Medicaid (e.g., Medicare criteria for quality improvement), and RAND quality of health studies.
                    </p>
                    <h2>Accreditation</h2>
                    <p>
                        The School of Medicine, State University of New York at Stony Brook, is accredited by the <a href="http://www.accme.org" target="_blank">Accreditation Council for Continuing Medical Education</a> to provide continuing medical education for physicians.
                    </p>
                    <p>
                        The School of Medicine, State University of New York at Stony Brook, designates an hour per hour basis in Category 1 credit toward the American Medical Association (AMA). Physicians should claim only the credit commensurate with the extent of their participation in the activity.
                    </p>
                    <h2>Location</h2>
                    <p>
                        We are located in the Health Sciences Center of Stony Brook University Medical Center.
                    </p>
                    <p>
                        Office for Continuing Medical Education<br />
                        Stony Brook University Medical Center<br />
                        School of Medicine<br />
                        101 Nicolls Road, 2nd Floor<br />
                        Health Sciences Center, Room 142<br />
                        Stony Brook, New York 11794-8222<br />
                        Telephone: 631-444-2094<br />
                        Fax: 631-444-2202
                    </p>
                    <h2>
                        Disclosure Policy
                    </h2>
                    <p>
                        As an accredited CME provider by the Accreditation Council for Continuing Medical Education (ACCME), the School of Medicine, Stony Brook University, must ensure balance, independence, objectivity and scientific rigor in all its directly provided or jointly provided educational activities. We are required to identify all relevant financial relationships with any commercial interest; determine whether these relationships create a conflict of interest with the individual''s control of content and resolve all conflicts before the educational activity occurs.
                        <br />
                        The School of Medicine, Stony Brook University, relies upon those in control of the content of its CME activities (planners, speakers, authors, reviewers) to provide educational information that is objective and free from bias. In this spirit, and in accordance with the ACCME Standards for Commercial Support, everyone who is in a position to control the content of an educational activity is expected to disclose: all relevant financial relationships with a commercial interest (defined as any entity producing, marketing, re-selling, or distributing health care goods or services consumed by, or used on, patients), that relates to the content that will be discussed in the educational presentation.
                    </p>
                    <p>
                        <b>NOTE:</b> The ACCME defines "relevant financial relationships" as financial relationships in any amount occurring within the 12 months prior to the educational activity that creates a conflict of interest. ACCME considers relationships of those in control of the content of the CME activity to include financial relationships of a spouse or partner with a commercial interest. All commercial relationships that create a conflict with the planner’s, speaker’s, author’s, content reviewer’s control of content must be resolved before the educational activity occurs.
                    </p>', CAST(N'2016-03-01T21:52:02.343' AS DateTime), N'4a4f2f81-2c36-4eb9-ad5d-40edbcaf918a')
INSERT [dbo].[ContentManagementSystem] ([ID], [MetaTitle], [MetaKeywords], [MetaDescription], [Page], [URL], [Headline], [Body], [LastUpdatedOn], [LastUpdatedBy]) VALUES (7, N'Dr. Lane | About Us', N'', N'', N'Dr. Lane', N'/additional-information/dr-lane-associate-dean-continuing-medical-education', N'Dorothy S. Lane, MD, MPH', N'<section id="learning-material">
                        <article class="learning-material">
                            <figure class="learning-material-picture"><img src="~/Content/Images/dorothy-lane.jpg" alt=""></figure>
                            <div class="learning-material-description">
                                <figure>Associate Dean for CME</figure>
                                <p>
                                    Dr. Dorothy Lane is a State University of New York Distinguished Service Professor and the Associate Dean for Continuing Medical Education (CME) at the Stony Brook University School of Medicine.  Dr. Lane received her B.A. degree, Phi Beta Kappa, from Vassar College, her M.D. from the Columbia University College of Physicians and Surgeons, an M.P.H. degree from Columbia University School of Public Health and Administrative Medicine and completed a residency in public health and preventive medicine at the New York City Department of Health. She is board certified in Preventive Medicine. Dr. Lane is also the Vice Chair of the Department of Family, Population and Preventive Medicine and Division Head of Preventive Medicine and Population Health.  In addition to also being the departmental Division Head for Graduate Medical Education, she is the Director of the Stony Brook residency program in General Preventive Medicine and Public Health, and has been since it was established in 1982. Dr. Lane has been the Principal Investigator of the NHLBI Women’s Health Initiative Center at Stony Brook since its inception in 1994, and the Principal Investigator for a series of NCI grants spanning a 30 year period that focused initially on improving breast and subsequently colorectal cancer screening rates. She directed one of the five initially funded CDC Colorectal Cancer Screening Demonstration Programs which covered the cost of colonoscopy screening for the uninsured and underinsured in Suffolk County, NY.  Dr. Lane is a prominent national leader in preventive medicine organizations, having served as President of the American College of Preventive Medicine, Chair of the American Board of Preventive Medicine and President of the Association of Teachers of Preventive Medicine.  She has also been active nationally in continuing and graduate medical education including serving as a member of the board of directors of both the Accreditation Council for Continuing Medical Education and the Accreditation Council for Graduate Medical Education, and is currently a member of the ACGME-ACCME Coordinating Committee.  On the local and regional level, Dr. Lane chairs the CME Committee of the Suffolk Academy of Medicine and previously chaired the CME Committee of the Medical Society of the State of New York. She has published over 145 articles in peer-reviewed journals and been the recipient of several prestigious awards, including the ACGME Parker J Palmer Courage to Teach Award which nationally recognizes residency program directors for their dedication to teaching, patient care, leadership and mentorship.
                                </p>                                
                            </div>
                        </article>
                    </section>', CAST(N'2016-03-01T00:00:00.000' AS DateTime), N'4a4f2f81-2c36-4eb9-ad5d-40edbcaf918a')
INSERT [dbo].[ContentManagementSystem] ([ID], [MetaTitle], [MetaKeywords], [MetaDescription], [Page], [URL], [Headline], [Body], [LastUpdatedOn], [LastUpdatedBy]) VALUES (10, N'Plan a CME Activity', N'', N'', N'Plan a CME Activity', N'/additional-information/plan-a-cme-activity', N'Plan a CME Activity', N'<p>
                        All educational activities must follow the required criteria process in order to be eligible for CME certification approval.
                    </p>
<p>
                        The documents below have been developed by OCME in accordance with the <a href="http://www.accme.org/sites/default/files/626_20160211_Accreditation_Requirements_Document.pdf" target="_blank">ACCME criteria requirements</a>.
                    </p>
<article>
                        <h2>Policies</h2>
                        <ul class="list-links">
                            <li>
                                <a href="//stonybrookcme.azureedge.net/files/CMS/faculty-disclosure-policy-revised-102014.pdf" target="_blank" class="read-more-red">Faculty Disclosure Policy</a>
                            </li>
                            <li>
                                <a href="//stonybrookcme.azureedge.net/files/CMS/policy-on-honoraria-and-reimbursement-2013.pdf" target="_blank" class="read-more-red">Policy on Honoraria & Reimbursement – Directly Provided Activity</a>
                            </li>
                            <li>
                                <a href="//stonybrookcme.azureedge.net/files/CMS/policy-on-honoraria-and-reimbursement-joint-2013.pdf" target="_blank" class="read-more-red">Policy on Honoraria & Reimbursement – Jointly Provided Activity</a>
                            </li>
                        </ul>
                    </article>
<article>
                        <h2>Guidelines</h2>
                        <ul class="list-links">
                            <li>
                                <a href="//stonybrookcme.azureedge.net/files/CMS/certification-timeline-and-tasks.xls" target="_blank" class="read-more-red">OCME Certification Timeline and Task List</a>
                            </li>
                            <li>
                                <a href="//stonybrookcme.azureedge.net/files/CMS/how-to-prepare-educational-objectives-12022010.pdf" target="_blank" class="read-more-red">How to Prepare Educational Objectives</a>
                            </li>
                            <li>
                                <a href="//stonybrookcme.azureedge.net/files/CMS/joint-providership-guidelines.pdf" target="_blank" class="read-more-red">Jointly Provided Guidelines</a>
                            </li>
                        </ul>
                    </article>
<article>
                        <p>You can download a printable version of the following forms:</p>
                    </article>
<article>
                        <h2>CME Planning Process / Certification Forms for Live Activities</h2>
                        <p>Submit a completed application via email to the Office of Continuing Medical Education (OCME).<br><a href="mailto:cme@stonybrookmedicine.edu" target="_blank"><em class="fa fa-envelope"></em> cme@stonybrookmedicine.edu</a></p>
                        <ul class="list-links">
                            <li>
                                <a href="//stonybrookcme.azureedge.net/files/CMS/cme-application-conference-revised-042016.doc" target="_blank" class="read-more-red">CME Activity Application for Conferences</a>
                            </li>
                        </ul>
                    </article>
<article>
                        <h2>Faculty Disclosure & Commercial Support</h2>
                        <ul class="list-links">
                            <li>
                                <a href="//stonybrookcme.azureedge.net/files/CMS/faculty-disclosure-form-revised-02192016.doc" target="_blank" class="read-more-red">Faculty Disclosure Form</a><br>
                                <p><em><strong>Please note</strong>, if the Activity Director has a commercial interest to be disclosed, the director must name a non-conflicted co-director.</em></p>
                            </li>
                            <li>
                                <a href="//stonybrookcme.azureedge.net/files/CMS/educational-objectives-dicsloure-certification-statement.doc" target="_blank" class="read-more-red">Educational Objectives, Disclosure and Certification Statement Handout</a>
                            </li>
                            <li>
                                <a href="//stonybrookcme.azureedge.net/files/CMS/educational-objectives-for-presentation-form.doc" target="_blank" class="read-more-red">Educational Objectives for Presentation Form</a>
                            </li>
                            <li>
                                <a href="//stonybrookcme.azureedge.net/files/CMS/ebm-reference-list-form.doc" target="_blank" class="read-more-red">References List/Evidence-Based Medicine</a>
                            </li>
                            <li>
                                <a href="//stonybrookcme.azureedge.net/files/CMS/verification-of-disclosure-form.doc" target="_blank" class="read-more-red">Verification Disclosure Form</a>
                            </li>
                            <li>
                                <a href="//stonybrookcme.azureedge.net/files/CMS/evaluation-form-multiple-speakers.doc" target="_blank" class="read-more-red">Evaluation Form (one or more speakers)</a>
                            </li>
                            <li>
                                <a href="//stonybrookcme.azureedge.net/files/CMS/sample-attendance-sheet.xlsx" target="_blank" class="read-more-red">Attendance Sign-In Sheet Template (walk-in’s)</a>
                            </li>
                            <li>
                                <a href="//stonybrookcme.azureedge.net/files/CMS/accme-standards-for-commercial-support.pdf" target="_blank" class="read-more-red">ACCME Standards for Commercial Support</a>
                            </li>
                            <li>
                                <a href="//stonybrookcme.azureedge.net/files/CMS/written-agreement-for-commercial-support-fsa.doc" target="_blank" class="read-more-red">Written Agreement for Commercial Support</a>
                            </li>
                            
                        </ul>
                    </article>
<article>
                        <h2>Faculty CME Credit for Teaching</h2>
                        <ul class="list-links">
                            <li>
                                <a href="//stonybrookcme.azureedge.net/files/CMS/ama-pra-credit-for-teaching-appliction.docx" target="_blank" class="read-more-red">Protocol for Faculty CME Credit for Teaching in Accredited Stony Brook CME, GME and/or UME Programs</a>
                            </li>
                        </ul>
                    </article>
<article>
                        <h2>Regularly Scheduled Series (RSS) / Grand Rounds</h2>
                        <p>Submit a completed application via email to the Office of Continuing Medical Education (OCME).<br><a href="mailto:cme@stonybrookmedicine.edu" target="_blank"><em class="fa fa-envelope"></em> cme@stonybrookmedicine.edu</a></p>
                        <ul class="list-links">
                            <li>
                                <a href="//stonybrookcme.azureedge.net/files/CMS/cme-application-grand-rounds-revised-042016.doc" target="_blank" class="read-more-red">CME Activity Application for Regularly Scheduled Series (RSS) / Grand Rounds</a>
                            </li>
                            <li>
                                <a href="//stonybrookcme.azureedge.net/files/CMS/activity-timline-grand-rounds.xlsx" target="_blank" class="read-more-red">RSS Certification Timeline and Task List</a>
                            </li>
                        </ul>
                    </article>
<article>
                        <h2>RSS / Grand Rounds Forms</h2>
                        <ul class="list-links">
                            <li>
                                <a href="//stonybrookcme.azureedge.net/files/CMS/faculty-disclosure-form-revised-02192016.doc" target=" _blank" class="read-more-red">Faculty Disclosure Form</a><br>
                                <p><em><strong>Please note</strong>, if the Activity Director has a commercial interest to be disclosed, the director must name a non-conflicted co-director.</em></p>
                            </li>
                            <li>
                                <a href="//stonybrookcme.azureedge.net/files/CMS/verification-of-disclosure-form.doc" target="_blank" class="read-more-red">Verification Disclosure Form</a>
                            </li>
                            <li>
                                <a href="//stonybrookcme.azureedge.net/files/CMS/attendance-form-quarterly.doc" target="_blank" class="read-more-red">Attendance Sign-In Sheet Template for Quarterly Reporting</a>
                            </li>
                            <li>
                                <a href="//stonybrookcme.azureedge.net/files/CMS/attendance-form-monthly.doc" target="_blank" class="read-more-red">Attendance Sign-In Sheet Template for Semi-Annual Reporting</a>
                            </li>
                            <li>
                                <a href="//stonybrookcme.azureedge.net/files/CMS/educational-objectives-dicsloure-certification-statement.doc" target="_blank" class="read-more-red">Educational Objectives, Disclosure and Certification Statement Handout</a>
                            </li>
                            <li>
                                <a href="//stonybrookcme.azureedge.net/files/CMS/ebm-reference-list-form.doc" target="_blank" class="read-more-red">References List/Evidence-Based Medicine</a>
                            </li>
                            <li>
                                <a href="//stonybrookcme.azureedge.net/files/CMS/evaluation-form-single-speaker.doc" target="_blank" class="read-more-red">Evaluation Form</a>
                            </li>
                            <li>
                                <a href="//stonybrookcme.azureedge.net/files/CMS/evaluation-summary-template-grand-rounds.docx" target="_blank" class="read-more-red">Evaluation Summary Template</a>
                            </li>
                            <li>
                                <a href="//stonybrookcme.azureedge.net/files/CMS/cme-speaker-qa-form.docx" target="_blank" class="read-more-red">Speaker Question & Answer Form</a>
                            </li>
                            <li>
                                <a href="//stonybrookcme.azureedge.net/files/CMS/speaker-consent-permission-form.pdf" target="_blank" class="read-more-red">Speaker Permission Form</a>
                            </li>
                        </ul>
                        <p>If you are interested in starting a RSS/Grand Rounds, please contact Theresa Waters. She will be able to discuss your needs and help you through the application and planning processes.</p>
                        <p>Terry may be reached at <a href="tel:6314442094" target="_blank">(631) 444-2094</a> or via email at <a href="mailto:theresa.waters@stonybrookmedicine.edu" target="_blank">theresa.waters@stonybrookmedicine.edu</a></p><p></p><figure><img src="/virtual/images/CMS/the-ohio-state-university-wexner-medical-center-logo-email.jpg" data-image="21"></figure>
                    </article>', CAST(N'2022-03-24T10:26:43.057' AS DateTime), N'7df52f7d-7ede-4d08-b826-72b978383431')
INSERT [dbo].[ContentManagementSystem] ([ID], [MetaTitle], [MetaKeywords], [MetaDescription], [Page], [URL], [Headline], [Body], [LastUpdatedOn], [LastUpdatedBy]) VALUES (14, N'Home Page Call Out', N'Callout', N'Call out', N'Home Page Call Out', N'/home', N'Call Out', N'<article>
                            <h3>
                                Coronavirus Disease (COVID-19) Update for CME Activities
                            </h3>
                            Due to the Coronovirus Disease (COVID-19) and the ever changing requirements for face-to-face interactions, many of our course directors are choosing to stream their conferences versus holding in-person educational activities. Please check the activity’s informational webpage to confirm the activity is still scheduled and for what type of venue.
                        </article>
                        <article>
                            <h4>Free Credit Opportunities – All COVID-19 Related MedNet21 Webcasts</h4>
                            These webcasts are certified for 1 <em>AMA PRA Category 1 Credit</em> TM , registered for 1 ABIM MOC point,<br>and are free. Credit will be awarded after successful completion of each associated post-test.

                            <ul>
                                <li><a href="/WebCastDetail.aspx?ID=879">Palliative Medicine and COVID-19</a></li>
                                <li><a href="/WebCastDetail.aspx?ID=876">The Management of the COVID-19 Patient with Respiratory Failure</a></li>
                                <li><a href="https://ccme.osu.edu/WebCastDetail.aspx?ID=955" target="_blank">COVID-19 Update</a></li>
                                <li><a href="https://ccme.osu.edu/WebCastDetail.aspx?ID=925" target="_blank">COVID-19 Chronic Symptoms</a></li>
                            </ul>
                        </article>
                        <article>
                            <h4>Grand Rounds Alert</h4>
                            To contact the Grand Rounds coordinator to confirm that the activity is still happening, please use this link: <a href="Docs/Grand Rounds RSS Contacts.xlsx"><b>Grand Rounds Contact List</b></a>
                        </article>
                        <article>
                                <h4>Cancelled and Postponed CME Activity Fee Policy</h4>
                                <a href="/Docs/Coronavirus Disease (COVID-19) Cancelled and Postponed CME Activity Fee Policy - Updated June 2020.docx">Click here to view</a>, this information is for course directors
                        </article>
                        <article>
                            <h4>Coronavirus Information</h4>

                            For additional information concerning the developments pertaining to the COVID virus, please access the following links:
                            <ul class="no-disc">
                                <li>The Ohio State University, <a href="https://wexnermedical.osu.edu/features/coronavirus" target="_blank">click here.</a></li>

                                <li>ODH - Ohio Department of Health, <a href="https://odh.ohio.gov/wps/portal/gov/odh/know-our-programs/Novel-Coronavirus/2019-nCoV" target="_blank">click here</a>.</li>
                                <li>CDC – Centers for Disease Control and Prevention, <a href="https://www.cdc.gov/coronavirus/2019-ncov/index.html" target="_blank">click here.</a></li>
                                <li>WHO – World Health Organization, <a href="https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public" target="_blank">click here.</a></li>
                                <li>ACCME® - <a href="https://www.accme.org/coronavirus-resources" target="_blank">ACCME® Novel Coronavirus Education Resources</a></li>
                            </ul>
                        </article>', CAST(N'2022-07-19T00:00:00.000' AS DateTime), N'7df52f7d-7ede-4d08-b826-72b978383431')
INSERT [dbo].[ContentManagementSystem] ([ID], [MetaTitle], [MetaKeywords], [MetaDescription], [Page], [URL], [Headline], [Body], [LastUpdatedOn], [LastUpdatedBy]) VALUES (16, N'About Us', N'about', N'about', N'About Us', N'/about-us', N'About Us', N'<article>
                        <h4>Purpose</h4>
                        <p>The Center for Continuing Medical Education (CCME) at The Ohio State University Wexner Medical Center (OSUMC) is dedicated, through a rich and innovative tradition, to providing high quality continuing medical education to physicians and other healthcare professionals in order to facilitate the delivery of better and enhanced patient care and outcomes. Pursuant to the Medical Center’s goal of disseminating and applying new knowledge, CCME employs the latest advances in evidence-based medicine to altar practice performance.</p>
                    </article>
                    <article>
                        <h4>Target Audience</h4>
                        <p>As part of a preeminent academic institution whose mission includes creating a positive impact locally and internationally, CCME serves the educational demands of an array of healthcare professionals in many specialties. The Center’s target audience includes physicians, researchers, and other healthcare professionals affiliated with OSUMC. Community practitioners at the local and regional level are also encouraged to participate in CCME organized events. Additionally, via educational partnerships, internet-based learning, and direct sponsorship, CCME reaches a national and international audience.</p>
                    </article>
                    <article>
                        <h4>Types of Activities Provided</h4>

                        <p>The Center continually implements new technologies and educational assays to assist individuals in their professional development, meeting the various educational needs of a diverse healthcare professional population. CCME coordinated activities include:</p>
                        <ul>
                            <li>Local, regional, national and international symposia</li>
                            <li>Internet-based enduring materials, including video on demand programming and monograph/journal review</li>
                            <li>Regularly Scheduled Series, or grand rounds</li>
                        </ul>
                    </article>
                    <article>
                        <h4>Content</h4>
                        <p>The Center determines educational deficiencies by utilizing several needs assessment sources, including journal articles or other peer reviewed sources, clinical evidence and research, audience survey instruments, and discussion with clinical and research faculty. Upon identification of educational needs, programming is produced in a multitude of medical specialties and subjects, incorporating clinical best practices and evidence-based guidelines. In the diffusion of medical education, CCME applies many learning mechanisms such as case reviews, audience question and answer, panel discussions, and multi-media presentations.</p>
                    </article>
                    <article>
                        <h4>Expected Results</h4>
                        <p>The Center expects to achieve results in several areas. Expanded participant knowledge that addresses identified educational gaps and attendee’s expectation that knowledge obtained will be utilized in clinical practice are immediately measured outcomes. Long term measurable results include participant change in performance, increased self-perceived effectiveness in the clinical setting, and improved patient outcomes.</p>
                    </article>
                    <article>
                        <h4>Accreditation</h4>
                        <p>The Ohio State University Medical Center is accredited by the <a href="http://www.accme.org/" target="_Blank">Accreditation Council for Continuing Medical Education</a> (ACCME®) to provide continuing medical education for physicians. The Ohio State University Medical Center designates CME educational activities on an hour per hour basis in Category 1 credit toward the American Medical Association (AMA) Physician’s Recognition Award.</p>
                    </article>
                    <article>
                        <h4>Location</h4>
                        <p>We are located on the Health Sciences campus of <a href="http://www.osu.edu/" target="_Blank">The Ohio State University</a>.</p>
                    </article>
                    <article>
                        <p><b>Center for Continuing Medical Education</b><br>The Ohio State University Wexner Medical Center<br>600 Ackerman Road, 2nd Floor<br>Room E2055<br>Columbus, Ohio 43202<br><b>Telephone:</b> 614-293-3576<br><b>Fax:</b> 614-293-4180</p>
                    </article>
                    <article>
                        <h4>Registration Fees</h4>
                        <p>Fees will gladly be refunded if notice of cancellation is received a minimum of 7 business days prior to the CME event. All fees are subject to a non-refundable administrative charge which is determined by the cost of the conference. Fees are due upon registration and may be paid by VISA, MasterCard, American Express, Discover, check or money order. Checks should be made payable to OSU-CCME.</p>
                    </article>
                    <article>
                        <h4>Disclosure Policy</h4>
                        <p>It is the policy of The Ohio State University Wexner Medical Center and the Center for Continuing Medical Education to adhere to the ACCME® standards for commercial support to avoid any conflict of interest and/or commercial bias. These standards ensure the independence, objectivity, and scientific credibility of all CCME sponsored educational activities. All individuals who participate in sponsored activities are expected to disclose any significant relationships that may pose a conflict of interest. Significant relationships include, but are not limited to: grant/research support, advisory board membership, stockholder (not as part of a mutual fund), honorarium recipient, editorial board involvement, and consultant/speaker. In addition, these are financial, commercial or research relationships or interests that have occurred within the past 12 months that the individual, individual''s spouse or immediate family have that might affect the individual''s ability to provide a fair and balanced presentation for the proposed CME activity. Any individual who refuses to disclose or does not intentionally fully disclose pertinent aforementioned relationships will be excluded from the CME activity. In the event a conflict of interest is discovered, the CME audience will be notified of the conflict of interest resolution prior to the CME activity.</p>
                    </article>', CAST(N'2022-07-19T00:00:00.000' AS DateTime), N'7df52f7d-7ede-4d08-b826-72b978383431')
INSERT [dbo].[ContentManagementSystem] ([ID], [MetaTitle], [MetaKeywords], [MetaDescription], [Page], [URL], [Headline], [Body], [LastUpdatedOn], [LastUpdatedBy]) VALUES (17, N'MOC', N'moc', N'moc', N'MOC', N'/maintenance-of-certification', N'MOC', N'<article>
                        <h4 style="text-align:center;">OSU MedNet21 will be offering ABIM Maintenance of Certification (MOC) points in the 2016 – 2017 season in addition to <br /><em>AMA PRA Category 1 Credit(s)<sup style="font-size: 8px;">TM</sup></em></h4>
                        <p>
                            In a special MedNet21 webcast the Medical Editor and Moderator, Dr. Jim Allen, offered the reasoning for why OSU Center for Continuing Medical Education is offering ABIM MOC points starting the 2016 – 2017 season. The following are excerpts from that webcast:
                        </p>
                        <div style="padding: 0 30px;">
                            <p>
                                Hello. I’m Dr. Jim Allen, your host and moderator for OSU MedNet21, bringing you webcast medical education for the 21st century. This is now our 55th consecutive year of MedNet and its predecessor program, OMEN, the Ohio Medical Education Network. In the past 55 years, medicine has changed a lot and medical education has also changed with it. When state medical boards required continuing medical education credits for physicians to renew their medical licenses, we were there to make sure that you could get those credits through our programming.
                            </p>
                            <p>
                                Last year the Accreditation Council for Continuing Medical Education or ACCME® and the American Board of Internal Medicine announced a collaboration to provide maintenance of certification points for certain CME activities. This way, physicians can get their MOC points at the same time that they are getting their CME credits. Over the past year, we’ve been working on creating a process to allow MedNet to be approved for MOC points and I’m pleased to announce that starting the 2016 - 2017 season, you will be able to get both CME credits and American Board of Internal Medicine MOC points from our MedNet programs. We are also working with other specialty boards to get MedNet approved for specialties other than internal medicine in the future.
                            </p>
                            <p>
                                So, to get the maintenance of certification point for a MedNet webcast, you will need to take a short pre-test before you watch the program to determine what you knew about each webcast’s topic and then repeat that test after the webcast to show what you learned by viewing the webcast.
                            </p>
                            <p>
                                Now, if you do not need ABIM maintenance of certification points and just want CME credit, then you only have to pass the post-test to receive credit.
                            </p>
                        </div>
                        <p style="text-align: center; margin-top:35px;">For additional questions, please contact Leisl Ashbaugh at <a href="tel:6142933576">(614) 293-3576</a> or <a href="mailto:leisl.ashbaugh@osumc.edu">leisl.ashbaugh@osumc.edu</a></p><p style="text-align: center;"> </p><p style="text-align: center;"><img src="/Images/CMS/ABIMMOC.png" alt="" style="width: 150px;"></p><p style="text-align: center;"> </p>
                    </article>', CAST(N'2022-07-19T00:00:00.000' AS DateTime), N'7df52f7d-7ede-4d08-b826-72b978383431')
INSERT [dbo].[ContentManagementSystem] ([ID], [MetaTitle], [MetaKeywords], [MetaDescription], [Page], [URL], [Headline], [Body], [LastUpdatedOn], [LastUpdatedBy]) VALUES (21, N'Plan A CME Activity', N'activity', N'activity', N'Plan a CME Activity', N'/additional-information/plan-a-cme-activity', N'Plan a CME Activity', N'<article>
                        <p>Educational activities must follow a prescribed planning process in order to be eligible for CME certification.</p>
                        <p>The following informational documents and planning forms have been developed by the OSU CCME in accordance with the <a href="/Docs/626_20190412_Accreditation_Requirements_Document.pdf">ACCME® criteria requirements</a>.</p>
                        <p>If you are looking to certify an educational activity as a <b>Regularly Scheduled Series</b> or an <b>Enduring Material</b>, please see the sections designated for those types of activities below.</p>
                    </article>
                    <article>
                        <h4>CME Planning Process / Certification Forms for Live Activities</h4>
                        <p>The following are documents used for the certification of all live activities with the exception of Regularly Scheduled Series, or RSS. <i>If you are seeking certification for an RSS, please consult the <b>Regularly Scheduled Series (RSS) Documents</b> section below.</i></p>
                        <ul>
                            <li><a href="/Docs/CCME Certification Timeline and Tasks.xls">CME Certification Timeline and Task List</a></li>
                        </ul>
                    </article>
                    <article>
                        <h4>Application for Category 1 Credit Resources</h4>
                        <p>
                            In order to create an educational activity for <em>AMA PRA Category 1 Credit</em>(s)™, there is a documenation process.&nbsp; The main document is <b>not</b> included in this section as each application is customized per the details of your specific educational activity. &nbsp;Contact your CCME coordinator to obtain this form and to begin the necessary discussions.&nbsp;The following resources should aid you in the process as well as the onsite logistics of your event.
                        </p>
                        <ul>
                            <li><a href="/Docs/understanding_needs_assessment_objectives.pdf">Understanding Needs Assessment and Objectives</a></li>
                            <li><a href="/Docs/Application for Category 1 Designation - Budget Template.xls">Estimated Budget Template for CME Application for Category 1 Credit</a></li>
                            <li><a href="/Docs/Standard Syllabus Language.doc">Standard Syllabus Language Outline</a></li>
                            <li><a href="/Docs/Standard CME Evaluation.pdf">Standard CCME Evaluation</a></li>
                            <li><a href="/Docs/Verification of Attendance Form - EXAMPLE.docx">Sample Verification of Attendance Form</a></li>
                        </ul>
                    </article>
                    <article>
                        <h4>Joint Providership Forms </h4>
                        <p>Joint providership CME activities are defined as those in which a faculty member approaches OSU CCME on behalf of a not-for-profit organization outside of the institution to certify a CME activity for <em>AMA PRA Category 1 Credit</em>(s)<em>™</em>.  A faculty member, for these purposes, is a regular faculty member employed by either the University or the Wexner Medical Center in a teaching, research or administrative capacity.  The proposed program must be one for which at least one OSU faculty member serves in the primary role of initiating, planning and overseeing the educational content and quality.  In addition, the faculty member’s chair must recommend approval of the program.  The program must also be approved by the Dean or his/her decanal designee.  The joint providership must be with an established scientific or professional organization.  The activity or the organization must be consistent with the academic, research, and patient care mission of The Ohio State University. </p><p>The following document must be completed in order for an activity to be considered for Joint Providership. Contact your CCME coordinator to obtain this form.</p>
                        <ul><li>Letter of Agreement for Joint Providership</li></ul>
                    </article>
                    <article>
                        <h4>CME Pricing/Fee Selection Forms</h4>
                        <p>Contact your CCME coordinator to discuss these details.</p>
                    </article>
                    <article>
                        <h4>Conflict of Interest Disclosure Forms</h4>
                        <p>Effective 2022, a universal conflict of interest (COI) form has been initiated by the ACCME(R). Therefore, the following form is to be used for all members involved in the execution of an activity. For example, planners, speakers, etc.</p>
                        <ul>
                            <li><a href="/Docs/COI - NEW - REVISED 9-7-21.docx">Conflict of Interest Disclosure Form</a></li>
                            <li><a href="/Docs/Materials Usage Speaker Disclosure Form.doc">Material Usage Form</a></li>
                        </ul>
                    </article>
                    <article>
                        <h4>
                            Commercial Support / Exhibitor Documents
                        </h4>
                        <ul><li><a href="/Docs/884_20210624_New Standards Standalone Package.pdf">ACCME®&nbsp;Standards for Integrity and Independence in Accredited<br>Continuing Education</a></li><li>Commercial Support Letter of Agreement (educational grant)</li><li>Commercial Support Letter of Agreement (in-kind support)</li><li><a href="/Docs/Application to Display at CME Activity.docx">Application to Display at CME Activity</a></li><li><a href="/Docs/Display Policy 1-27-2021.pdf">Display Policy</a></li><li>OSUWMC Vendor Interaction Policy</li></ul>
                    </article>
                    <article>
                        <h4>Tax Form</h4>
                        <ul>
                            <li><a href="/Docs/OSUW9.pdf">OSU W-9 Form</a></li>
                        </ul>
                    </article>
                    <article>
                        <h4>Content Validity Policy</h4>
                        <ul>
                            <li><a href="/Docs/CONTENT VALIDITY.pdf">Content Validity Policy</a></li>
                        </ul>
                    </article>
                    <article>
                        <h4>Regularly Scheduled Series (RSS) Start Up</h4>
                        <p>If you are interested in starting a Grand Rounds (aka RSS), please contact Brian Ehrlich. He will be able to discuss your needs and help you through the application and planning processes.</p>
                        <p>Brian may be reached at (614) 293-9326 or via email at <a href="mailto:brian.ehrlich@osumc.edu">brian.ehrlich@osumc.edu</a>.</p>
                    </article>
                    <article>
                        <h4>Enduring Materials (Online Activity) Start Up</h4>
                        <p>If you are interested in starting an online activity (aka Enduring Material), please contact Derrick Freeman. He will be able to discuss your needs and help you through the application and planning processes.</p>
                        <p>Derrick may be reached at (614) 293-3473 or via email at <a href="mailto:derrick.freeman@osumc.edu" target="_blank">derrick.freeman@osumc.edu</a>.</p>
                    </article>', CAST(N'2022-07-20T10:45:22.800' AS DateTime), N'7df52f7d-7ede-4d08-b826-72b978383431')
INSERT [dbo].[ContentManagementSystem] ([ID], [MetaTitle], [MetaKeywords], [MetaDescription], [Page], [URL], [Headline], [Body], [LastUpdatedOn], [LastUpdatedBy]) VALUES (22, N'FAQ', N'faq', N'faq', N'FAQ', N'/faq', N'FAQ', N'<article>
                        <h4>Q: How do I open an account?</h4>
                        A: You can sign up for an account by going to our <a href="https://ccme.osu.edu/Register.aspx">registration page</a>. Simply fill out the form to start the process.
                    </article>
<article>
                        <h4>Q: Can I print out documentation that shows what credit I have earned?</h4>
                        A: Yes.  When you log into the site as a registered user your credit hours are automatically tracked.  You can print out certificates for each program you participate in.
                    </article>
<article>
                        <h4>Q: Why should I register for an account?</h4>
                        A: Registering an account allows you to view On-Demand programs, earn Category 1 credit, or register for conferences online.
                    </article>
<article>
                        <h4>Q: Are my credit card transactions secure?</h4>
                        A: We use the latest encryption technology to keep your credit card transactions safe. Our site uses <a href="http://www.cybersource.com/">CyberSource</a>, a leader in internet e-commerce, to process orders.
                    </article>
<article>
                        <h4>Q: Who do I contact if I would like to get several paper copies of a brochure?</h4>
                        A: You should submit your request electronically by selecting "Contact Us" located in the red header menu. Please specify the conference, quantity, and the address to which the brochures are to be mailed.
                    </article>
<article>
                        <h4>Q: When should I contact CCME about planning a CME activity?</h4>
                        A: The Center for Continuing Medical Education should be contacted during the initial planning process. CCME will guide the planning committee through the essential areas and elements of planning a CME activity put forth by the Accreditation Council for Continuing Medical Education.
                    </article>
<article>
                        <h4>Q: What is a webcast on-demand?</h4>
                        A: Webcast on demand is our webcast programs approved for 1 <span style="font-style: italic">AMA PRA Category 1 Credit</span>(s)<span style="font-size: 8pt; vertical-align: super; font-style: italic">TM</span>. Online on demand allows for users to view a program 24 hours a day, 7 days a week. It also allows viewers to communicate via e-mail with the presenters of the program.
                    </article>
<article>
                        <h4>Q: When will my certificate be available?</h4>
                        A: Once you have taken the test for the respective course, your certificate will be available within two - four weeks.  If the credits are not visible and a certificate unavailable, please feel free to contact CCME.
                    </article>', CAST(N'2022-07-20T10:44:26.737' AS DateTime), N'7df52f7d-7ede-4d08-b826-72b978383431')
INSERT [dbo].[ContentManagementSystem] ([ID], [MetaTitle], [MetaKeywords], [MetaDescription], [Page], [URL], [Headline], [Body], [LastUpdatedOn], [LastUpdatedBy]) VALUES (23, N'CME Activities', N'activities', N'activities', N'CME Activities', N'/cme-activities', N'CME Activities', N'<article>
                        <b>The Center for Continuing Medical Education offers a variety of educational activities and delivery formats to cater to physician’s individual needs.  Please explore our robust selection of educational offerings by using the navigation buttons located to the left.</b>
                    </article>
                    <article>
                        <h4>On-line Education:</h4>
                        <p>We offer on-line education using  <a href="https://ccme.osu.edu/WebCastSearch.aspx?type=OnDemand">video on-demand CME webcasts</a> through our OSU MedNet21 series. Our webcast on demand library hosts over 120 programs at any given time and is accessible 24 hours a day, 7 days a week from anywhere in the world. Users can watch our webcasts by visiting the <b>Webcast On Demand</b> link at the top left of this page. Our webcasts are available to watch for free but you''ll need to pay to take the post test.  Users will need to create an account and log in to our website to take a post-test. <br><br>Enduring materials are available in a variety of on-line learning formats and offer post tests following participation in which the learner can earn credit.  </p>
                    </article>
                    <article>
                        <h4>
                            Conferences:
                        </h4>
                        <p>Each year the Center for Continuing Medical Education certifies a host of quality live conferences in a wide range of medical disciplines.  Please discover our offerings by navigating through this area of our website to see what offering are currently available</p>
                    </article>
                    <article>
                        <h4>
                            Regularly Scheduled Series (RSS), or Grand Rounds:
                        </h4>
                        <p>Regularly scheduled series, or grand rounds, are directed toward internal learners at the OSU Medical Center. The CCME currently certifies 68 Regularly Scheduled Series which happen on a weekly, monthly or quarterly schedule.</p>
                    </article>
                    <article>
                        <h4>
                            Learning From Teaching:
                        </h4>
                        <p>Learning from Teaching awards physicians AMA PRA Category 1 Credit(s)TM for the learning that occurs during their preparation for teaching, supervising, precepting, or evaluating medical students, residents, or fellows. It is important to point out that this is credit associated with the amount of time spent teaching the new information. (It is not the amount of time spent learning the new information. It is, also, not credit for day-to-day teaching as a faculty member.)</p>
                    </article>', CAST(N'2022-07-20T00:00:00.000' AS DateTime), N'7df52f7d-7ede-4d08-b826-72b978383431')
INSERT [dbo].[ContentManagementSystem] ([ID], [MetaTitle], [MetaKeywords], [MetaDescription], [Page], [URL], [Headline], [Body], [LastUpdatedOn], [LastUpdatedBy]) VALUES (24, N'Contact Us', N'contact', N'contact', N'Contact Us', N'/contact-us', N'Contact Us', N'<address>
                                <h3>Center for Continuing Medical Education</h3>
                                <br />
                                <span>The Ohio State University Wexner Medical Center</span>
                                <br />
                                <br />
                                <span>600 Ackerman Road </span>
                                <br />
                                <span>2nd Floor, Room E2055 </span>
                                <br />
                                <span>Columbus, Ohio 43202 </span>
                                <br>
                                <abbr title="Telephone">Telephone:</abbr> <b>(614) 293-3576</b>
                                <br>
                                <abbr title="Fax">Fax:</abbr> <b>(614) 293-4180</b>
                                <br>
                                <abbr title="Email">Email:</abbr> <a href="mailto:cme@stonybrookmedicine.edu"><b>cme@osumc.edu</b></a>
                            </address>', CAST(N'2022-07-20T00:00:00.000' AS DateTime), N'7df52f7d-7ede-4d08-b826-72b978383431')
INSERT [dbo].[ContentManagementSystem] ([ID], [MetaTitle], [MetaKeywords], [MetaDescription], [Page], [URL], [Headline], [Body], [LastUpdatedOn], [LastUpdatedBy]) VALUES (25, N'CME Staff', N'staff', N'staff', N'Partial', N'none', N'CME Staff', N'<p>
                                <b>Barbara Berry</b><br />
                                Director<br />
                                Telephone: <a href="tel:6142934773">(614) 293-4773</a><br />
                                Email: <a href="mailto:barbara.berry@osumc.edu">barbara.berry@osumc.edu</a>
                            </p>
                            <p>
                                <b>Jon Hollett</b><br />
                                OSU East Director<br />
                                Telephone: <a href="tel:6142573638">(614) 257-3638</a><br />
                                Email: <a href="mailto:jon.hollett@osumc.edu">jon.hollett@osumc.edu</a>
                            </p>
                            <p>
                                <b>Brian Ehrlich</b><br />
                                RSS/MOC Program Manager<br />
                                Telephone: <a href="tel:6142939326">(614) 293-9326</a><br />
                                Email: <a href="mailto:brian.ehrlich@osumc.edu">brian.ehrlich@osumc.edu</a>
                            </p>
                            <p>
                                <b>Derrick Freeman</b><br />
                                MedNet21 Webcast Producer<br />
                                Telephone: <a href="tel:6142933473">(614) 293-3473</a><br />
                                Email: <a href="mailto:derrick.freeman@osumc.edu">derrick.freeman@osumc.edu</a>
                            </p>
                            <p>
                                <b>Sarah Kamento</b><br />
                                Conference Program Manager<br />
                                Telephone: <a href="tel:6142938061">(614) 293-8061</a><br />
                                Email: <a href="mailto:sarah.kamento@osumc.edu">sarah.kamento@osumc.edu</a>
                            </p>
                            <p>
                                <b>Leisl Ashbaugh</b><br />
                                Office Administration<br />
                                Telephone: <a href="tel:6142933576">(614) 293-3576</a><br />
                                Email: <a href="mailto:leisl.ashbaugh@osumc.edu">leisl.ashbaugh@osumc.edu</a>
                            </p>', CAST(N'2022-07-20T00:00:00.000' AS DateTime), N'7df52f7d-7ede-4d08-b826-72b978383431')
INSERT [dbo].[ContentManagementSystem] ([ID], [MetaTitle], [MetaKeywords], [MetaDescription], [Page], [URL], [Headline], [Body], [LastUpdatedOn], [LastUpdatedBy]) VALUES (26, N'Disclaimer', N'disclaimer', N'disclaimer', N'Disclaimer', N'/disclaimer', N'Disclaimer', N'<article>
                        This CME educational activity is an online information and communications service provided by the Ohio State University Medical Center for Medical Education and Research. Use of this service is governed by the terms and conditions provided below. Please read the statements below carefully before accessing or using the service. By accessing or using this service, you agree to be bound by all of the terms and conditions herein.
                    </article>
                    <article>
                        The material contained in this CME educational activity do not contain standards that are meant to be applied rigidly and followed in virtually all cases. Physician judgment must remain central to the selection of diagnostic tests and therapy options of a specific patient''s medical condition.
                    </article>', CAST(N'2022-07-20T00:00:00.000' AS DateTime), N'7df52f7d-7ede-4d08-b826-72b978383431')
INSERT [dbo].[ContentManagementSystem] ([ID], [MetaTitle], [MetaKeywords], [MetaDescription], [Page], [URL], [Headline], [Body], [LastUpdatedOn], [LastUpdatedBy]) VALUES (27, N'Privacy Policy', N'privacy', N'privacy', N'Privacy Policy', N'/privacy-policy', N'Privacy Policy', N'<article>
                        The Ohio State University Medical Center respects your privacy. Personal information collected from participants of our medical educational activities will not, unless required by law, be shared with any third party. The primary reason we collect your personal information is for accountability and documentation of your CME activities in compliance with ACCME. We do not distribute unsolicited e-mails, nor, unless required by law, do we share the names of our subscribers with any third party.
                    </article>', CAST(N'2022-07-20T00:00:00.000' AS DateTime), N'7df52f7d-7ede-4d08-b826-72b978383431')
INSERT [dbo].[ContentManagementSystem] ([ID], [MetaTitle], [MetaKeywords], [MetaDescription], [Page], [URL], [Headline], [Body], [LastUpdatedOn], [LastUpdatedBy]) VALUES (28, N'CME Hospital Subscriptions', N'subscriptions', N'subscriptions', N'CME Hospital Subscriptions', N'/continuing-medical-education-hospital-subscriptions', N'CME Hospital Subscriptions', N'<article>
                        <h4>OSU MedNet21 – Continuing Medical Education Made Simple</h4>
                        <p>OSU MedNet21 is a series of one-hour webcasts designed to enable practicing physicians to fulfill continuing medical education requirements from the convenience of their office or home. These AMA PRA Category 1 Credit(s)TM CME webcasts are a wonderful resource for physicians and healthcare providers alike, and allow medical practitioners to stay abreast of the latest information and developments in medicine.</p>
                    </article>
                    <article>
                        <h4>
                            OSU MedNet21 used as Grand Rounds
                        </h4>
                        <p>Hospitals interested in viewing OSU MedNet21 as their grand rounds will find the process saves time and is easy. The webcasts are available to stream over the Internet or as a download onto a computer. Because the educational content is created by OSU’s Center for Continuing Medical Education (CCME), all ACCME® requirements are already completed. Hospitals no longer have to worry about scheduling speakers for meetings, managing conflicts of interest, or obtaining presentations prior to the meetings. Subcribing institutions choose a site administrator who manages the sign-in sheet for the group, distributes evaluations, and enters the credits into our online recordkeeping system. That’s it. The evaluations are even processed by OSU’s CCME. In addition, there is an OSU CCME staff member available to provide technical support and guidance.</p>

                        <p>Webcasts are certified for a period of three years. With 40 new programs created each year, this enables subscribers to access 120 hours of online programming in the OSU MedNet21 library. While credits are awarded only one time, programs can be viewed numerous times.</p>
                    </article>
                    <article>
                        <h4>
                            OSU MedNet21 for Individual Use
                        </h4>
                        <p>Our OSU MedNet21 webcast series is easy to view. In addition to being able to be viewed on a computer, it is available on mobile devices and tablets. So, healthcare team members have access to it around the clock. A post-test is required for credit to be received but is free of charge for those affiliated with a subscribing hospital.</p>
                    </article>
                    <article>
                        <h4>
                            Additional Benefits of an OSU MedNet21 Hospital Subscription
                        </h4>
                        <ul>
                            <li>Content for OSU MedNet21 is designed specifically with a primary care focus.</li>
                            <li>OSU MedNet21 is an excellent education resource for residents and fellows.</li>
                            <li>OSU MedNet21 presenters are available to answer follow-up questions via email.</li>
                            <li>Subscribers are invited to participate in the annual needs assessment process.</li>
                            <li>Certificates of credit are maintained under individual accounts on the CCME website for a minimum of six years.</li>
                        </ul>
                    </article>
                    <article>
                        <h3>
                            Webcast Examples
                        </h3>
                    </article>
                    <article>
                        <h4>
                            Professional Practice Gaps Addressed by OSU MedNet21
                        </h4>
                        View the schedule of webcasts from 2012-2015
                    </article>
                    <article>
                        <h4>
                            The Cost of a Hospital Subscription
                        </h4>
                        <p>A 12-month subscription is $4,700. The number of users that a hospital can allow is unlimited! So, the more people accessing OSU MedNet21, the more cost-efficient your investment will be. OSU MedNet21 is a great deal any way you look at it.</p>

                        <p>The subscription season for OSU MedNet21 begins in September, runs through June, and generates 40 new weekly webcasts. However, the subscription season begins in September and runs through August allowing for a full year of learning opportunities. Programs are not created during the University-recognized holidays of Thanksgiving, Christmas, New Year’s and Easter.</p>
                    </article>
                    <article>
                        <h4>
                            Viewing Audience Statistics
                        </h4>
                        <ul class="no-disc">
                            <li>85% Developed new strategies to address the issues that were discussed.</li>
                            <li>86% Improved their ability and skills.</li>
                            <li>78% Identified changes to implement in their practices.</li>
                            <li>73% Significantly changed the way they will treat and care for their patients.</li>
                            <li>80% Expected positive changes in their patient outcomes.</li>
                            <li>95% Stated presenters displayed knowledge, clarity and enthusiasm.</li>
                            <li>93% Felt the material was organized and presented logically.</li>
                            <li>94% Were very satisfied with the speakers/presenters.</li>
                            <li>94% Stated the learning objectives were achieved.</li>
                        </ul>
                    </article>', CAST(N'2022-07-20T00:00:00.000' AS DateTime), N'7df52f7d-7ede-4d08-b826-72b978383431')
SET IDENTITY_INSERT [dbo].[ContentManagementSystem] OFF
GO
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'AD', N'ANDORRA', N'Andorra', N'AND', 20, 376)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'AE', N'UNITED ARAB EMIRATES', N'United Arab Emirates', N'ARE', 784, 971)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'AF', N'AFGHANISTAN', N'Afghanistan', N'AFG', 4, 93)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'AG', N'ANTIGUA AND BARBUDA', N'Antigua and Barbuda', N'ATG', 28, 1268)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'AI', N'ANGUILLA', N'Anguilla', N'AIA', 660, 1264)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'AL', N'ALBANIA', N'Albania', N'ALB', 8, 355)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'AM', N'ARMENIA', N'Armenia', N'ARM', 51, 374)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'AN', N'NETHERLANDS ANTILLES', N'Netherlands Antilles', N'ANT', 530, 599)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'AO', N'ANGOLA', N'Angola', N'AGO', 24, 244)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'AR', N'ARGENTINA', N'Argentina', N'ARG', 32, 54)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'AS', N'AMERICAN SAMOA', N'American Samoa', N'ASM', 16, 1684)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'AT', N'AUSTRIA', N'Austria', N'AUT', 40, 43)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'AU', N'AUSTRALIA', N'Australia', N'AUS', 36, 61)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'AW', N'ARUBA', N'Aruba', N'ABW', 533, 297)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'AZ', N'AZERBAIJAN', N'Azerbaijan', N'AZE', 31, 994)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'BA', N'BOSNIA AND HERZEGOVINA', N'Bosnia and Herzegovina', N'BIH', 70, 387)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'BB', N'BARBADOS', N'Barbados', N'BRB', 52, 1246)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'BD', N'BANGLADESH', N'Bangladesh', N'BGD', 50, 880)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'BE', N'BELGIUM', N'Belgium', N'BEL', 56, 32)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'BF', N'BURKINA FASO', N'Burkina Faso', N'BFA', 854, 226)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'BG', N'BULGARIA', N'Bulgaria', N'BGR', 100, 359)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'BH', N'BAHRAIN', N'Bahrain', N'BHR', 48, 973)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'BI', N'BURUNDI', N'Burundi', N'BDI', 108, 257)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'BJ', N'BENIN', N'Benin', N'BEN', 204, 229)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'BM', N'BERMUDA', N'Bermuda', N'BMU', 60, 1441)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'BN', N'BRUNEI DARUSSALAM', N'Brunei Darussalam', N'BRN', 96, 673)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'BO', N'BOLIVIA', N'Bolivia', N'BOL', 68, 591)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'BR', N'BRAZIL', N'Brazil', N'BRA', 76, 55)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'BS', N'BAHAMAS', N'Bahamas', N'BHS', 44, 1242)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'BT', N'BHUTAN', N'Bhutan', N'BTN', 64, 975)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'BW', N'BOTSWANA', N'Botswana', N'BWA', 72, 267)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'BY', N'BELARUS', N'Belarus', N'BLR', 112, 375)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'BZ', N'BELIZE', N'Belize', N'BLZ', 84, 501)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'CA', N'CANADA', N'Canada', N'CAN', 124, 1)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'CD', N'CONGO, THE DEMOCRATIC REPUBLIC OF THE', N'Congo, the Democratic Republic of the', N'COD', 180, 242)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'CF', N'CENTRAL AFRICAN REPUBLIC', N'Central African Republic', N'CAF', 140, 236)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'CG', N'CONGO', N'Congo', N'COG', 178, 242)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'CH', N'SWITZERLAND', N'Switzerland', N'CHE', 756, 41)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'CI', N'COTE D''IVOIRE', N'Cote D''Ivoire', N'CIV', 384, 225)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'CK', N'COOK ISLANDS', N'Cook Islands', N'COK', 184, 682)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'CL', N'CHILE', N'Chile', N'CHL', 152, 56)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'CM', N'CAMEROON', N'Cameroon', N'CMR', 120, 237)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'CN', N'CHINA', N'China', N'CHN', 156, 86)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'CO', N'COLOMBIA', N'Colombia', N'COL', 170, 57)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'CR', N'COSTA RICA', N'Costa Rica', N'CRI', 188, 506)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'CU', N'CUBA', N'Cuba', N'CUB', 192, 53)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'CV', N'CAPE VERDE', N'Cape Verde', N'CPV', 132, 238)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'CY', N'CYPRUS', N'Cyprus', N'CYP', 196, 357)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'CZ', N'CZECH REPUBLIC', N'Czech Republic', N'CZE', 203, 420)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'DE', N'GERMANY', N'Germany', N'DEU', 276, 49)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'DJ', N'DJIBOUTI', N'Djibouti', N'DJI', 262, 253)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'DK', N'DENMARK', N'Denmark', N'DNK', 208, 45)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'DM', N'DOMINICA', N'Dominica', N'DMA', 212, 1767)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'DO', N'DOMINICAN REPUBLIC', N'Dominican Republic', N'DOM', 214, 1809)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'DZ', N'ALGERIA', N'Algeria', N'DZA', 12, 213)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'EC', N'ECUADOR', N'Ecuador', N'ECU', 218, 593)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'EE', N'ESTONIA', N'Estonia', N'EST', 233, 372)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'EG', N'EGYPT', N'Egypt', N'EGY', 818, 20)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'EH', N'WESTERN SAHARA', N'Western Sahara', N'ESH', 732, 212)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'ER', N'ERITREA', N'Eritrea', N'ERI', 232, 291)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'ES', N'SPAIN', N'Spain', N'ESP', 724, 34)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'ET', N'ETHIOPIA', N'Ethiopia', N'ETH', 231, 251)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'FI', N'FINLAND', N'Finland', N'FIN', 246, 358)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'FJ', N'FIJI', N'Fiji', N'FJI', 242, 679)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'FK', N'FALKLAND ISLANDS (MALVINAS)', N'Falkland Islands (Malvinas)', N'FLK', 238, 500)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'FM', N'MICRONESIA, FEDERATED STATES OF', N'Micronesia, Federated States of', N'FSM', 583, 691)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'FO', N'FAROE ISLANDS', N'Faroe Islands', N'FRO', 234, 298)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'FR', N'FRANCE', N'France', N'FRA', 250, 33)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'GA', N'GABON', N'Gabon', N'GAB', 266, 241)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'GB', N'UNITED KINGDOM', N'United Kingdom', N'GBR', 826, 44)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'GD', N'GRENADA', N'Grenada', N'GRD', 308, 1473)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'GE', N'GEORGIA', N'Georgia', N'GEO', 268, 995)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'GF', N'FRENCH GUIANA', N'French Guiana', N'GUF', 254, 594)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'GH', N'GHANA', N'Ghana', N'GHA', 288, 233)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'GI', N'GIBRALTAR', N'Gibraltar', N'GIB', 292, 350)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'GL', N'GREENLAND', N'Greenland', N'GRL', 304, 299)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'GM', N'GAMBIA', N'Gambia', N'GMB', 270, 220)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'GN', N'GUINEA', N'Guinea', N'GIN', 324, 224)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'GP', N'GUADELOUPE', N'Guadeloupe', N'GLP', 312, 590)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'GQ', N'EQUATORIAL GUINEA', N'Equatorial Guinea', N'GNQ', 226, 240)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'GR', N'GREECE', N'Greece', N'GRC', 300, 30)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'GT', N'GUATEMALA', N'Guatemala', N'GTM', 320, 502)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'GU', N'GUAM', N'Guam', N'GUM', 316, 1671)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'GW', N'GUINEA-BISSAU', N'Guinea-Bissau', N'GNB', 624, 245)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'GY', N'GUYANA', N'Guyana', N'GUY', 328, 592)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'HK', N'HONG KONG', N'Hong Kong', N'HKG', 344, 852)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'HN', N'HONDURAS', N'Honduras', N'HND', 340, 504)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'HR', N'CROATIA', N'Croatia', N'HRV', 191, 385)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'HT', N'HAITI', N'Haiti', N'HTI', 332, 509)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'HU', N'HUNGARY', N'Hungary', N'HUN', 348, 36)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'ID', N'INDONESIA', N'Indonesia', N'IDN', 360, 62)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'IE', N'IRELAND', N'Ireland', N'IRL', 372, 353)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'IL', N'ISRAEL', N'Israel', N'ISR', 376, 972)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'IN', N'INDIA', N'India', N'IND', 356, 91)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'IQ', N'IRAQ', N'Iraq', N'IRQ', 368, 964)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'IR', N'IRAN, ISLAMIC REPUBLIC OF', N'Iran, Islamic Republic of', N'IRN', 364, 98)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'IS', N'ICELAND', N'Iceland', N'ISL', 352, 354)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'IT', N'ITALY', N'Italy', N'ITA', 380, 39)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'JM', N'JAMAICA', N'Jamaica', N'JAM', 388, 1876)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'JO', N'JORDAN', N'Jordan', N'JOR', 400, 962)
GO
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'JP', N'JAPAN', N'Japan', N'JPN', 392, 81)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'KE', N'KENYA', N'Kenya', N'KEN', 404, 254)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'KG', N'KYRGYZSTAN', N'Kyrgyzstan', N'KGZ', 417, 996)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'KH', N'CAMBODIA', N'Cambodia', N'KHM', 116, 855)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'KI', N'KIRIBATI', N'Kiribati', N'KIR', 296, 686)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'KM', N'COMOROS', N'Comoros', N'COM', 174, 269)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'KN', N'SAINT KITTS AND NEVIS', N'Saint Kitts and Nevis', N'KNA', 659, 1869)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'KP', N'KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF', N'Korea, Democratic People''s Republic of', N'PRK', 408, 850)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'KR', N'KOREA, REPUBLIC OF', N'Korea, Republic of', N'KOR', 410, 82)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'KW', N'KUWAIT', N'Kuwait', N'KWT', 414, 965)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'KY', N'CAYMAN ISLANDS', N'Cayman Islands', N'CYM', 136, 1345)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'KZ', N'KAZAKHSTAN', N'Kazakhstan', N'KAZ', 398, 7)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'LA', N'LAO PEOPLE''S DEMOCRATIC REPUBLIC', N'Lao People''s Democratic Republic', N'LAO', 418, 856)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'LB', N'LEBANON', N'Lebanon', N'LBN', 422, 961)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'LC', N'SAINT LUCIA', N'Saint Lucia', N'LCA', 662, 1758)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'LI', N'LIECHTENSTEIN', N'Liechtenstein', N'LIE', 438, 423)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'LK', N'SRI LANKA', N'Sri Lanka', N'LKA', 144, 94)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'LR', N'LIBERIA', N'Liberia', N'LBR', 430, 231)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'LS', N'LESOTHO', N'Lesotho', N'LSO', 426, 266)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'LT', N'LITHUANIA', N'Lithuania', N'LTU', 440, 370)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'LU', N'LUXEMBOURG', N'Luxembourg', N'LUX', 442, 352)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'LV', N'LATVIA', N'Latvia', N'LVA', 428, 371)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'LY', N'LIBYAN ARAB JAMAHIRIYA', N'Libyan Arab Jamahiriya', N'LBY', 434, 218)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'MA', N'MOROCCO', N'Morocco', N'MAR', 504, 212)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'MC', N'MONACO', N'Monaco', N'MCO', 492, 377)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'MD', N'MOLDOVA, REPUBLIC OF', N'Moldova, Republic of', N'MDA', 498, 373)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'MG', N'MADAGASCAR', N'Madagascar', N'MDG', 450, 261)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'MH', N'MARSHALL ISLANDS', N'Marshall Islands', N'MHL', 584, 692)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'MK', N'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', N'Macedonia, the Former Yugoslav Republic of', N'MKD', 807, 389)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'ML', N'MALI', N'Mali', N'MLI', 466, 223)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'MM', N'MYANMAR', N'Myanmar', N'MMR', 104, 95)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'MN', N'MONGOLIA', N'Mongolia', N'MNG', 496, 976)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'MO', N'MACAO', N'Macao', N'MAC', 446, 853)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'MP', N'NORTHERN MARIANA ISLANDS', N'Northern Mariana Islands', N'MNP', 580, 1670)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'MQ', N'MARTINIQUE', N'Martinique', N'MTQ', 474, 596)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'MR', N'MAURITANIA', N'Mauritania', N'MRT', 478, 222)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'MS', N'MONTSERRAT', N'Montserrat', N'MSR', 500, 1664)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'MT', N'MALTA', N'Malta', N'MLT', 470, 356)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'MU', N'MAURITIUS', N'Mauritius', N'MUS', 480, 230)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'MV', N'MALDIVES', N'Maldives', N'MDV', 462, 960)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'MW', N'MALAWI', N'Malawi', N'MWI', 454, 265)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'MX', N'MEXICO', N'Mexico', N'MEX', 484, 52)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'MY', N'MALAYSIA', N'Malaysia', N'MYS', 458, 60)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'MZ', N'MOZAMBIQUE', N'Mozambique', N'MOZ', 508, 258)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'NA', N'NAMIBIA', N'Namibia', N'NAM', 516, 264)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'NC', N'NEW CALEDONIA', N'New Caledonia', N'NCL', 540, 687)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'NE', N'NIGER', N'Niger', N'NER', 562, 227)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'NF', N'NORFOLK ISLAND', N'Norfolk Island', N'NFK', 574, 672)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'NG', N'NIGERIA', N'Nigeria', N'NGA', 566, 234)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'NI', N'NICARAGUA', N'Nicaragua', N'NIC', 558, 505)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'NL', N'NETHERLANDS', N'Netherlands', N'NLD', 528, 31)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'NO', N'NORWAY', N'Norway', N'NOR', 578, 47)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'NP', N'NEPAL', N'Nepal', N'NPL', 524, 977)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'NR', N'NAURU', N'Nauru', N'NRU', 520, 674)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'NU', N'NIUE', N'Niue', N'NIU', 570, 683)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'NZ', N'NEW ZEALAND', N'New Zealand', N'NZL', 554, 64)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'OM', N'OMAN', N'Oman', N'OMN', 512, 968)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'PA', N'PANAMA', N'Panama', N'PAN', 591, 507)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'PE', N'PERU', N'Peru', N'PER', 604, 51)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'PF', N'FRENCH POLYNESIA', N'French Polynesia', N'PYF', 258, 689)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'PG', N'PAPUA NEW GUINEA', N'Papua New Guinea', N'PNG', 598, 675)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'PH', N'PHILIPPINES', N'Philippines', N'PHL', 608, 63)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'PK', N'PAKISTAN', N'Pakistan', N'PAK', 586, 92)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'PL', N'POLAND', N'Poland', N'POL', 616, 48)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'PM', N'SAINT PIERRE AND MIQUELON', N'Saint Pierre and Miquelon', N'SPM', 666, 508)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'PN', N'PITCAIRN', N'Pitcairn', N'PCN', 612, 0)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'PR', N'PUERTO RICO', N'Puerto Rico', N'PRI', 630, 1787)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'PT', N'PORTUGAL', N'Portugal', N'PRT', 620, 351)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'PW', N'PALAU', N'Palau', N'PLW', 585, 680)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'PY', N'PARAGUAY', N'Paraguay', N'PRY', 600, 595)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'QA', N'QATAR', N'Qatar', N'QAT', 634, 974)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'RE', N'REUNION', N'Reunion', N'REU', 638, 262)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'RO', N'ROMANIA', N'Romania', N'ROM', 642, 40)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'RU', N'RUSSIAN FEDERATION', N'Russian Federation', N'RUS', 643, 70)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'RW', N'RWANDA', N'Rwanda', N'RWA', 646, 250)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'SA', N'SAUDI ARABIA', N'Saudi Arabia', N'SAU', 682, 966)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'SB', N'SOLOMON ISLANDS', N'Solomon Islands', N'SLB', 90, 677)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'SC', N'SEYCHELLES', N'Seychelles', N'SYC', 690, 248)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'SD', N'SUDAN', N'Sudan', N'SDN', 736, 249)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'SE', N'SWEDEN', N'Sweden', N'SWE', 752, 46)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'SG', N'SINGAPORE', N'Singapore', N'SGP', 702, 65)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'SH', N'SAINT HELENA', N'Saint Helena', N'SHN', 654, 290)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'SI', N'SLOVENIA', N'Slovenia', N'SVN', 705, 386)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'SJ', N'SVALBARD AND JAN MAYEN', N'Svalbard and Jan Mayen', N'SJM', 744, 47)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'SK', N'SLOVAKIA', N'Slovakia', N'SVK', 703, 421)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'SL', N'SIERRA LEONE', N'Sierra Leone', N'SLE', 694, 232)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'SM', N'SAN MARINO', N'San Marino', N'SMR', 674, 378)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'SN', N'SENEGAL', N'Senegal', N'SEN', 686, 221)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'SO', N'SOMALIA', N'Somalia', N'SOM', 706, 252)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'SR', N'SURINAME', N'Suriname', N'SUR', 740, 597)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'ST', N'SAO TOME AND PRINCIPE', N'Sao Tome and Principe', N'STP', 678, 239)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'SV', N'EL SALVADOR', N'El Salvador', N'SLV', 222, 503)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'SY', N'SYRIAN ARAB REPUBLIC', N'Syrian Arab Republic', N'SYR', 760, 963)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'SZ', N'SWAZILAND', N'Swaziland', N'SWZ', 748, 268)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'TC', N'TURKS AND CAICOS ISLANDS', N'Turks and Caicos Islands', N'TCA', 796, 1649)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'TD', N'CHAD', N'Chad', N'TCD', 148, 235)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'TG', N'TOGO', N'Togo', N'TGO', 768, 228)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'TH', N'THAILAND', N'Thailand', N'THA', 764, 66)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'TJ', N'TAJIKISTAN', N'Tajikistan', N'TJK', 762, 992)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'TK', N'TOKELAU', N'Tokelau', N'TKL', 772, 690)
GO
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'TM', N'TURKMENISTAN', N'Turkmenistan', N'TKM', 795, 7370)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'TN', N'TUNISIA', N'Tunisia', N'TUN', 788, 216)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'TO', N'TONGA', N'Tonga', N'TON', 776, 676)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'TR', N'TURKEY', N'Turkey', N'TUR', 792, 90)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'TT', N'TRINIDAD AND TOBAGO', N'Trinidad and Tobago', N'TTO', 780, 1868)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'TV', N'TUVALU', N'Tuvalu', N'TUV', 798, 688)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'TW', N'TAIWAN, PROVINCE OF CHINA', N'Taiwan, Province of China', N'TWN', 158, 886)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'TZ', N'TANZANIA, UNITED REPUBLIC OF', N'Tanzania, United Republic of', N'TZA', 834, 255)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'UA', N'UKRAINE', N'Ukraine', N'UKR', 804, 380)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'UG', N'UGANDA', N'Uganda', N'UGA', 800, 256)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'US', N'UNITED STATES', N'United States', N'USA', 840, 1)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'UY', N'URUGUAY', N'Uruguay', N'URY', 858, 598)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'UZ', N'UZBEKISTAN', N'Uzbekistan', N'UZB', 860, 998)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'VA', N'HOLY SEE (VATICAN CITY STATE)', N'Holy See (Vatican City State)', N'VAT', 336, 39)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'VC', N'SAINT VINCENT AND THE GRENADINES', N'Saint Vincent and the Grenadines', N'VCT', 670, 1784)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'VE', N'VENEZUELA', N'Venezuela', N'VEN', 862, 58)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'VG', N'VIRGIN ISLANDS, BRITISH', N'Virgin Islands, British', N'VGB', 92, 1284)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'VI', N'VIRGIN ISLANDS, U.S.', N'Virgin Islands, U.s.', N'VIR', 850, 1340)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'VN', N'VIET NAM', N'Viet Nam', N'VNM', 704, 84)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'VU', N'VANUATU', N'Vanuatu', N'VUT', 548, 678)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'WF', N'WALLIS AND FUTUNA', N'Wallis and Futuna', N'WLF', 876, 681)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'WS', N'SAMOA', N'Samoa', N'WSM', 882, 684)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'YE', N'YEMEN', N'Yemen', N'YEM', 887, 967)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'ZA', N'SOUTH AFRICA', N'South Africa', N'ZAF', 710, 27)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'ZM', N'ZAMBIA', N'Zambia', N'ZMB', 894, 260)
INSERT [dbo].[Countries] ([Abbreviation], [Name], [UppercaseName], [AbbreviationThree], [NumberCode], [PhoneCode]) VALUES (N'ZW', N'ZIMBABWE', N'Zimbabwe', N'ZWE', 716, 263)
GO
SET IDENTITY_INSERT [dbo].[DegreeMapping] ON 

INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (1, 57, NULL, 1, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (2, 51, NULL, 1, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (3, 27, NULL, 2, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (4, 38, NULL, 3, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (5, 28, NULL, 4, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (6, 48, NULL, 5, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (7, 45, NULL, 7, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (8, 32, NULL, 7, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (9, 41, NULL, 8, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (10, 42, NULL, 9, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (11, 55, NULL, 33, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (12, 6, NULL, 10, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (13, 30, NULL, 11, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (14, 34, NULL, 12, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (15, 44, NULL, 13, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (16, 46, NULL, 14, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (17, 56, NULL, 39, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (18, 29, NULL, 15, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (19, 40, NULL, 16, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (20, 1, NULL, 17, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (21, 47, NULL, 18, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (22, 54, NULL, 38, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (23, 18, NULL, 19, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (24, 49, NULL, 20, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (25, 36, NULL, 21, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (26, 25, NULL, 22, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (27, 43, NULL, 23, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (28, 50, NULL, 24, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (29, 33, NULL, 25, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (30, 26, NULL, 26, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (31, 37, NULL, 27, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (32, 35, NULL, 28, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (33, 31, NULL, 29, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (34, 53, NULL, 40, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (35, 52, NULL, 37, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (36, 58, NULL, 41, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (37, 59, NULL, 42, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (38, 60, NULL, 43, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (39, 61, NULL, 7, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (40, 62, NULL, 45, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (41, 63, NULL, 46, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (42, 64, NULL, 47, NULL)
INSERT [dbo].[DegreeMapping] ([ID], [OldID], [OldDegreeName], [NewID], [NewDegreeName]) VALUES (43, 65, NULL, 48, NULL)
SET IDENTITY_INSERT [dbo].[DegreeMapping] OFF
GO
SET IDENTITY_INSERT [dbo].[Degrees] ON 

INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (1, N'ARNP', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (2, N'Associate Degree', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (3, N'AT', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (4, N'Bachelor Degree', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (5, N'BSN', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (6, N'CFP', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (7, N'CNP', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (8, N'DDS', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (9, N'DMD', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (10, N'DO', 0, 1, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (11, N'Doctorial Degree', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (12, N'DPM', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (13, N'EdD', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (14, N'EMT', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (15, N'Master''s Degree', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (16, N'MBBS', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (17, N'MD', 0, 1, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (18, N'MSN', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (19, N'None', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (20, N'NP', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (21, N'OT', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (22, N'Other', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (23, N'PA', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (24, N'PA-C', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (25, N'PharmD', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (26, N'PhD', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (27, N'PT', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (28, N'RD', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (29, N'RN', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (30, N'PTA', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (31, N'LCSW', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (32, N'JD', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (33, N'DNP', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (34, N'LMSW', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (35, N'Radiology Technician', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (36, N'UT', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (37, N'RDMS', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (38, N'MSW', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (39, N'LPN', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (40, N'RPH', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (41, N'OD', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (42, N'PsyD', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (43, N'DC', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (44, N'CNP', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (45, N'CRNA', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (46, N'CNS', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (47, N'CNM', 1, 0, NULL)
INSERT [dbo].[Degrees] ([ID], [Degree], [IsEditable], [CountsAsPhysician], [OldID]) VALUES (48, N'CPNP', 1, 0, NULL)
SET IDENTITY_INSERT [dbo].[Degrees] OFF
GO
INSERT [dbo].[EmailFrequencies] ([Frequency]) VALUES (N'Every Three Months')
INSERT [dbo].[EmailFrequencies] ([Frequency]) VALUES (N'Every Two Months')
INSERT [dbo].[EmailFrequencies] ([Frequency]) VALUES (N'Monthly')
INSERT [dbo].[EmailFrequencies] ([Frequency]) VALUES (N'Never')
GO
SET IDENTITY_INSERT [dbo].[EmailQueues] ON 

INSERT [dbo].[EmailQueues] ([ID], [QueueName], [QueuePriority], [IsEnabled], [IsDeleted]) VALUES (1, N'Annual Faculty Disclosure Remdiner', 1, 1, 0)
SET IDENTITY_INSERT [dbo].[EmailQueues] OFF
GO
INSERT [dbo].[EmailTypes] ([Type]) VALUES (N'ConferenceNewsletters')
INSERT [dbo].[EmailTypes] ([Type]) VALUES (N'CreditNotifications')
INSERT [dbo].[EmailTypes] ([Type]) VALUES (N'EnduringMaterialNewsletters')
INSERT [dbo].[EmailTypes] ([Type]) VALUES (N'FacultyDisclosureReminder')
INSERT [dbo].[EmailTypes] ([Type]) VALUES (N'FacultyDisclosureReminder-All')
INSERT [dbo].[EmailTypes] ([Type]) VALUES (N'FacultyDisclosureReminder-Available')
INSERT [dbo].[EmailTypes] ([Type]) VALUES (N'FacultyDisclosureReminder-Upcoming')
INSERT [dbo].[EmailTypes] ([Type]) VALUES (N'GeneralAnnouncements')
INSERT [dbo].[EmailTypes] ([Type]) VALUES (N'GrandRoundsNewsletters')
INSERT [dbo].[EmailTypes] ([Type]) VALUES (N'SpeakerChecklistReminder')
INSERT [dbo].[EmailTypes] ([Type]) VALUES (N'WebcastNewsletters')
GO
INSERT [dbo].[EventProvidership] ([Type]) VALUES (N'Direct')
INSERT [dbo].[EventProvidership] ([Type]) VALUES (N'Joint')
GO
INSERT [dbo].[EventStatus] ([Status]) VALUES (N'Canceled')
INSERT [dbo].[EventStatus] ([Status]) VALUES (N'Hidden')
INSERT [dbo].[EventStatus] ([Status]) VALUES (N'Occurring')
INSERT [dbo].[EventStatus] ([Status]) VALUES (N'Unpublished')
GO
INSERT [dbo].[EventTypes] ([EventType]) VALUES (N'Conference')
INSERT [dbo].[EventTypes] ([EventType]) VALUES (N'EnduringMaterial')
INSERT [dbo].[EventTypes] ([EventType]) VALUES (N'RSSeries')
INSERT [dbo].[EventTypes] ([EventType]) VALUES (N'Webcasts')
GO
SET IDENTITY_INSERT [dbo].[MOCCreditTypes] ON 

INSERT [dbo].[MOCCreditTypes] ([ID], [TypeName]) VALUES (1, N'Medical Knowledge')
INSERT [dbo].[MOCCreditTypes] ([ID], [TypeName]) VALUES (2, N'Practice Assesment')
INSERT [dbo].[MOCCreditTypes] ([ID], [TypeName]) VALUES (3, N'Patient Safety')
SET IDENTITY_INSERT [dbo].[MOCCreditTypes] OFF
GO
INSERT [dbo].[PaymentMethods] ([Method]) VALUES (N'Check')
INSERT [dbo].[PaymentMethods] ([Method]) VALUES (N'Credit Card - Auto')
INSERT [dbo].[PaymentMethods] ([Method]) VALUES (N'Credit Card - Manual')
INSERT [dbo].[PaymentMethods] ([Method]) VALUES (N'Credit Card - Nelnet')
INSERT [dbo].[PaymentMethods] ([Method]) VALUES (N'Free')
INSERT [dbo].[PaymentMethods] ([Method]) VALUES (N'Other')
INSERT [dbo].[PaymentMethods] ([Method]) VALUES (N'Waived')
INSERT [dbo].[PaymentMethods] ([Method]) VALUES (N'eRquest')
INSERT [dbo].[PaymentMethods] ([Method]) VALUES (N'Scholarship')
INSERT [dbo].[PaymentMethods] ([Method]) VALUES (N'Null')
INSERT [dbo].[PaymentMethods] ([Method]) VALUES (N'Hospital Assigned')
GO
SET IDENTITY_INSERT [dbo].[ProfessionMapping] ON 

INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (1, 22, 1)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (2, 8, 2)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (3, 21, 16)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (4, 30, 36)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (5, 29, 12)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (6, 16, 18)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (7, 20, 36)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (8, 6, 13)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (9, 14, 27)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (10, 26, 13)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (11, 19, 12)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (12, 10, 15)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (13, 1, 16)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (14, 17, 16)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (15, 18, 16)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (16, 11, 36)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (17, 25, 17)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (18, 9, 3)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (19, 3, 18)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (20, 31, 18)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (21, 4, 37)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (22, 28, 19)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (23, 13, 23)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (24, 12, 8)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (25, 5, 13)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (26, 27, 16)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (27, 15, 18)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (28, 7, 24)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (29, 23, 37)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (30, 2, 26)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (31, 24, 27)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (32, 32, 38)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (33, 33, 39)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (34, 34, 40)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (35, 35, 41)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (36, 36, 42)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (37, 37, 43)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (38, 38, 44)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (39, 39, 45)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (40, 40, 46)
INSERT [dbo].[ProfessionMapping] ([ID], [OldID], [NewID]) VALUES (41, 41, 47)
SET IDENTITY_INSERT [dbo].[ProfessionMapping] OFF
GO
SET IDENTITY_INSERT [dbo].[Professions] ON 

INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (1, N'Administration', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (2, N'Athletic Training', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (3, N'Attorney', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (4, N'Biomedical Informatics', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (5, N'Biomedical Scientist', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (6, N'Chiropractor', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (7, N'Dentist', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (8, N'Dietetics', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (9, N'Epidemiology', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (10, N'Laboratory Technician', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (11, N'Midwife', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (12, N'Nurse Practitioner', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (13, N'Nursing', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (14, N'Nutrition', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (15, N'Occupational Therapist', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (16, N'Other', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (17, N'Pharmacy', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (18, N'Physician', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (19, N'Physician Assistant', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (20, N'Physicist', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (21, N'Podiatry', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (22, N'Psychology', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (23, N'Radiology Technician', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (24, N'Respiratory Therapy', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (25, N'Social Work', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (26, N'Speech Therapist', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (27, N'Student', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (28, N'Ultrasound Technician', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (29, N'Unspecified', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (30, N'Veterinarian', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (31, N'Physical Therapist', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (32, N'Physical Therapist Assistant', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (33, N'Registered Diagnostic Medical  Sonographer', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (34, N'Optometry', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (35, N'Medical Perfusion', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (36, N'Other Allied Medical Profession', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (37, N'Retired', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (38, N'Doctor of Optometry', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (39, N'Anatomy', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (40, N'Advanced Practice Provider ', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (41, N'Physician Assistant', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (42, N'Dentist', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (43, N'Psychologist', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (44, N'Podiatrist', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (45, N'Chriropractor', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (46, N'Nurse Practitioner', NULL)
INSERT [dbo].[Professions] ([ID], [Profession], [OldID]) VALUES (46, N'Pharmaceutical Representative', NULL)
SET IDENTITY_INSERT [dbo].[Professions] OFF
GO
SET IDENTITY_INSERT [dbo].[Specialties] ON 

INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (1, N'Allergy and Immunology', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (2, N'Anesthesiology', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (3, N'Colon and Rectal Surgery', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (4, N'Dental Public Health', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (5, N'Dermatology', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (6, N'Emergency Medicine', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (7, N'Endodontics', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (8, N'Family Medicine', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (9, N'Internal Medicine', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (10, N'Medical Genetics and Genomics', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (11, N'Neurological Surgery', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (12, N'Nuclear Medicine', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (13, N'Obstetrics and Gynecology', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (14, N'Ophthalmology', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (15, N'Oral and Maxillofacial Pathology', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (16, N'Oral and Maxillofacial Surgery', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (17, N'Orthodontics and Dentofacial Orthopedics', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (18, N'Orthopaedic Surgery', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (19, N'Other', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (20, N'Otolaryngology', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (21, N'Pathology', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (22, N'Pediatric Dentistry', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (23, N'Pediatrics', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (24, N'Periodontics', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (25, N'Physical Medicine and Rehabilitation', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (26, N'Plastic Surgery', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (27, N'Preventive Medicine', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (28, N'Prosthodontics', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (29, N'Psychiatry', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (30, N'Radiology', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (31, N'Surgery', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (32, N'Thoracic Surgery', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (33, N'Unspecified', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (34, N'Urology', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (35, N'Vascular Surgery', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (36, N'Anatomic Pathology', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (37, N'Clinical Cytogenetics', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (38, N'Clinical Genetics', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (39, N'Clinical Molecular Genetics', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (40, N'Clinical Pathology', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (41, N'Interventional Radiology and Diagnostic Radiology', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (42, N'Medical Physics', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (43, N'Neurology with Special Qualification in Child Neurology', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (44, N'Occupational Medicine', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (45, N'Public Health and General Preventive Medicine', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (46, N'Radiation Oncology', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (49, N'Neurology', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (50, N'Orthopaedic', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (51, N'Social Work', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (52, N'Law', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (53, N'Podiatry', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (54, N'Surgical Oncology', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (55, N'Palliative Care', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (56, N'Oncology', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (57, N'Psychology', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (58, N'General Dentistry', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (59, N'Administration', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (60, N'Alternative Medicine', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (61, N'Athletic Training', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (62, N'Cardiovascular Medicine', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (63, N'Circulation Technology', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (64, N'Critical Care', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (65, N'Endocrinology Diabetes', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (66, N'Gastroenterology Hepatology', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (67, N'Hematology', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (68, N'Hospital Medicine', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (69, N'Human Genetics', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (70, N'Infectious Disease', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (71, N'Nephrology', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (72, N'Nursing', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (73, N'Nutrition', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (74, N'Sports Medicine', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (75, N'Transplant', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (76, N'Trauma', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (77, N'Pharmacy', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (78, N'Physician Assistant', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (79, N'Pulmonary', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (80, N'Anatomy', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (81, N'Primary Care', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (82, N'Office Management', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (83, N'Kidney Diseases', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (84, N'Sexual Dysfunction', NULL)
INSERT [dbo].[Specialties] ([ID], [Specialty], [OldID]) VALUES (85, N'Telemedicine', NULL)
SET IDENTITY_INSERT [dbo].[Specialties] OFF
GO
SET IDENTITY_INSERT [dbo].[SpecialtyMapping] ON 

INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (1, 82, 6)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (2, 78, 29)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (3, 63, 59)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (4, 35, 1)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (5, 36, 60)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (6, 2, 2)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (7, 37, 61)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (8, 84, 29)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (9, 83, 29)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (10, 64, 19)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (11, 58, 62)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (12, 59, 62)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (13, 90, 19)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (14, 38, 63)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (15, 39, 3)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (16, 80, 64)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (17, 40, 64)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (18, 3, 58)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (19, 41, 5)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (20, 71, 65)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (21, 27, 73)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (22, 66, 62)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (23, 4, 6)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (24, 42, 6)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (25, 43, 65)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (26, 44, 70)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (27, 5, 8)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (28, 45, 66)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (29, 6, 9)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (30, 7, 31)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (31, 57, 8)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (32, 60, 67)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (33, 70, 68)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (34, 86, 30)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (35, 85, 1)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (36, 46, 70)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (37, 74, 60)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (38, 8, 9)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (39, 47, 9)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (40, 95, 13)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (41, 48, 10)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (42, 77, 56)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (43, 76, 34)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (44, 49, 71)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (45, 9, 49)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (46, 79, 49)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (47, 10, 11)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (48, 50, 72)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (49, 28, 72)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (50, 91, 72)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (51, 51, 73)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (52, 11, 13)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (53, 13, 44)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (54, 14, 56)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (55, 15, 14)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (56, 12, 12)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (57, 16, 18)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (58, 65, 50)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (59, 17, 20)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (60, 93, 55)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (61, 67, 55)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (62, 20, 21)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (63, 21, 23)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (64, 34, 62)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (65, 52, 77)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (66, 23, 77)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (67, 24, 25)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (68, 19, 78)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (69, 25, 26)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (70, 61, 53)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (71, 92, 1)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (72, 94, 9)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (73, 18, 29)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (74, 53, 57)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (75, 75, 45)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (76, 54, 79)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (77, 68, 46)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (78, 26, 30)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (79, 29, 79)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (80, 55, 1)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (81, 69, 79)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (82, 30, 51)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (83, 56, 74)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (84, 87, 54)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (85, 31, 32)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (86, 81, 75)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (87, 88, 41)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (88, 33, 33)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (89, 32, 34)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (90, 62, 35)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (91, 89, 73)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (92, 73, 13)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (93, 72, 76)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (94, 96, 35)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (95, 97, 19)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (96, 98, 80)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (97, 99, 9)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (98, 100, 59)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (99, 101, 16)
Go
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (100, 102, 31)
INSERT [dbo].[SpecialtyMapping] ([ID], [OldID], [NewID]) VALUES (101, 103, 59)
SET IDENTITY_INSERT [dbo].[SpecialtyMapping] OFF
GO
SET IDENTITY_INSERT [dbo].[SubSpecialties] ON 

INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (1, 2, N'Critical Care Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (2, 2, N'Hospice and Palliative Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (3, 2, N'Pain Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (4, 2, N'Pediatric Anesthesiology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (5, 2, N'Sleep Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (6, 5, N'Dermatopathology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (7, 5, N'Pediatric Dermatology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (8, 6, N'Anesthesiology Critical Care Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (9, 6, N'Emergency Medical Services')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (10, 6, N'Hospice and Palliative Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (11, 6, N'Internal Medicine-Critical Care Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (12, 6, N'Medical Toxicology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (13, 6, N'Pain Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (14, 6, N'Pediatric Emergency Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (15, 6, N'Sports Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (16, 6, N'Undersea and Hyperbaric Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (17, 8, N'Adolescent Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (18, 8, N'Geriatric Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (19, 8, N'Hospice and Palliative Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (20, 8, N'Pain Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (21, 8, N'Sleep Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (22, 8, N'Sports Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (23, 9, N'Adolescent Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (24, 9, N'Adult Congenital Heart Disease')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (25, 9, N'Advanced Heart Failure and Transplant Cardiology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (26, 9, N'Cardiovascular Disease')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (27, 9, N'Clinical Cardiac Electrophysiology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (28, 9, N'Critical Care Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (29, 9, N'Endocrinology, Diabetes and Metabolism')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (30, 9, N'Gastroenterology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (31, 9, N'Geriatric Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (32, 9, N'Hematology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (33, 9, N'Hospice and Palliative Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (34, 9, N'Infectious Disease')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (35, 9, N'Interventional Cardiology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (36, 9, N'Medical Oncology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (37, 9, N'Nephrology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (38, 9, N'Pulmonary Disease')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (39, 9, N'Rheumatology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (40, 9, N'Sleep Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (41, 9, N'Sports Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (42, 9, N'Transplant Hepatology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (43, 10, N'Medical Biochemical Genetics')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (44, 10, N'Molecular Genetic Pathology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (45, 13, N'Critical Care Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (46, 13, N'Female Pelvic Medicine and Reconstructive Surgery')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (47, 13, N'Gynecologic Oncology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (48, 13, N'Hospice and Palliative Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (49, 13, N'Maternal and Fetal Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (50, 13, N'Reproductive Endocrinology/Infertility')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (51, 18, N'Orthopaedic Sports Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (52, 18, N'Surgery of the Hand')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (53, 20, N'Neurotology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (54, 20, N'Pediatric Otolaryngology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (55, 20, N'Plastic Surgery Within the Head and Neck')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (56, 20, N'Sleep Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (57, 21, N'Blood Banking/Transfusion Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (58, 21, N'Clinical Informatics')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (59, 21, N'Cytopathology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (60, 21, N'Dermatopathology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (61, 21, N'Neuropathology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (62, 21, N'Pathology - Chemical')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (63, 21, N'Pathology - Forensic ')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (64, 21, N'Pathology - Hematology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (65, 21, N'Pathology - Medical Microbiology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (66, 21, N'Pathology - Molecular Genetic')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (67, 21, N'Pathology - Pediatric')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (68, 23, N'Adolescent Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (69, 23, N'Child Abuse Pediatrics')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (70, 23, N'Developmental-Behavioral Pediatrics')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (71, 23, N'Hospice and Palliative Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (72, 23, N'Medical Toxicology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (73, 23, N'Neonatal-Perinatal Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (74, 23, N'Pediatric Cardiology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (75, 23, N'Pediatric Critical Care Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (76, 23, N'Pediatric Emergency Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (77, 23, N'Pediatric Endocrinology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (78, 23, N'Pediatric Gastroenterology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (79, 23, N'Pediatric Hematology-Oncology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (80, 23, N'Pediatric Infectious Diseases')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (81, 23, N'Pediatric Nephrology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (82, 23, N'Pediatric Pulmonology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (83, 23, N'Pediatric Rheumatology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (84, 23, N'Pediatric Transplant Hepatology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (85, 23, N'Sleep Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (86, 23, N'Sports Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (87, 25, N'Brain Injury Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (88, 25, N'Hospice and Palliative Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (89, 25, N'Neuromuscular Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (90, 25, N'Pain Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (91, 25, N'Pediatric Rehabilitation Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (92, 25, N'Spinal Cord Injury Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (93, 25, N'Sports Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (94, 26, N'Plastic Surgery Within the Head and Neck')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (95, 26, N'Surgery of the Hand')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (96, 27, N'Addiction Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (97, 27, N'Clinical Informatics')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (98, 27, N'Medical Toxicology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (99, 27, N'Undersea and Hyperbaric Medicine')
GO
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (100, 29, N'Addiction Psychiatry')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (101, 29, N'Brain Injury Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (102, 29, N'Child and Adolescent Psychiatry')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (103, 29, N'Clinical Neurophysiology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (105, 29, N'Forensic Psychiatry')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (106, 29, N'Geriatric Psychiatry')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (107, 29, N'Hospice and Palliative Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (111, 29, N'Psychosomatic Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (112, 29, N'Sleep Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (114, 30, N'Hospice and Palliative Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (115, 30, N'Neuroradiology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (116, 30, N'Nuclear Radiology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (117, 30, N'Pain Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (118, 30, N'Pediatric Radiology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (119, 30, N'Vascular and Interventional Radiology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (120, 31, N'Complex General Surgical Oncology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (121, 31, N'Hospice and Palliative Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (122, 31, N'Pediatric Surgery')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (123, 31, N'Surgery of the Hand')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (124, 31, N'Surgical Critical Care')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (125, 35, N'Complex General Surgical Oncology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (126, 35, N'Hospice and Palliative Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (127, 35, N'Pediatric Surgery')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (128, 35, N'Surgery of the Hand')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (129, 35, N'Surgical Critical Care')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (130, 32, N'Congenital Cardiac Surgery')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (131, 34, N'Female Pelvic Medicine and Reconstructive Surgery')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (132, 34, N'Pediatric Urology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (133, 36, N'Blood Banking/Transfusion Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (134, 36, N'Clinical Informatics')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (135, 36, N'Cytopathology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (136, 36, N'Dermatopathology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (137, 36, N'Neuropathology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (138, 36, N'Pathology - Chemical')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (139, 36, N'Pathology - Forensic ')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (140, 36, N'Pathology - Hematology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (141, 36, N'Pathology - Medical Microbiology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (142, 36, N'Pathology - Molecular Genetic')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (143, 36, N'Pathology - Pediatric')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (144, 37, N'Medical Biochemical Genetics')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (145, 37, N'Molecular Genetic Pathology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (146, 38, N'Medical Biochemical Genetics')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (147, 38, N'Molecular Genetic Pathology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (148, 39, N'Medical Biochemical Genetics')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (149, 39, N'Molecular Genetic Pathology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (150, 40, N'Blood Banking/Transfusion Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (151, 40, N'Clinical Informatics')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (152, 40, N'Cytopathology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (153, 40, N'Dermatopathology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (154, 40, N'Neuropathology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (155, 40, N'Pathology - Chemical')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (156, 40, N'Pathology - Forensic ')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (157, 40, N'Pathology - Hematology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (158, 40, N'Pathology - Medical Microbiology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (159, 40, N'Pathology - Molecular Genetic')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (160, 40, N'Pathology - Pediatric')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (161, 41, N'Hospice and Palliative Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (162, 41, N'Neuroradiology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (163, 41, N'Nuclear Radiology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (164, 41, N'Pain Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (165, 41, N'Pediatric Radiology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (166, 41, N'Vascular and Interventional Radiology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (167, 42, N'Hospice and Palliative Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (168, 42, N'Neuroradiology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (169, 42, N'Nuclear Radiology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (170, 42, N'Pain Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (171, 42, N'Pediatric Radiology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (172, 42, N'Vascular and Interventional Radiology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (173, 43, N'Addiction Psychiatry')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (174, 43, N'Brain Injury Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (175, 43, N'Child and Adolescent Psychiatry')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (176, 43, N'Clinical Neurophysiology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (177, 43, N'Epilepsy')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (178, 43, N'Forensic Psychiatry')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (179, 43, N'Geriatric Psychiatry')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (180, 43, N'Hospice and Palliative Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (181, 43, N'Neurodevelopmental Disabilities')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (182, 43, N'Neuromuscular Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (183, 43, N'Pain Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (184, 43, N'Psychosomatic Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (185, 43, N'Sleep Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (186, 43, N'Vascular Neurology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (187, 44, N'Addiction Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (188, 44, N'Clinical Informatics')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (189, 44, N'Medical Toxicology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (190, 44, N'Undersea and Hyperbaric Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (191, 45, N'Addiction Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (192, 45, N'Clinical Informatics')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (193, 45, N'Medical Toxicology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (194, 45, N'Undersea and Hyperbaric Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (195, 46, N'Hospice and Palliative Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (196, 46, N'Neuroradiology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (197, 46, N'Nuclear Radiology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (198, 46, N'Pain Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (199, 46, N'Pediatric Radiology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (200, 46, N'Vascular and Interventional Radiology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (206, 49, N'Brain Injury Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (207, 49, N'Clinical Neurophysiology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (208, 49, N'Epilepsy')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (209, 49, N'Forensic Psychiatry')
GO
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (210, 49, N'Hospice and Palliative Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (211, 49, N'Neurodevelopmental Disabilities')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (212, 49, N'Neuromuscular Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (213, 49, N'Pain Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (214, 49, N'Sleep Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (215, 49, N'Vascular Neurology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (216, 31, N'General Surgery')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (217, 31, N'Bariatric, Foregut and Advanced GI Surgery')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (218, 21, N'Pathology - Anatomic')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (219, 30, N'Nuclear Medicine')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (220, 30, N'Interventional Radiology & Diagnostic Radiology')
INSERT [dbo].[SubSpecialties] ([ID], [ParentSpecialtyID], [SubSpecialty]) VALUES (221, 29, N'Psychology')
SET IDENTITY_INSERT [dbo].[SubSpecialties] OFF
GO
SET IDENTITY_INSERT [dbo].[TitleMapping] ON 

INSERT [dbo].[TitleMapping] ([ID], [OldID], [NewID]) VALUES (1, 1, 1)
INSERT [dbo].[TitleMapping] ([ID], [OldID], [NewID]) VALUES (2, 2, 2)
INSERT [dbo].[TitleMapping] ([ID], [OldID], [NewID]) VALUES (3, 3, 3)
INSERT [dbo].[TitleMapping] ([ID], [OldID], [NewID]) VALUES (4, 4, 4)
INSERT [dbo].[TitleMapping] ([ID], [OldID], [NewID]) VALUES (5, 5, 5)
INSERT [dbo].[TitleMapping] ([ID], [OldID], [NewID]) VALUES (6, 6, 7)
INSERT [dbo].[TitleMapping] ([ID], [OldID], [NewID]) VALUES (7, 7, 8)
SET IDENTITY_INSERT [dbo].[TitleMapping] OFF
GO
SET IDENTITY_INSERT [dbo].[Titles] ON 

INSERT [dbo].[Titles] ([ID], [Title]) VALUES (1, N'Mr.')
INSERT [dbo].[Titles] ([ID], [Title]) VALUES (2, N'Mrs.')
INSERT [dbo].[Titles] ([ID], [Title]) VALUES (3, N'Miss')
INSERT [dbo].[Titles] ([ID], [Title]) VALUES (4, N'Prof.')
INSERT [dbo].[Titles] ([ID], [Title]) VALUES (5, N'Ph.D.')
INSERT [dbo].[Titles] ([ID], [Title]) VALUES (7, N'Dr.')
INSERT [dbo].[Titles] ([ID], [Title]) VALUES (8, N'Ms.')
SET IDENTITY_INSERT [dbo].[Titles] OFF
GO
SET IDENTITY_INSERT [HangFire].[AggregatedCounter] ON 

INSERT [HangFire].[AggregatedCounter] ([Id], [Key], [Value], [ExpireAt]) VALUES (1, N'stats:succeeded', 998, NULL)
INSERT [HangFire].[AggregatedCounter] ([Id], [Key], [Value], [ExpireAt]) VALUES (10, N'stats:deleted', 24, NULL)
SET IDENTITY_INSERT [HangFire].[AggregatedCounter] OFF
GO
INSERT [HangFire].[Schema] ([Version]) VALUES (5)
GO
INSERT [HangFire].[Server] ([Id], [Data], [LastHeartbeat]) VALUES (N'robalienware.f3b9bb47-5dfe-4beb-99a8-04a16346e394:25432:2971fc19-960d-4c32-84e2-d53206fe87f4', N'{"WorkerCount":20,"Queues":["default"],"StartedAt":"2022-09-23T19:59:17.0440957Z"}', CAST(N'2022-09-23T20:05:48.263' AS DateTime))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoles]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoles] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUsers]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUsers] ON [dbo].[AspNetUsers]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUsers_1]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUsers_1] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceCreditImports]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceCreditImports] ON [dbo].[ConferenceCreditImports]
(
	[ConferenceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceEvaluationCompetencies]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceEvaluationCompetencies] ON [dbo].[ConferenceEvaluationCompetencies]
(
	[ConferenceEvaluationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceEvaluationProgramResults]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceEvaluationProgramResults] ON [dbo].[ConferenceEvaluationProgramResults]
(
	[ConferenceEvaluationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceEvaluations]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceEvaluations] ON [dbo].[ConferenceEvaluations]
(
	[IsDeleted] ASC,
	[ConferenceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceEvaluatonSpeakers]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceEvaluatonSpeakers] ON [dbo].[ConferenceEvaluationSpeakers]
(
	[TopicID] ASC,
	[ConferenceEvaluationID] ASC,
	[ConferenceSpeakerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceFiles]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceFiles] ON [dbo].[ConferenceFiles]
(
	[ConferenceID] ASC,
	[IsDeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceFiles_1]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceFiles_1] ON [dbo].[ConferenceFiles]
(
	[ConferenceID] ASC,
	[IsDeleted] ASC,
	[Rank] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceJointProviders]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceJointProviders] ON [dbo].[ConferenceJointProviders]
(
	[ConferenceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceNotes]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceNotes] ON [dbo].[ConferenceNotes]
(
	[ConferenceID] ASC,
	[IsDeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceOptions]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceOptions] ON [dbo].[ConferenceOptions]
(
	[GroupID] ASC,
	[IsDeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceOptions_1]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceOptions_1] ON [dbo].[ConferenceOptions]
(
	[Rank] ASC,
	[GroupID] ASC,
	[IsDeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceOptionsGroups]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceOptionsGroups] ON [dbo].[ConferenceOptionsGroups]
(
	[IsDeleted] ASC,
	[ConferenceID] ASC,
	[Rank] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceOptionsGroups_1]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceOptionsGroups_1] ON [dbo].[ConferenceOptionsGroups]
(
	[IsDeleted] ASC,
	[ConferenceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferencePrices]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferencePrices] ON [dbo].[ConferencePrices]
(
	[IsDeleted] ASC,
	[ConferenceID] ASC,
	[Rank] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferencePrices_1]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferencePrices_1] ON [dbo].[ConferencePrices]
(
	[IsDeleted] ASC,
	[ConferenceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceRegistrations]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceRegistrations] ON [dbo].[ConferenceRegistrations]
(
	[ConferenceID] ASC,
	[IsDeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ConferenceRegistrations_1]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceRegistrations_1] ON [dbo].[ConferenceRegistrations]
(
	[UserID] ASC,
	[ConferenceID] ASC,
	[IsDeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ConferenceRegistrations_2]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceRegistrations_2] ON [dbo].[ConferenceRegistrations]
(
	[PaymentMethod] ASC,
	[ConferenceID] ASC,
	[IsCanceled] ASC,
	[IsDeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceRegistrations_3]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceRegistrations_3] ON [dbo].[ConferenceRegistrations]
(
	[IsCanceled] ASC,
	[ConferenceID] ASC,
	[IsDeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Conferences]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_Conferences] ON [dbo].[Conferences]
(
	[StartDate] ASC,
	[Status] ASC,
	[IsDeleted] ASC,
	[EndDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Conferences_1]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_Conferences_1] ON [dbo].[Conferences]
(
	[Status] ASC,
	[URL] ASC,
	[IsDeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceSpeakers]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceSpeakers] ON [dbo].[ConferenceSpeakers]
(
	[IsDeleted] ASC,
	[ConferenceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ConferenceSpeakers_1]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceSpeakers_1] ON [dbo].[ConferenceSpeakers]
(
	[IsDeleted] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ConferenceSpeakers_2]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceSpeakers_2] ON [dbo].[ConferenceSpeakers]
(
	[IsDeleted] ASC,
	[FacultyDisclosureOnFile] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceSpeakerTopics]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceSpeakerTopics] ON [dbo].[ConferenceSpeakerTopics]
(
	[ConferenceSpeakerID] ASC,
	[ConferenceID] ASC,
	[IsDeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceSpecailties]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceSpecailties] ON [dbo].[ConferenceSpecialties]
(
	[ConferenceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceSpecialties]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceSpecialties] ON [dbo].[ConferenceSpecialties]
(
	[SpecialtyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ContentManagementSystem]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_ContentManagementSystem] ON [dbo].[ContentManagementSystem]
(
	[URL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CreditNotifications]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_CreditNotifications] ON [dbo].[CreditNotifications]
(
	[EventID] ASC,
	[EventType] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DegreeMapping]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_DegreeMapping] ON [dbo].[DegreeMapping]
(
	[OldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Degrees]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_Degrees] ON [dbo].[Degrees]
(
	[Degree] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Degrees_1]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_Degrees_1] ON [dbo].[Degrees]
(
	[CountsAsPhysician] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DuplicateUserRunIgnoreRecords]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_DuplicateUserRunIgnoreRecords] ON [dbo].[DuplicateUserRunIgnoreRecords]
(
	[UserID] ASC,
	[DuplicateUserID] ASC,
	[IsDeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DuplicateUserRunRecords]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_DuplicateUserRunRecords] ON [dbo].[DuplicateUserRunRecords]
(
	[DuplicateUserID] ASC,
	[UserID] ASC,
	[DuplicateUserRunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_EmailPreferences]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_EmailPreferences] ON [dbo].[EmailPreferences]
(
	[UserID] ASC,
	[EmailType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmailQueueMessages]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_EmailQueueMessages] ON [dbo].[EmailQueueMessages]
(
	[EmailQueueID] ASC,
	[IsSent] ASC,
	[IsDeleted] ASC,
	[SendDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EnduringMaterialCreditImports]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_EnduringMaterialCreditImports] ON [dbo].[EnduringMaterialCreditImports]
(
	[EnduringMaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EnduringMaterialNotes]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_EnduringMaterialNotes] ON [dbo].[EnduringMaterialNotes]
(
	[EnduringMaterialID] ASC,
	[IsDeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EnduringMaterialRegistrations]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_EnduringMaterialRegistrations] ON [dbo].[EnduringMaterialRegistrations]
(
	[EnduringMaterialID] ASC,
	[IsDeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_EnduringMaterialRegistrations_1]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_EnduringMaterialRegistrations_1] ON [dbo].[EnduringMaterialRegistrations]
(
	[EnduringMaterialID] ASC,
	[UserID] ASC,
	[IsDeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_EnduringMaterials]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_EnduringMaterials] ON [dbo].[EnduringMaterials]
(
	[StartDate] ASC,
	[Status] ASC,
	[IsDeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_EnduringMaterials_1]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_EnduringMaterials_1] ON [dbo].[EnduringMaterials]
(
	[IsDeleted] ASC,
	[URL] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_EnduringMaterialSeries]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_EnduringMaterialSeries] ON [dbo].[EnduringMaterialSeries]
(
	[Name] ASC,
	[IsDeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_EnduringMaterialSeries_1]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_EnduringMaterialSeries_1] ON [dbo].[EnduringMaterialSeries]
(
	[URL] ASC,
	[IsDeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EnduringMaterialSpeakers]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_EnduringMaterialSpeakers] ON [dbo].[EnduringMaterialSpeakers]
(
	[IsDeleted] ASC,
	[EnduringMaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EnduringMaterialSpeakers_1]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_EnduringMaterialSpeakers_1] ON [dbo].[EnduringMaterialSpeakers]
(
	[IsDeleted] ASC,
	[FacultyDisclosureOnFile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_EventSupport]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_EventSupport] ON [dbo].[EventSupport]
(
	[EventType] ASC,
	[EventID] ASC,
	[IsDeleted] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_EventSupport_1]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_EventSupport_1] ON [dbo].[EventSupport]
(
	[EventType] ASC,
	[EventID] ASC,
	[IsDeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FacultyDisclosureCommercialInterests]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_FacultyDisclosureCommercialInterests] ON [dbo].[FacultyDisclosureCommercialInterests]
(
	[FacultyDisclosureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FacultyDisclosureRoles]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_FacultyDisclosureRoles] ON [dbo].[FacultyDisclosureRoles]
(
	[FacultyDisclosureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_FacultyDisclosures]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_FacultyDisclosures] ON [dbo].[FacultyDisclosures]
(
	[ID] ASC,
	[IsDeleted] ASC,
	[EventType] ASC,
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_FacultyDisclosures_1]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_FacultyDisclosures_1] ON [dbo].[FacultyDisclosures]
(
	[EventType] ASC,
	[EventID] ASC,
	[IsDeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [nci_wi_HospitalUsers_018DB7FA3F8EF17C8A9C93B61B0F2113]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [nci_wi_HospitalUsers_018DB7FA3F8EF17C8A9C93B61B0F2113] ON [dbo].[HospitalUsers]
(
	[HospitalID] ASC,
	[IsDeleted] ASC,
	[IsApproved] ASC
)
INCLUDE([CreatedOn],[RequestTimeStamp],[UserID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [nci_wi_HospitalUsers_51002E9203A7C665397B46141F2976A6]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [nci_wi_HospitalUsers_51002E9203A7C665397B46141F2976A6] ON [dbo].[HospitalUsers]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProfessionMapping]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_ProfessionMapping] ON [dbo].[ProfessionMapping]
(
	[OldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RSSeries]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_RSSeries] ON [dbo].[RSSeries]
(
	[StartDate] ASC,
	[Status] ASC,
	[IsDeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RSSeries_1]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_RSSeries_1] ON [dbo].[RSSeries]
(
	[IsDeleted] ASC,
	[URL] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RSSeries_2]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_RSSeries_2] ON [dbo].[RSSeries]
(
	[StartDate] ASC,
	[IsDeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RSSeries_3]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_RSSeries_3] ON [dbo].[RSSeries]
(
	[SeriesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RSSeriesCreditImports]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_RSSeriesCreditImports] ON [dbo].[RSSeriesCreditImports]
(
	[RSSeriesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RSSeriesNotes]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_RSSeriesNotes] ON [dbo].[RSSeriesNotes]
(
	[RSSeriesID] ASC,
	[IsDeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RSSeriesRegistrations]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_RSSeriesRegistrations] ON [dbo].[RSSeriesRegistrations]
(
	[RSSeriesID] ASC,
	[IsDeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RSSeriesRegistrations_1]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_RSSeriesRegistrations_1] ON [dbo].[RSSeriesRegistrations]
(
	[RSSeriesID] ASC,
	[UserID] ASC,
	[IsDeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RSSeriesRegistrations_2]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_RSSeriesRegistrations_2] ON [dbo].[RSSeriesRegistrations]
(
	[UserID] ASC,
	[IsDeleted] ASC,
	[CreditHours] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RSSeriesSeries]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_RSSeriesSeries] ON [dbo].[RSSeriesSeries]
(
	[Name] ASC,
	[IsDeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RSSeriesSeries_1]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_RSSeriesSeries_1] ON [dbo].[RSSeriesSeries]
(
	[URL] ASC,
	[IsDeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RSSeriesSeriesAdmins]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_RSSeriesSeriesAdmins] ON [dbo].[RSSeriesSeriesAdmins]
(
	[UserID] ASC,
	[IsDeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RSSeriesSeriesAdmins_1]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_RSSeriesSeriesAdmins_1] ON [dbo].[RSSeriesSeriesAdmins]
(
	[SeriesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RSSeriesSpeakers]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_RSSeriesSpeakers] ON [dbo].[RSSeriesSpeakers]
(
	[IsDeleted] ASC,
	[RSSeriesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RSSeriesSpeakers_1]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_RSSeriesSpeakers_1] ON [dbo].[RSSeriesSpeakers]
(
	[IsDeleted] ASC,
	[FacultyDisclosureOnFile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SingleSignOnTokens]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_SingleSignOnTokens] ON [dbo].[SingleSignOnTokens]
(
	[Token] ASC,
	[IsDeleted] ASC,
	[IsUsed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Specialties]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_Specialties] ON [dbo].[Specialties]
(
	[Specialty] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubSpecialties]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_SubSpecialties] ON [dbo].[SubSpecialties]
(
	[ParentSpecialtyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SubSpecialties_1]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_SubSpecialties_1] ON [dbo].[SubSpecialties]
(
	[SubSpecialty] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserNotes]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserNotes] ON [dbo].[UserNotes]
(
	[UserID] ASC,
	[IsDeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserProfiles]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserProfiles] ON [dbo].[UserProfiles]
(
	[IsDeleted] ASC,
	[UserID] ASC
)
WHERE ([IsDeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserProfiles_1]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserProfiles_1] ON [dbo].[UserProfiles]
(
	[IsDeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserProfiles_2]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserProfiles_2] ON [dbo].[UserProfiles]
(
	[UserID] ASC,
	[IsDeleted] ASC,
	[OSUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserProfiles_4]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserProfiles_4] ON [dbo].[UserProfiles]
(
	[UserID] ASC,
	[NationalProviderIdentifier] ASC,
	[IsDeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserProfiles_5]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserProfiles_5] ON [dbo].[UserProfiles]
(
	[UserID] ASC,
	[FirstName] ASC,
	[LastName] ASC,
	[IsDeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [nci_wi_UserProfiles_027ADD8620E4F04B306634F9ED3B950A]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [nci_wi_UserProfiles_027ADD8620E4F04B306634F9ED3B950A] ON [dbo].[UserProfiles]
(
	[IsDeleted] ASC,
	[LastName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_HangFire_CounterAggregated_Key]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_HangFire_CounterAggregated_Key] ON [HangFire].[AggregatedCounter]
(
	[Key] ASC
)
INCLUDE([Value]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Counter_Key]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Counter_Key] ON [HangFire].[Counter]
(
	[Key] ASC
)
INCLUDE([Value]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Hash_ExpireAt]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Hash_ExpireAt] ON [HangFire].[Hash]
(
	[ExpireAt] ASC
)
INCLUDE([Id]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Hash_Key]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Hash_Key] ON [HangFire].[Hash]
(
	[Key] ASC
)
INCLUDE([ExpireAt]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_HangFire_Hash_Key_Field]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_HangFire_Hash_Key_Field] ON [HangFire].[Hash]
(
	[Key] ASC,
	[Field] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Job_ExpireAt]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_ExpireAt] ON [HangFire].[Job]
(
	[ExpireAt] ASC
)
INCLUDE([Id]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Job_StateName]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_StateName] ON [HangFire].[Job]
(
	[StateName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_JobParameter_JobIdAndName]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_JobParameter_JobIdAndName] ON [HangFire].[JobParameter]
(
	[JobId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_JobQueue_QueueAndFetchedAt]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_JobQueue_QueueAndFetchedAt] ON [HangFire].[JobQueue]
(
	[Queue] ASC,
	[FetchedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_List_ExpireAt]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_List_ExpireAt] ON [HangFire].[List]
(
	[ExpireAt] ASC
)
INCLUDE([Id]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_List_Key]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_List_Key] ON [HangFire].[List]
(
	[Key] ASC
)
INCLUDE([ExpireAt],[Value]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Set_ExpireAt]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_ExpireAt] ON [HangFire].[Set]
(
	[ExpireAt] ASC
)
INCLUDE([Id]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Set_Key]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_Key] ON [HangFire].[Set]
(
	[Key] ASC
)
INCLUDE([ExpireAt],[Value]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_HangFire_Set_KeyAndValue]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_HangFire_Set_KeyAndValue] ON [HangFire].[Set]
(
	[Key] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_State_JobId]    Script Date: 9/24/2022 9:56:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_State_JobId] ON [HangFire].[State]
(
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dboAspNetUserRoles_dboAspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dboAspNetUserRoles_dboAspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dboAspNetUserRoles_dboAspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dboAspNetUserRoles_dboAspNetUsers_UserId]
GO
ALTER TABLE [dbo].[ConferenceCreditImportErrors]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceCreditImportErrors_ConferenceCreditImports] FOREIGN KEY([CreditImportID])
REFERENCES [dbo].[ConferenceCreditImports] ([ID])
GO
ALTER TABLE [dbo].[ConferenceCreditImportErrors] CHECK CONSTRAINT [FK_ConferenceCreditImportErrors_ConferenceCreditImports]
GO
ALTER TABLE [dbo].[ConferenceCreditImportRecords]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceCreditImportRecords_ConferenceCreditImports] FOREIGN KEY([CreditImportID])
REFERENCES [dbo].[ConferenceCreditImports] ([ID])
GO
ALTER TABLE [dbo].[ConferenceCreditImportRecords] CHECK CONSTRAINT [FK_ConferenceCreditImportRecords_ConferenceCreditImports]
GO
ALTER TABLE [dbo].[ConferenceCreditImports]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceCreditImports_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[ConferenceCreditImports] CHECK CONSTRAINT [FK_ConferenceCreditImports_UserProfiles]
GO
ALTER TABLE [dbo].[ConferenceEvaluationCompetencies]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceEvaluationCompetencies_ConferenceEvaluations] FOREIGN KEY([ConferenceEvaluationID])
REFERENCES [dbo].[ConferenceEvaluations] ([ID])
GO
ALTER TABLE [dbo].[ConferenceEvaluationCompetencies] CHECK CONSTRAINT [FK_ConferenceEvaluationCompetencies_ConferenceEvaluations]
GO
ALTER TABLE [dbo].[ConferenceEvaluationPanels]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceEvaluatonPanels_ConferenceEvaluations] FOREIGN KEY([ConferenceEvaluationID])
REFERENCES [dbo].[ConferenceEvaluations] ([ID])
GO
ALTER TABLE [dbo].[ConferenceEvaluationPanels] CHECK CONSTRAINT [FK_ConferenceEvaluatonPanels_ConferenceEvaluations]
GO
ALTER TABLE [dbo].[ConferenceEvaluationPanels]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceEvaluatonPanels_ConferencePanels] FOREIGN KEY([ConferencePanelID])
REFERENCES [dbo].[ConferencePanels] ([ID])
GO
ALTER TABLE [dbo].[ConferenceEvaluationPanels] CHECK CONSTRAINT [FK_ConferenceEvaluatonPanels_ConferencePanels]
GO
ALTER TABLE [dbo].[ConferenceEvaluationProgramResults]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceEvaluationProgramResults_ConferenceEvaluations] FOREIGN KEY([ConferenceEvaluationID])
REFERENCES [dbo].[ConferenceEvaluations] ([ID])
GO
ALTER TABLE [dbo].[ConferenceEvaluationProgramResults] CHECK CONSTRAINT [FK_ConferenceEvaluationProgramResults_ConferenceEvaluations]
GO
ALTER TABLE [dbo].[ConferenceEvaluations]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceEvaluations_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[ConferenceEvaluations] CHECK CONSTRAINT [FK_ConferenceEvaluations_UserProfiles]
GO
ALTER TABLE [dbo].[ConferenceEvaluationSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceEvaluatonSpeakers_ConferenceEvaluations] FOREIGN KEY([ConferenceEvaluationID])
REFERENCES [dbo].[ConferenceEvaluations] ([ID])
GO
ALTER TABLE [dbo].[ConferenceEvaluationSpeakers] CHECK CONSTRAINT [FK_ConferenceEvaluatonSpeakers_ConferenceEvaluations]
GO
ALTER TABLE [dbo].[ConferenceEvaluationSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceEvaluatonSpeakers_ConferenceSpeakers] FOREIGN KEY([ConferenceSpeakerID])
REFERENCES [dbo].[ConferenceSpeakers] ([ID])
GO
ALTER TABLE [dbo].[ConferenceEvaluationSpeakers] CHECK CONSTRAINT [FK_ConferenceEvaluatonSpeakers_ConferenceSpeakers]
GO
ALTER TABLE [dbo].[ConferenceNotes]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceNotes_UserProfiles] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[ConferenceNotes] CHECK CONSTRAINT [FK_ConferenceNotes_UserProfiles]
GO
ALTER TABLE [dbo].[ConferenceNotes]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceNotes_UserProfiles1] FOREIGN KEY([LastUpdatedBy])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[ConferenceNotes] CHECK CONSTRAINT [FK_ConferenceNotes_UserProfiles1]
GO
ALTER TABLE [dbo].[ConferenceOptions]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceOptions_ConferenceOptionsGroups] FOREIGN KEY([GroupID])
REFERENCES [dbo].[ConferenceOptionsGroups] ([ID])
GO
ALTER TABLE [dbo].[ConferenceOptions] CHECK CONSTRAINT [FK_ConferenceOptions_ConferenceOptionsGroups]
GO
ALTER TABLE [dbo].[ConferencePanelSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_ConferencePanelSpeakers_ConferencePanels] FOREIGN KEY([ConferencePanelID])
REFERENCES [dbo].[ConferencePanels] ([ID])
GO
ALTER TABLE [dbo].[ConferencePanelSpeakers] CHECK CONSTRAINT [FK_ConferencePanelSpeakers_ConferencePanels]
GO
ALTER TABLE [dbo].[ConferencePanelSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_ConferencePanelSpeakers_ConferenceSpeakers] FOREIGN KEY([ConferenceSpeakerID])
REFERENCES [dbo].[ConferenceSpeakers] ([ID])
GO
ALTER TABLE [dbo].[ConferencePanelSpeakers] CHECK CONSTRAINT [FK_ConferencePanelSpeakers_ConferenceSpeakers]
GO
ALTER TABLE [dbo].[ConferenceRegistrationItems]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceRegistrationItems_ConferenceOptions] FOREIGN KEY([OptionID])
REFERENCES [dbo].[ConferenceOptions] ([ID])
GO
ALTER TABLE [dbo].[ConferenceRegistrationItems] CHECK CONSTRAINT [FK_ConferenceRegistrationItems_ConferenceOptions]
GO
ALTER TABLE [dbo].[ConferenceRegistrationItems]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceRegistrationItems_ConferencePrices] FOREIGN KEY([PriceID])
REFERENCES [dbo].[ConferencePrices] ([ID])
GO
ALTER TABLE [dbo].[ConferenceRegistrationItems] CHECK CONSTRAINT [FK_ConferenceRegistrationItems_ConferencePrices]
GO
ALTER TABLE [dbo].[ConferenceRegistrationItems]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceRegistrationItems_ConferenceRegistrations] FOREIGN KEY([ConferenceRegistrationID])
REFERENCES [dbo].[ConferenceRegistrations] ([ID])
GO
ALTER TABLE [dbo].[ConferenceRegistrationItems] CHECK CONSTRAINT [FK_ConferenceRegistrationItems_ConferenceRegistrations]
GO
ALTER TABLE [dbo].[ConferenceRegistrations]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceRegistrations_PaymentMethods] FOREIGN KEY([PaymentMethod])
REFERENCES [dbo].[PaymentMethods] ([Method])
GO
ALTER TABLE [dbo].[ConferenceRegistrations] CHECK CONSTRAINT [FK_ConferenceRegistrations_PaymentMethods]
GO
ALTER TABLE [dbo].[ConferenceRegistrations]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceRegistrations_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[ConferenceRegistrations] CHECK CONSTRAINT [FK_ConferenceRegistrations_UserProfiles]
GO
ALTER TABLE [dbo].[Conferences]  WITH NOCHECK ADD  CONSTRAINT [FK_Conferences_EventProvidership] FOREIGN KEY([Providership])
REFERENCES [dbo].[EventProvidership] ([Type])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Conferences] CHECK CONSTRAINT [FK_Conferences_EventProvidership]
GO
ALTER TABLE [dbo].[Conferences]  WITH NOCHECK ADD  CONSTRAINT [FK_Conferences_EventStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[EventStatus] ([Status])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Conferences] CHECK CONSTRAINT [FK_Conferences_EventStatus]
GO
ALTER TABLE [dbo].[ConferenceSpeakerChecklistAVNeeds]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceSpeakerChecklistAVNeeds_ConferenceSpeakerChecklists] FOREIGN KEY([ConferenceSpeakerChecklistID])
REFERENCES [dbo].[ConferenceSpeakerChecklists] ([ID])
GO
ALTER TABLE [dbo].[ConferenceSpeakerChecklistAVNeeds] CHECK CONSTRAINT [FK_ConferenceSpeakerChecklistAVNeeds_ConferenceSpeakerChecklists]
GO
ALTER TABLE [dbo].[ConferenceSpeakerChecklistCVs]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceSpeakerChecklistCVs_ConferenceSpeakerChecklist] FOREIGN KEY([ConferenceSpeakerChecklistID])
REFERENCES [dbo].[ConferenceSpeakerChecklists] ([ID])
GO
ALTER TABLE [dbo].[ConferenceSpeakerChecklistCVs] CHECK CONSTRAINT [FK_ConferenceSpeakerChecklistCVs_ConferenceSpeakerChecklist]
GO
ALTER TABLE [dbo].[ConferenceSpeakerChecklistPresentationFiles]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceSpeakerChecklistPresentationFiles_ConferenceSpeakerChecklist] FOREIGN KEY([ConferenceSpeakerChecklistID])
REFERENCES [dbo].[ConferenceSpeakerChecklists] ([ID])
GO
ALTER TABLE [dbo].[ConferenceSpeakerChecklistPresentationFiles] CHECK CONSTRAINT [FK_ConferenceSpeakerChecklistPresentationFiles_ConferenceSpeakerChecklist]
GO
ALTER TABLE [dbo].[ConferenceSpeakerChecklists]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceSpeakerChecklist_ConferenceSpeakers] FOREIGN KEY([ConferenceSpeakerID])
REFERENCES [dbo].[ConferenceSpeakers] ([ID])
GO
ALTER TABLE [dbo].[ConferenceSpeakerChecklists] CHECK CONSTRAINT [FK_ConferenceSpeakerChecklist_ConferenceSpeakers]
GO
ALTER TABLE [dbo].[ConferenceSpeakers]  WITH NOCHECK ADD  CONSTRAINT [FK_ConferenceSpeakers_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[ConferenceSpeakers] NOCHECK CONSTRAINT [FK_ConferenceSpeakers_UserProfiles]
GO
ALTER TABLE [dbo].[ConferenceSpeakerTopics]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceSpeakerTopics_ConferenceSpeakers] FOREIGN KEY([ConferenceSpeakerID])
REFERENCES [dbo].[ConferenceSpeakers] ([ID])
GO
ALTER TABLE [dbo].[ConferenceSpeakerTopics] CHECK CONSTRAINT [FK_ConferenceSpeakerTopics_ConferenceSpeakers]
GO
ALTER TABLE [dbo].[ConferenceSpecialties]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceSpecailties_Specialties] FOREIGN KEY([SpecialtyID])
REFERENCES [dbo].[Specialties] ([ID])
GO
ALTER TABLE [dbo].[ConferenceSpecialties] CHECK CONSTRAINT [FK_ConferenceSpecailties_Specialties]
GO
ALTER TABLE [dbo].[ConferenceStreamViews]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceStreamViews_Conferences] FOREIGN KEY([ConferenceID])
REFERENCES [dbo].[Conferences] ([ID])
GO
ALTER TABLE [dbo].[ConferenceStreamViews] CHECK CONSTRAINT [FK_ConferenceStreamViews_Conferences]
GO
ALTER TABLE [dbo].[ConferenceStreamViews]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceStreamViews_ConferenceStreams] FOREIGN KEY([ConferenceStreamID])
REFERENCES [dbo].[ConferenceStreams] ([ID])
GO
ALTER TABLE [dbo].[ConferenceStreamViews] CHECK CONSTRAINT [FK_ConferenceStreamViews_ConferenceStreams]
GO
ALTER TABLE [dbo].[ConferenceStreamViews]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceStreamViews_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[ConferenceStreamViews] CHECK CONSTRAINT [FK_ConferenceStreamViews_UserProfiles]
GO
ALTER TABLE [dbo].[ConferenceWaitlist]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceWaitlist_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[ConferenceWaitlist] CHECK CONSTRAINT [FK_ConferenceWaitlist_UserProfiles]
GO
ALTER TABLE [dbo].[CreditNotifications]  WITH CHECK ADD  CONSTRAINT [FK_CreditNotifications_EventTypes] FOREIGN KEY([EventType])
REFERENCES [dbo].[EventTypes] ([EventType])
GO
ALTER TABLE [dbo].[CreditNotifications] CHECK CONSTRAINT [FK_CreditNotifications_EventTypes]
GO
ALTER TABLE [dbo].[DuplicateUserRunIgnoreRecords]  WITH CHECK ADD  CONSTRAINT [FK_DuplicateUserRunIgnoreRecords_UserProfiles] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[DuplicateUserRunIgnoreRecords] CHECK CONSTRAINT [FK_DuplicateUserRunIgnoreRecords_UserProfiles]
GO
ALTER TABLE [dbo].[DuplicateUserRunRecords]  WITH CHECK ADD  CONSTRAINT [FK_DuplicateUserRunRecords_DuplicateUserRuns] FOREIGN KEY([DuplicateUserRunID])
REFERENCES [dbo].[DuplicateUserRuns] ([ID])
GO
ALTER TABLE [dbo].[DuplicateUserRunRecords] CHECK CONSTRAINT [FK_DuplicateUserRunRecords_DuplicateUserRuns]
GO
ALTER TABLE [dbo].[DuplicateUserRunRecords]  WITH CHECK ADD  CONSTRAINT [FK_DuplicateUserRunRecords_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[DuplicateUserRunRecords] CHECK CONSTRAINT [FK_DuplicateUserRunRecords_UserProfiles]
GO
ALTER TABLE [dbo].[DuplicateUserRunRecords]  WITH CHECK ADD  CONSTRAINT [FK_DuplicateUserRunRecords_UserProfiles1] FOREIGN KEY([DuplicateUserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[DuplicateUserRunRecords] CHECK CONSTRAINT [FK_DuplicateUserRunRecords_UserProfiles1]
GO
ALTER TABLE [dbo].[DuplicateUserRuns]  WITH CHECK ADD  CONSTRAINT [FK_DuplicateUserRuns_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[DuplicateUserRuns] CHECK CONSTRAINT [FK_DuplicateUserRuns_UserProfiles]
GO
ALTER TABLE [dbo].[EmailHistory]  WITH CHECK ADD  CONSTRAINT [FK_EmailHistory_EmailTypes] FOREIGN KEY([EmailType])
REFERENCES [dbo].[EmailTypes] ([Type])
GO
ALTER TABLE [dbo].[EmailHistory] CHECK CONSTRAINT [FK_EmailHistory_EmailTypes]
GO
ALTER TABLE [dbo].[EmailPreferences]  WITH CHECK ADD  CONSTRAINT [FK_EmailPreferences_EmailFrequencies] FOREIGN KEY([EmailFrequency])
REFERENCES [dbo].[EmailFrequencies] ([Frequency])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[EmailPreferences] CHECK CONSTRAINT [FK_EmailPreferences_EmailFrequencies]
GO
ALTER TABLE [dbo].[EmailPreferences]  WITH CHECK ADD  CONSTRAINT [FK_EmailPreferences_EmailTypes] FOREIGN KEY([EmailType])
REFERENCES [dbo].[EmailTypes] ([Type])
GO
ALTER TABLE [dbo].[EmailPreferences] CHECK CONSTRAINT [FK_EmailPreferences_EmailTypes]
GO
ALTER TABLE [dbo].[EmailQueueMessages]  WITH CHECK ADD  CONSTRAINT [FK_EmailQueueMessages_EmailQueues] FOREIGN KEY([EmailQueueID])
REFERENCES [dbo].[EmailQueues] ([ID])
GO
ALTER TABLE [dbo].[EmailQueueMessages] CHECK CONSTRAINT [FK_EmailQueueMessages_EmailQueues]
GO
ALTER TABLE [dbo].[EmailQueueMessages]  WITH CHECK ADD  CONSTRAINT [FK_EmailQueueMessages_UserProfiles] FOREIGN KEY([SendToUserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[EmailQueueMessages] CHECK CONSTRAINT [FK_EmailQueueMessages_UserProfiles]
GO
ALTER TABLE [dbo].[EnduringMaterialBoards]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialBoards_Boards] FOREIGN KEY([BoardID])
REFERENCES [dbo].[Boards] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialBoards] CHECK CONSTRAINT [FK_EnduringMaterialBoards_Boards]
GO
ALTER TABLE [dbo].[EnduringMaterialCreditImportErrors]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialCreditImportErrors_EnduringMaterialCreditImports] FOREIGN KEY([CreditImportID])
REFERENCES [dbo].[EnduringMaterialCreditImports] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialCreditImportErrors] CHECK CONSTRAINT [FK_EnduringMaterialCreditImportErrors_EnduringMaterialCreditImports]
GO
ALTER TABLE [dbo].[EnduringMaterialCreditImportRecords]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialCreditImportRecords_EnduringMaterialCreditImports] FOREIGN KEY([CreditImportID])
REFERENCES [dbo].[EnduringMaterialCreditImports] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialCreditImportRecords] CHECK CONSTRAINT [FK_EnduringMaterialCreditImportRecords_EnduringMaterialCreditImports]
GO
ALTER TABLE [dbo].[EnduringMaterialCreditImports]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialCreditImports_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialCreditImports] CHECK CONSTRAINT [FK_EnduringMaterialCreditImports_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialCreditImports]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialCreditImports_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[EnduringMaterialCreditImports] CHECK CONSTRAINT [FK_EnduringMaterialCreditImports_UserProfiles]
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluationCompetencies]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialEvaluationCompetencies_EnduringMaterialEvaluations] FOREIGN KEY([EnduringMaterialEvaluationID])
REFERENCES [dbo].[EnduringMaterialEvaluations] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluationCompetencies] CHECK CONSTRAINT [FK_EnduringMaterialEvaluationCompetencies_EnduringMaterialEvaluations]
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluationPanels]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialEvaluatonPanels_EnduringMaterialEvaluations] FOREIGN KEY([EnduringMaterialEvaluationID])
REFERENCES [dbo].[EnduringMaterialEvaluations] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluationPanels] CHECK CONSTRAINT [FK_EnduringMaterialEvaluatonPanels_EnduringMaterialEvaluations]
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluationPanels]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialEvaluatonPanels_EnduringMaterialPanels] FOREIGN KEY([EnduringMaterialPanelID])
REFERENCES [dbo].[EnduringMaterialPanels] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluationPanels] CHECK CONSTRAINT [FK_EnduringMaterialEvaluatonPanels_EnduringMaterialPanels]
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluationProgramResults]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialEvaluationProgramResults_EnduringMaterialEvaluations] FOREIGN KEY([EnduringMaterialEvaluationID])
REFERENCES [dbo].[EnduringMaterialEvaluations] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluationProgramResults] CHECK CONSTRAINT [FK_EnduringMaterialEvaluationProgramResults_EnduringMaterialEvaluations]
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluations]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialEvaluations_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluations] CHECK CONSTRAINT [FK_EnduringMaterialEvaluations_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluations]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialEvaluations_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluations] CHECK CONSTRAINT [FK_EnduringMaterialEvaluations_UserProfiles]
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluationSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialEvaluatonSpeakers_EnduringMaterialEvaluations] FOREIGN KEY([EnduringMaterialEvaluationID])
REFERENCES [dbo].[EnduringMaterialEvaluations] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluationSpeakers] CHECK CONSTRAINT [FK_EnduringMaterialEvaluatonSpeakers_EnduringMaterialEvaluations]
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluationSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialEvaluatonSpeakers_EnduringMaterialSpeakers] FOREIGN KEY([EnduringMaterialSpeakerID])
REFERENCES [dbo].[EnduringMaterialSpeakers] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialEvaluationSpeakers] CHECK CONSTRAINT [FK_EnduringMaterialEvaluatonSpeakers_EnduringMaterialSpeakers]
GO
ALTER TABLE [dbo].[EnduringMaterialFiles]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialFiles_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialFiles] CHECK CONSTRAINT [FK_EnduringMaterialFiles_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialJointProviders]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialJointProviders_EnduringMaterialJointProviders] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialJointProviders] CHECK CONSTRAINT [FK_EnduringMaterialJointProviders_EnduringMaterialJointProviders]
GO
ALTER TABLE [dbo].[EnduringMaterialNotes]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialNotes_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialNotes] CHECK CONSTRAINT [FK_EnduringMaterialNotes_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialNotes]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialNotes_UserProfiles] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[EnduringMaterialNotes] CHECK CONSTRAINT [FK_EnduringMaterialNotes_UserProfiles]
GO
ALTER TABLE [dbo].[EnduringMaterialNotes]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialNotes_UserProfiles1] FOREIGN KEY([LastUpdatedBy])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[EnduringMaterialNotes] CHECK CONSTRAINT [FK_EnduringMaterialNotes_UserProfiles1]
GO
ALTER TABLE [dbo].[EnduringMaterialOptions]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialOptions_EnduringMaterialOptionsGroups] FOREIGN KEY([GroupID])
REFERENCES [dbo].[EnduringMaterialOptionsGroups] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialOptions] CHECK CONSTRAINT [FK_EnduringMaterialOptions_EnduringMaterialOptionsGroups]
GO
ALTER TABLE [dbo].[EnduringMaterialOptionsGroups]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialOptionsGroups_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialOptionsGroups] CHECK CONSTRAINT [FK_EnduringMaterialOptionsGroups_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialPanels]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialPanels_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialPanels] CHECK CONSTRAINT [FK_EnduringMaterialPanels_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialPanelSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialPanelSpeakers_EnduringMaterialSpeakers] FOREIGN KEY([EnduringMaterialSpeakerID])
REFERENCES [dbo].[EnduringMaterialSpeakers] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialPanelSpeakers] CHECK CONSTRAINT [FK_EnduringMaterialPanelSpeakers_EnduringMaterialSpeakers]
GO
ALTER TABLE [dbo].[EnduringMaterialPanelSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialPanelSpeakers_WebcastPanels] FOREIGN KEY([EnduringMaterialPanelID])
REFERENCES [dbo].[EnduringMaterialPanels] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialPanelSpeakers] CHECK CONSTRAINT [FK_EnduringMaterialPanelSpeakers_WebcastPanels]
GO
ALTER TABLE [dbo].[EnduringMaterialRegistrationItems]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialRegistrationItems_EnduringMaterialOptions] FOREIGN KEY([OptionID])
REFERENCES [dbo].[EnduringMaterialOptions] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialRegistrationItems] CHECK CONSTRAINT [FK_EnduringMaterialRegistrationItems_EnduringMaterialOptions]
GO
ALTER TABLE [dbo].[EnduringMaterialRegistrationItems]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialRegistrationItems_EnduringMaterialPrices] FOREIGN KEY([PriceID])
REFERENCES [dbo].[EnduringMaterialPrices] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialRegistrationItems] CHECK CONSTRAINT [FK_EnduringMaterialRegistrationItems_EnduringMaterialPrices]
GO
ALTER TABLE [dbo].[EnduringMaterialRegistrationItems]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialRegistrationItems_EnduringMaterialRegistrations] FOREIGN KEY([EnduringMaterialRegistrationID])
REFERENCES [dbo].[EnduringMaterialRegistrations] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialRegistrationItems] CHECK CONSTRAINT [FK_EnduringMaterialRegistrationItems_EnduringMaterialRegistrations]
GO
ALTER TABLE [dbo].[EnduringMaterialRegistrations]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialRegistrations_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialRegistrations] CHECK CONSTRAINT [FK_EnduringMaterialRegistrations_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialRegistrations]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialRegistrations_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[EnduringMaterialRegistrations] CHECK CONSTRAINT [FK_EnduringMaterialRegistrations_UserProfiles]
GO
ALTER TABLE [dbo].[EnduringMaterials]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterials_EnduringMaterialSeries] FOREIGN KEY([EnduringMaterialSeriesID])
REFERENCES [dbo].[EnduringMaterialSeries] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterials] CHECK CONSTRAINT [FK_EnduringMaterials_EnduringMaterialSeries]
GO
ALTER TABLE [dbo].[EnduringMaterials]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterials_EventProvidership] FOREIGN KEY([Providership])
REFERENCES [dbo].[EventProvidership] ([Type])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[EnduringMaterials] CHECK CONSTRAINT [FK_EnduringMaterials_EventProvidership]
GO
ALTER TABLE [dbo].[EnduringMaterials]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterials_EventStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[EventStatus] ([Status])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[EnduringMaterials] CHECK CONSTRAINT [FK_EnduringMaterials_EventStatus]
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerChecklistCVs]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialSpeakerChecklistCVs_EnduringMaterialSpeakerChecklist] FOREIGN KEY([EnduringMaterialSpeakerChecklistID])
REFERENCES [dbo].[EnduringMaterialSpeakerChecklists] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerChecklistCVs] CHECK CONSTRAINT [FK_EnduringMaterialSpeakerChecklistCVs_EnduringMaterialSpeakerChecklist]
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerChecklistPresentationFiles]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialSpeakerChecklistPresentationFiles_EnduringMaterialSpeakerChecklist] FOREIGN KEY([EnduringMaterialSpeakerChecklistID])
REFERENCES [dbo].[EnduringMaterialSpeakerChecklists] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerChecklistPresentationFiles] CHECK CONSTRAINT [FK_EnduringMaterialSpeakerChecklistPresentationFiles_EnduringMaterialSpeakerChecklist]
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerChecklists]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialSpeakerChecklist_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerChecklists] CHECK CONSTRAINT [FK_EnduringMaterialSpeakerChecklist_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerChecklists]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialSpeakerChecklist_EnduringMaterialSpeakers] FOREIGN KEY([EnduringMaterialSpeakerID])
REFERENCES [dbo].[EnduringMaterialSpeakers] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerChecklists] CHECK CONSTRAINT [FK_EnduringMaterialSpeakerChecklist_EnduringMaterialSpeakers]
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerConsentForms]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialSpeakerConsentForms_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerConsentForms] CHECK CONSTRAINT [FK_EnduringMaterialSpeakerConsentForms_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerConsentForms]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialSpeakerConsentForms_EnduringMaterialSpeakerChecklists] FOREIGN KEY([EnduringMaterialSpeakerChecklistID])
REFERENCES [dbo].[EnduringMaterialSpeakerChecklists] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerConsentForms] CHECK CONSTRAINT [FK_EnduringMaterialSpeakerConsentForms_EnduringMaterialSpeakerChecklists]
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerConsentForms]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialSpeakerConsentForms_EnduringMaterialSpeakers] FOREIGN KEY([EnduringMaterialSpeakerID])
REFERENCES [dbo].[EnduringMaterialSpeakers] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerConsentForms] CHECK CONSTRAINT [FK_EnduringMaterialSpeakerConsentForms_EnduringMaterialSpeakers]
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialSpeakers_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakers] CHECK CONSTRAINT [FK_EnduringMaterialSpeakers_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialSpeakers_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakers] CHECK CONSTRAINT [FK_EnduringMaterialSpeakers_UserProfiles]
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerTopics]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialSpeakerTopics_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerTopics] CHECK CONSTRAINT [FK_EnduringMaterialSpeakerTopics_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerTopics]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialSpeakerTopics_EnduringMaterialSpeakers] FOREIGN KEY([EnduringMaterialSpeakerID])
REFERENCES [dbo].[EnduringMaterialSpeakers] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialSpeakerTopics] CHECK CONSTRAINT [FK_EnduringMaterialSpeakerTopics_EnduringMaterialSpeakers]
GO
ALTER TABLE [dbo].[EnduringMaterialSpecialties]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialSpecialties_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialSpecialties] CHECK CONSTRAINT [FK_EnduringMaterialSpecialties_EnduringMaterials]
GO
ALTER TABLE [dbo].[EnduringMaterialSpecialties]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialSpecialties_Specialties] FOREIGN KEY([SpecialtyID])
REFERENCES [dbo].[Specialties] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialSpecialties] CHECK CONSTRAINT [FK_EnduringMaterialSpecialties_Specialties]
GO
ALTER TABLE [dbo].[EnduringMaterialViews]  WITH CHECK ADD  CONSTRAINT [FK_EnduringMaterialViews_EnduringMaterials] FOREIGN KEY([EnduringMaterialID])
REFERENCES [dbo].[EnduringMaterials] ([ID])
GO
ALTER TABLE [dbo].[EnduringMaterialViews] CHECK CONSTRAINT [FK_EnduringMaterialViews_EnduringMaterials]
GO
ALTER TABLE [dbo].[EventAdvertisers]  WITH CHECK ADD  CONSTRAINT [FK_EventDisplays_EventTypes] FOREIGN KEY([EventType])
REFERENCES [dbo].[EventTypes] ([EventType])
GO
ALTER TABLE [dbo].[EventAdvertisers] CHECK CONSTRAINT [FK_EventDisplays_EventTypes]
GO
ALTER TABLE [dbo].[EventPromoCodeDegreeRestriction]  WITH CHECK ADD  CONSTRAINT [FK_EventPromoCodeDegreeRestriction_Degrees] FOREIGN KEY([DegreeID])
REFERENCES [dbo].[Degrees] ([ID])
GO
ALTER TABLE [dbo].[EventPromoCodeDegreeRestriction] CHECK CONSTRAINT [FK_EventPromoCodeDegreeRestriction_Degrees]
GO
ALTER TABLE [dbo].[EventPromoCodeDegreeRestriction]  WITH CHECK ADD  CONSTRAINT [FK_EventPromoCodeDegreeRestriction_EventPromoCode] FOREIGN KEY([EventPromoCodeID])
REFERENCES [dbo].[EventPromoCode] ([ID])
GO
ALTER TABLE [dbo].[EventPromoCodeDegreeRestriction] CHECK CONSTRAINT [FK_EventPromoCodeDegreeRestriction_EventPromoCode]
GO
ALTER TABLE [dbo].[EventPromoCodeEmailRestriction]  WITH CHECK ADD  CONSTRAINT [FK_EventPromoCodeEmailRestriction_EventPromoCode] FOREIGN KEY([EventPromoCodeID])
REFERENCES [dbo].[EventPromoCode] ([ID])
GO
ALTER TABLE [dbo].[EventPromoCodeEmailRestriction] CHECK CONSTRAINT [FK_EventPromoCodeEmailRestriction_EventPromoCode]
GO
ALTER TABLE [dbo].[EventPromoCodeProfessionRestriction]  WITH CHECK ADD  CONSTRAINT [FK_EventPromoCodeProfessionRestriction_EventPromoCode] FOREIGN KEY([EventPromoCodeID])
REFERENCES [dbo].[EventPromoCode] ([ID])
GO
ALTER TABLE [dbo].[EventPromoCodeProfessionRestriction] CHECK CONSTRAINT [FK_EventPromoCodeProfessionRestriction_EventPromoCode]
GO
ALTER TABLE [dbo].[EventPromoCodeProfessionRestriction]  WITH CHECK ADD  CONSTRAINT [FK_EventPromoCodeProfessionRestriction_Professions] FOREIGN KEY([ProfessionID])
REFERENCES [dbo].[Professions] ([ID])
GO
ALTER TABLE [dbo].[EventPromoCodeProfessionRestriction] CHECK CONSTRAINT [FK_EventPromoCodeProfessionRestriction_Professions]
GO
ALTER TABLE [dbo].[FacultyDisclosureCommercialInterests]  WITH CHECK ADD  CONSTRAINT [FK_FacultyDisclosureCommercialInterests_FacultyDisclosures] FOREIGN KEY([FacultyDisclosureID])
REFERENCES [dbo].[FacultyDisclosures] ([ID])
GO
ALTER TABLE [dbo].[FacultyDisclosureCommercialInterests] CHECK CONSTRAINT [FK_FacultyDisclosureCommercialInterests_FacultyDisclosures]
GO
ALTER TABLE [dbo].[FacultyDisclosureRoles]  WITH CHECK ADD  CONSTRAINT [FK_FacultyDisclosureRoles_FacultyDisclosures] FOREIGN KEY([FacultyDisclosureID])
REFERENCES [dbo].[FacultyDisclosures] ([ID])
GO
ALTER TABLE [dbo].[FacultyDisclosureRoles] CHECK CONSTRAINT [FK_FacultyDisclosureRoles_FacultyDisclosures]
GO
ALTER TABLE [dbo].[FacultyDisclosures]  WITH CHECK ADD  CONSTRAINT [FK_FacultyDisclosures_EventTypes] FOREIGN KEY([EventType])
REFERENCES [dbo].[EventTypes] ([EventType])
GO
ALTER TABLE [dbo].[FacultyDisclosures] CHECK CONSTRAINT [FK_FacultyDisclosures_EventTypes]
GO
ALTER TABLE [dbo].[FacultyDisclosures]  WITH CHECK ADD  CONSTRAINT [FK_FacultyDisclosures_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[FacultyDisclosures] CHECK CONSTRAINT [FK_FacultyDisclosures_UserProfiles]
GO
ALTER TABLE [dbo].[HospitalAdmins]  WITH CHECK ADD  CONSTRAINT [FK_HospitalAdmins_Hospitals] FOREIGN KEY([HospitalID])
REFERENCES [dbo].[Hospitals] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[HospitalAdmins] CHECK CONSTRAINT [FK_HospitalAdmins_Hospitals]
GO
ALTER TABLE [dbo].[HospitalAdmins]  WITH CHECK ADD  CONSTRAINT [FK_HospitalAdmins_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[HospitalAdmins] CHECK CONSTRAINT [FK_HospitalAdmins_UserProfiles]
GO
ALTER TABLE [dbo].[HospitalDocumentsHospitals]  WITH CHECK ADD  CONSTRAINT [FK_HospitalDocumentsHospitals_HospitalDocuments] FOREIGN KEY([HospitalID])
REFERENCES [dbo].[Hospitals] ([ID])
GO
ALTER TABLE [dbo].[HospitalDocumentsHospitals] CHECK CONSTRAINT [FK_HospitalDocumentsHospitals_HospitalDocuments]
GO
ALTER TABLE [dbo].[HospitalDocumentsHospitals]  WITH CHECK ADD  CONSTRAINT [FK_HospitalDocumentsHospitals_HospitalDocumentsHospitals] FOREIGN KEY([DocumentID])
REFERENCES [dbo].[HospitalDocuments] ([ID])
GO
ALTER TABLE [dbo].[HospitalDocumentsHospitals] CHECK CONSTRAINT [FK_HospitalDocumentsHospitals_HospitalDocumentsHospitals]
GO
ALTER TABLE [dbo].[HospitalGroupHospitals]  WITH CHECK ADD  CONSTRAINT [FK_HospitalGroupHospitals_HospitalGroupHospitals] FOREIGN KEY([HospitalID])
REFERENCES [dbo].[Hospitals] ([ID])
GO
ALTER TABLE [dbo].[HospitalGroupHospitals] CHECK CONSTRAINT [FK_HospitalGroupHospitals_HospitalGroupHospitals]
GO
ALTER TABLE [dbo].[HospitalGroupHospitals]  WITH CHECK ADD  CONSTRAINT [FK_HospitalGroupHospitals_Hospitals] FOREIGN KEY([GroupID])
REFERENCES [dbo].[HospitalGroups] ([ID])
GO
ALTER TABLE [dbo].[HospitalGroupHospitals] CHECK CONSTRAINT [FK_HospitalGroupHospitals_Hospitals]
GO
ALTER TABLE [dbo].[HospitalUsers]  WITH NOCHECK ADD  CONSTRAINT [FK_HospitalUsers_Hospitals] FOREIGN KEY([HospitalID])
REFERENCES [dbo].[Hospitals] ([ID])
GO
ALTER TABLE [dbo].[HospitalUsers] CHECK CONSTRAINT [FK_HospitalUsers_Hospitals]
GO
ALTER TABLE [dbo].[LoginLog]  WITH CHECK ADD  CONSTRAINT [FK_LoginLog_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[LoginLog] CHECK CONSTRAINT [FK_LoginLog_UserProfiles]
GO
ALTER TABLE [dbo].[RSSeries]  WITH CHECK ADD  CONSTRAINT [FK_RSSeries_EventProvidership] FOREIGN KEY([Providership])
REFERENCES [dbo].[EventProvidership] ([Type])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[RSSeries] CHECK CONSTRAINT [FK_RSSeries_EventProvidership]
GO
ALTER TABLE [dbo].[RSSeries]  WITH CHECK ADD  CONSTRAINT [FK_RSSeries_EventStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[EventStatus] ([Status])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[RSSeries] CHECK CONSTRAINT [FK_RSSeries_EventStatus]
GO
ALTER TABLE [dbo].[RSSeries]  WITH CHECK ADD  CONSTRAINT [FK_RSSeries_RSSeriesSeries] FOREIGN KEY([SeriesID])
REFERENCES [dbo].[RSSeriesSeries] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[RSSeries] CHECK CONSTRAINT [FK_RSSeries_RSSeriesSeries]
GO
ALTER TABLE [dbo].[RSSeriesCreditImportErrors]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesCreditImportErrors_RSSeriesCreditImports] FOREIGN KEY([CreditImportID])
REFERENCES [dbo].[RSSeriesCreditImports] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesCreditImportErrors] CHECK CONSTRAINT [FK_RSSeriesCreditImportErrors_RSSeriesCreditImports]
GO
ALTER TABLE [dbo].[RSSeriesCreditImportRecords]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesCreditImportRecords_RSSeriesCreditImports] FOREIGN KEY([CreditImportID])
REFERENCES [dbo].[RSSeriesCreditImports] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesCreditImportRecords] CHECK CONSTRAINT [FK_RSSeriesCreditImportRecords_RSSeriesCreditImports]
GO
ALTER TABLE [dbo].[RSSeriesCreditImports]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesCreditImports_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesCreditImports] CHECK CONSTRAINT [FK_RSSeriesCreditImports_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesCreditImports]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesCreditImports_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[RSSeriesCreditImports] CHECK CONSTRAINT [FK_RSSeriesCreditImports_UserProfiles]
GO
ALTER TABLE [dbo].[RSSeriesEvaluationCompetencies]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesEvaluationCompetencies_RSSeriesEvaluations] FOREIGN KEY([RSSeriesEvaluationID])
REFERENCES [dbo].[RSSeriesEvaluations] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesEvaluationCompetencies] CHECK CONSTRAINT [FK_RSSeriesEvaluationCompetencies_RSSeriesEvaluations]
GO
ALTER TABLE [dbo].[RSSeriesEvaluationPanels]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesEvaluatonPanels_RSSeriesEvaluations] FOREIGN KEY([RSSeriesEvaluationID])
REFERENCES [dbo].[RSSeriesEvaluations] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesEvaluationPanels] CHECK CONSTRAINT [FK_RSSeriesEvaluatonPanels_RSSeriesEvaluations]
GO
ALTER TABLE [dbo].[RSSeriesEvaluationPanels]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesEvaluatonPanels_RSSeriesPanels] FOREIGN KEY([RSSeriesPanelID])
REFERENCES [dbo].[RSSeriesPanels] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesEvaluationPanels] CHECK CONSTRAINT [FK_RSSeriesEvaluatonPanels_RSSeriesPanels]
GO
ALTER TABLE [dbo].[RSSeriesEvaluationProgramResults]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesEvaluationProgramResults_RSSeriesEvaluations] FOREIGN KEY([RSSeriesEvaluationID])
REFERENCES [dbo].[RSSeriesEvaluations] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesEvaluationProgramResults] CHECK CONSTRAINT [FK_RSSeriesEvaluationProgramResults_RSSeriesEvaluations]
GO
ALTER TABLE [dbo].[RSSeriesEvaluations]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesEvaluations_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesEvaluations] CHECK CONSTRAINT [FK_RSSeriesEvaluations_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesEvaluations]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesEvaluations_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[RSSeriesEvaluations] CHECK CONSTRAINT [FK_RSSeriesEvaluations_UserProfiles]
GO
ALTER TABLE [dbo].[RSSeriesEvaluationSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesEvaluatonSpeakers_RSSeriesEvaluations] FOREIGN KEY([RSSeriesEvaluationID])
REFERENCES [dbo].[RSSeriesEvaluations] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesEvaluationSpeakers] CHECK CONSTRAINT [FK_RSSeriesEvaluatonSpeakers_RSSeriesEvaluations]
GO
ALTER TABLE [dbo].[RSSeriesEvaluationSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesEvaluatonSpeakers_RSSeriesSpeakers] FOREIGN KEY([RSSeriesSpeakerID])
REFERENCES [dbo].[RSSeriesSpeakers] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesEvaluationSpeakers] CHECK CONSTRAINT [FK_RSSeriesEvaluatonSpeakers_RSSeriesSpeakers]
GO
ALTER TABLE [dbo].[RSSeriesFiles]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesFiles_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesFiles] CHECK CONSTRAINT [FK_RSSeriesFiles_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesJointProviders]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesJointProviders_RSSeriesJointProviders] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesJointProviders] CHECK CONSTRAINT [FK_RSSeriesJointProviders_RSSeriesJointProviders]
GO
ALTER TABLE [dbo].[RSSeriesNotes]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesNotes_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesNotes] CHECK CONSTRAINT [FK_RSSeriesNotes_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesNotes]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesNotes_UserProfiles] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[RSSeriesNotes] CHECK CONSTRAINT [FK_RSSeriesNotes_UserProfiles]
GO
ALTER TABLE [dbo].[RSSeriesNotes]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesNotes_UserProfiles1] FOREIGN KEY([LastUpdatedBy])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[RSSeriesNotes] CHECK CONSTRAINT [FK_RSSeriesNotes_UserProfiles1]
GO
ALTER TABLE [dbo].[RSSeriesPanels]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesPanels_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesPanels] CHECK CONSTRAINT [FK_RSSeriesPanels_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesPanelSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesPanelSpeakers_RSSeriesPanels] FOREIGN KEY([RSSeriesPanelID])
REFERENCES [dbo].[RSSeriesPanels] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesPanelSpeakers] CHECK CONSTRAINT [FK_RSSeriesPanelSpeakers_RSSeriesPanels]
GO
ALTER TABLE [dbo].[RSSeriesPanelSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesPanelSpeakers_RSSeriesSpeakers] FOREIGN KEY([RSSeriesSpeakerID])
REFERENCES [dbo].[RSSeriesSpeakers] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesPanelSpeakers] CHECK CONSTRAINT [FK_RSSeriesPanelSpeakers_RSSeriesSpeakers]
GO
ALTER TABLE [dbo].[RSSeriesRegistrations]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesRegistrations_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesRegistrations] CHECK CONSTRAINT [FK_RSSeriesRegistrations_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesRegistrations]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesRegistrations_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[RSSeriesRegistrations] CHECK CONSTRAINT [FK_RSSeriesRegistrations_UserProfiles]
GO
ALTER TABLE [dbo].[RSSeriesSeriesAdmins]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSeriesAdmins_RSSeriesSeries] FOREIGN KEY([SeriesID])
REFERENCES [dbo].[RSSeriesSeries] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[RSSeriesSeriesAdmins] CHECK CONSTRAINT [FK_RSSeriesSeriesAdmins_RSSeriesSeries]
GO
ALTER TABLE [dbo].[RSSeriesSeriesAdmins]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSeriesAdmins_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[RSSeriesSeriesAdmins] CHECK CONSTRAINT [FK_RSSeriesSeriesAdmins_UserProfiles]
GO
ALTER TABLE [dbo].[RSSeriesSeriesNotes]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSeriesNotes_RSSeriesSeries] FOREIGN KEY([RSSeriesSeriesID])
REFERENCES [dbo].[RSSeriesSeries] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[RSSeriesSeriesNotes] CHECK CONSTRAINT [FK_RSSeriesSeriesNotes_RSSeriesSeries]
GO
ALTER TABLE [dbo].[RSSeriesSeriesNotes]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSeriesNotes_UserProfiles] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[RSSeriesSeriesNotes] CHECK CONSTRAINT [FK_RSSeriesSeriesNotes_UserProfiles]
GO
ALTER TABLE [dbo].[RSSeriesSeriesNotes]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSeriesNotes_UserProfiles1] FOREIGN KEY([LastUpdatedBy])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[RSSeriesSeriesNotes] CHECK CONSTRAINT [FK_RSSeriesSeriesNotes_UserProfiles1]
GO
ALTER TABLE [dbo].[RSSeriesSeriesYearlyInfo]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSeriesYearlyInfo_RSSeriesSeries] FOREIGN KEY([SeriesID])
REFERENCES [dbo].[RSSeriesSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesSeriesYearlyInfo] CHECK CONSTRAINT [FK_RSSeriesSeriesYearlyInfo_RSSeriesSeries]
GO
ALTER TABLE [dbo].[RSSeriesSpeakerChecklistCVs]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSpeakerChecklistCVs_RSSeriesSpeakerChecklist] FOREIGN KEY([RSSeriesSpeakerChecklistID])
REFERENCES [dbo].[RSSeriesSpeakerChecklists] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesSpeakerChecklistCVs] CHECK CONSTRAINT [FK_RSSeriesSpeakerChecklistCVs_RSSeriesSpeakerChecklist]
GO
ALTER TABLE [dbo].[RSSeriesSpeakerChecklistPresentationFiles]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSpeakerChecklistPresentationFiles_RSSeriesSpeakerChecklist] FOREIGN KEY([RSSeriesSpeakerChecklistID])
REFERENCES [dbo].[RSSeriesSpeakerChecklists] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesSpeakerChecklistPresentationFiles] CHECK CONSTRAINT [FK_RSSeriesSpeakerChecklistPresentationFiles_RSSeriesSpeakerChecklist]
GO
ALTER TABLE [dbo].[RSSeriesSpeakerChecklists]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSpeakerChecklist_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesSpeakerChecklists] CHECK CONSTRAINT [FK_RSSeriesSpeakerChecklist_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesSpeakerChecklists]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSpeakerChecklist_RSSeriesSpeakers] FOREIGN KEY([RSSeriesSpeakerID])
REFERENCES [dbo].[RSSeriesSpeakers] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesSpeakerChecklists] CHECK CONSTRAINT [FK_RSSeriesSpeakerChecklist_RSSeriesSpeakers]
GO
ALTER TABLE [dbo].[RSSeriesSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSpeakers_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesSpeakers] CHECK CONSTRAINT [FK_RSSeriesSpeakers_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSpeakers_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[RSSeriesSpeakers] CHECK CONSTRAINT [FK_RSSeriesSpeakers_UserProfiles]
GO
ALTER TABLE [dbo].[RSSeriesSpeakerTopics]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSpeakerTopics_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesSpeakerTopics] CHECK CONSTRAINT [FK_RSSeriesSpeakerTopics_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesSpeakerTopics]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSpeakerTopics_RSSeriesSpeakers] FOREIGN KEY([RSSeriesSpeakerID])
REFERENCES [dbo].[RSSeriesSpeakers] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesSpeakerTopics] CHECK CONSTRAINT [FK_RSSeriesSpeakerTopics_RSSeriesSpeakers]
GO
ALTER TABLE [dbo].[RSSeriesSpecialties]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSpecialties_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesSpecialties] CHECK CONSTRAINT [FK_RSSeriesSpecialties_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesSpecialties]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesSpecialties_Specialties] FOREIGN KEY([SpecialtyID])
REFERENCES [dbo].[Specialties] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesSpecialties] CHECK CONSTRAINT [FK_RSSeriesSpecialties_Specialties]
GO
ALTER TABLE [dbo].[RSSeriesStreams]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesStreams_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesStreams] CHECK CONSTRAINT [FK_RSSeriesStreams_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesStreamViews]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesStreamViews_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesStreamViews] CHECK CONSTRAINT [FK_RSSeriesStreamViews_RSSeries]
GO
ALTER TABLE [dbo].[RSSeriesStreamViews]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesStreamViews_RSSeriesStreams] FOREIGN KEY([RSSeriesStreamID])
REFERENCES [dbo].[RSSeriesStreams] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesStreamViews] CHECK CONSTRAINT [FK_RSSeriesStreamViews_RSSeriesStreams]
GO
ALTER TABLE [dbo].[RSSeriesStreamViews]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesStreamViews_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[RSSeriesStreamViews] CHECK CONSTRAINT [FK_RSSeriesStreamViews_UserProfiles]
GO
ALTER TABLE [dbo].[RSSeriesViews]  WITH CHECK ADD  CONSTRAINT [FK_RSSeriesViews_RSSeries] FOREIGN KEY([RSSeriesID])
REFERENCES [dbo].[RSSeries] ([ID])
GO
ALTER TABLE [dbo].[RSSeriesViews] CHECK CONSTRAINT [FK_RSSeriesViews_RSSeries]
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCart_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_ShoppingCart_UserProfiles]
GO
ALTER TABLE [dbo].[ShoppingCartItems]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCartItems_ShoppingCart] FOREIGN KEY([ShoppingCartID])
REFERENCES [dbo].[ShoppingCart] ([ID])
GO
ALTER TABLE [dbo].[ShoppingCartItems] CHECK CONSTRAINT [FK_ShoppingCartItems_ShoppingCart]
GO
ALTER TABLE [dbo].[ShoppingCartOptions]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCartOptions_ShoppingCartItems] FOREIGN KEY([CartItemID])
REFERENCES [dbo].[ShoppingCartItems] ([ID])
GO
ALTER TABLE [dbo].[ShoppingCartOptions] CHECK CONSTRAINT [FK_ShoppingCartOptions_ShoppingCartItems]
GO
ALTER TABLE [dbo].[ShoppingCartPromoCodes]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCartPromoCodes_EventPromoCode] FOREIGN KEY([PromoCodeID])
REFERENCES [dbo].[EventPromoCode] ([ID])
GO
ALTER TABLE [dbo].[ShoppingCartPromoCodes] CHECK CONSTRAINT [FK_ShoppingCartPromoCodes_EventPromoCode]
GO
ALTER TABLE [dbo].[ShoppingCartPromoCodes]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCartPromoCodes_ShoppingCart] FOREIGN KEY([ShoppingCartID])
REFERENCES [dbo].[ShoppingCart] ([ID])
GO
ALTER TABLE [dbo].[ShoppingCartPromoCodes] CHECK CONSTRAINT [FK_ShoppingCartPromoCodes_ShoppingCart]
GO
ALTER TABLE [dbo].[ShoppingCartPromoCodes]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCartPromoCodes_ShoppingCartItems] FOREIGN KEY([CartItemID])
REFERENCES [dbo].[ShoppingCartItems] ([ID])
GO
ALTER TABLE [dbo].[ShoppingCartPromoCodes] CHECK CONSTRAINT [FK_ShoppingCartPromoCodes_ShoppingCartItems]
GO
ALTER TABLE [dbo].[SingleSignOnTokens]  WITH CHECK ADD  CONSTRAINT [FK_SingleSignOnTokens_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[SingleSignOnTokens] CHECK CONSTRAINT [FK_SingleSignOnTokens_UserProfiles]
GO
ALTER TABLE [dbo].[SubSpecialties]  WITH CHECK ADD  CONSTRAINT [FK_SubSpecialties_Specialties] FOREIGN KEY([ParentSpecialtyID])
REFERENCES [dbo].[Specialties] ([ID])
GO
ALTER TABLE [dbo].[SubSpecialties] CHECK CONSTRAINT [FK_SubSpecialties_Specialties]
GO
ALTER TABLE [dbo].[TestingQuestions]  WITH CHECK ADD  CONSTRAINT [FK_TestingQuestions_Testing] FOREIGN KEY([TestID])
REFERENCES [dbo].[Testing] ([ID])
GO
ALTER TABLE [dbo].[TestingQuestions] CHECK CONSTRAINT [FK_TestingQuestions_Testing]
GO
ALTER TABLE [dbo].[TestingQuestions]  WITH CHECK ADD  CONSTRAINT [FK_TestingQuestions_TestingQuestionsTypes] FOREIGN KEY([QuestionTypeID])
REFERENCES [dbo].[TestingQuestionsTypes] ([ID])
GO
ALTER TABLE [dbo].[TestingQuestions] CHECK CONSTRAINT [FK_TestingQuestions_TestingQuestionsTypes]
GO
ALTER TABLE [dbo].[TestingQuestionsAnswers]  WITH CHECK ADD  CONSTRAINT [FK_TestingQuestionsAnswers_TestingQuestions] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[TestingQuestions] ([ID])
GO
ALTER TABLE [dbo].[TestingQuestionsAnswers] CHECK CONSTRAINT [FK_TestingQuestionsAnswers_TestingQuestions]
GO
ALTER TABLE [dbo].[TestingQuestionsFiles]  WITH CHECK ADD  CONSTRAINT [FK_TestingQuestionsFiles_TestingQuestions] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[TestingQuestions] ([ID])
GO
ALTER TABLE [dbo].[TestingQuestionsFiles] CHECK CONSTRAINT [FK_TestingQuestionsFiles_TestingQuestions]
GO
ALTER TABLE [dbo].[UserBoardIdentificationNumbers]  WITH CHECK ADD  CONSTRAINT [FK_UserBoardIdentificationNumbers_Boards] FOREIGN KEY([BoardID])
REFERENCES [dbo].[Boards] ([ID])
GO
ALTER TABLE [dbo].[UserBoardIdentificationNumbers] CHECK CONSTRAINT [FK_UserBoardIdentificationNumbers_Boards]
GO
ALTER TABLE [dbo].[UserBoardIdentificationNumbers]  WITH CHECK ADD  CONSTRAINT [FK_UserBoardIdentificationNumbers_UserBoardIdentificationNumbers] FOREIGN KEY([UserProfileID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[UserBoardIdentificationNumbers] CHECK CONSTRAINT [FK_UserBoardIdentificationNumbers_UserBoardIdentificationNumbers]
GO
ALTER TABLE [dbo].[UserImportErrors]  WITH CHECK ADD  CONSTRAINT [FK_UserImportErrors_UserImports] FOREIGN KEY([UserImportID])
REFERENCES [dbo].[UserImports] ([ID])
GO
ALTER TABLE [dbo].[UserImportErrors] CHECK CONSTRAINT [FK_UserImportErrors_UserImports]
GO
ALTER TABLE [dbo].[UserImportRecords]  WITH CHECK ADD  CONSTRAINT [FK_UserImportRecords_UserImports] FOREIGN KEY([UserImportID])
REFERENCES [dbo].[UserImports] ([ID])
GO
ALTER TABLE [dbo].[UserImportRecords] CHECK CONSTRAINT [FK_UserImportRecords_UserImports]
GO
ALTER TABLE [dbo].[UserImports]  WITH CHECK ADD  CONSTRAINT [FK_UserImports_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[UserImports] CHECK CONSTRAINT [FK_UserImports_UserProfiles]
GO
ALTER TABLE [dbo].[UserNotes]  WITH CHECK ADD  CONSTRAINT [FK_UserNotes_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[UserNotes] CHECK CONSTRAINT [FK_UserNotes_UserProfiles]
GO
ALTER TABLE [dbo].[UserNotes]  WITH CHECK ADD  CONSTRAINT [FK_UserNotes_UserProfiles1] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[UserNotes] CHECK CONSTRAINT [FK_UserNotes_UserProfiles1]
GO
ALTER TABLE [dbo].[UserNotes]  WITH CHECK ADD  CONSTRAINT [FK_UserNotes_UserProfiles2] FOREIGN KEY([LastUpdatedBy])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[UserNotes] CHECK CONSTRAINT [FK_UserNotes_UserProfiles2]
GO
ALTER TABLE [dbo].[UserProfiles]  WITH NOCHECK ADD  CONSTRAINT [FK_UserProfiles_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserProfiles] NOCHECK CONSTRAINT [FK_UserProfiles_AspNetUsers]
GO
ALTER TABLE [dbo].[UserProfiles]  WITH CHECK ADD  CONSTRAINT [FK_UserProfiles_Degrees] FOREIGN KEY([DegreeID])
REFERENCES [dbo].[Degrees] ([ID])
GO
ALTER TABLE [dbo].[UserProfiles] CHECK CONSTRAINT [FK_UserProfiles_Degrees]
GO
ALTER TABLE [dbo].[UserProfiles]  WITH CHECK ADD  CONSTRAINT [FK_UserProfiles_Professions] FOREIGN KEY([ProfessionID])
REFERENCES [dbo].[Professions] ([ID])
GO
ALTER TABLE [dbo].[UserProfiles] CHECK CONSTRAINT [FK_UserProfiles_Professions]
GO
ALTER TABLE [dbo].[UserProfiles]  WITH CHECK ADD  CONSTRAINT [FK_UserProfiles_Specialties] FOREIGN KEY([SpecialtyID])
REFERENCES [dbo].[Specialties] ([ID])
GO
ALTER TABLE [dbo].[UserProfiles] CHECK CONSTRAINT [FK_UserProfiles_Specialties]
GO
ALTER TABLE [dbo].[UserProfiles]  WITH CHECK ADD  CONSTRAINT [FK_UserProfiles_SubSpecialties] FOREIGN KEY([SubSpecialtyID])
REFERENCES [dbo].[SubSpecialties] ([ID])
GO
ALTER TABLE [dbo].[UserProfiles] CHECK CONSTRAINT [FK_UserProfiles_SubSpecialties]
GO
ALTER TABLE [dbo].[UserProfiles]  WITH CHECK ADD  CONSTRAINT [FK_UserProfiles_Titles] FOREIGN KEY([TitleID])
REFERENCES [dbo].[Titles] ([ID])
GO
ALTER TABLE [dbo].[UserProfiles] CHECK CONSTRAINT [FK_UserProfiles_Titles]
GO
ALTER TABLE [dbo].[UserTestQuestionAnswers]  WITH CHECK ADD  CONSTRAINT [FK_UserTestQuestionAnswers_TestingQuestionsAnswers] FOREIGN KEY([TestingQuestionsAnswersID])
REFERENCES [dbo].[TestingQuestionsAnswers] ([ID])
GO
ALTER TABLE [dbo].[UserTestQuestionAnswers] CHECK CONSTRAINT [FK_UserTestQuestionAnswers_TestingQuestionsAnswers]
GO
ALTER TABLE [dbo].[UserTestQuestionAnswers]  WITH CHECK ADD  CONSTRAINT [FK_UserTestQuestionAnswers_UserTestQuestions] FOREIGN KEY([UserTestQuestionID])
REFERENCES [dbo].[UserTestQuestions] ([ID])
GO
ALTER TABLE [dbo].[UserTestQuestionAnswers] CHECK CONSTRAINT [FK_UserTestQuestionAnswers_UserTestQuestions]
GO
ALTER TABLE [dbo].[UserTestQuestions]  WITH CHECK ADD  CONSTRAINT [FK_UserTestQuestions_TestingQuestions] FOREIGN KEY([TestingQuestionsID])
REFERENCES [dbo].[TestingQuestions] ([ID])
GO
ALTER TABLE [dbo].[UserTestQuestions] CHECK CONSTRAINT [FK_UserTestQuestions_TestingQuestions]
GO
ALTER TABLE [dbo].[UserTestQuestions]  WITH CHECK ADD  CONSTRAINT [FK_UserTestQuestions_UserTestQuestions] FOREIGN KEY([ID])
REFERENCES [dbo].[UserTestQuestions] ([ID])
GO
ALTER TABLE [dbo].[UserTestQuestions] CHECK CONSTRAINT [FK_UserTestQuestions_UserTestQuestions]
GO
ALTER TABLE [dbo].[UserTestQuestions]  WITH CHECK ADD  CONSTRAINT [FK_UserTestQuestions_UserTests] FOREIGN KEY([UserTestID])
REFERENCES [dbo].[UserTests] ([ID])
GO
ALTER TABLE [dbo].[UserTestQuestions] CHECK CONSTRAINT [FK_UserTestQuestions_UserTests]
GO
ALTER TABLE [dbo].[UserTests]  WITH CHECK ADD  CONSTRAINT [FK_UserTests_Testing] FOREIGN KEY([TestingID])
REFERENCES [dbo].[Testing] ([ID])
GO
ALTER TABLE [dbo].[UserTests] CHECK CONSTRAINT [FK_UserTests_Testing]
GO
ALTER TABLE [dbo].[UserTests]  WITH CHECK ADD  CONSTRAINT [FK_UserTests_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[UserTests] CHECK CONSTRAINT [FK_UserTests_UserProfiles]
GO
ALTER TABLE [dbo].[WebcastBoards]  WITH CHECK ADD  CONSTRAINT [FK_WebcastBoards_Boards] FOREIGN KEY([BoardID])
REFERENCES [dbo].[Boards] ([ID])
GO
ALTER TABLE [dbo].[WebcastBoards] CHECK CONSTRAINT [FK_WebcastBoards_Boards]
GO
ALTER TABLE [dbo].[WebcastBoards]  WITH CHECK ADD  CONSTRAINT [FK_WebcastBoards_Webcasts] FOREIGN KEY([WebcastID])
REFERENCES [dbo].[Webcasts] ([ID])
GO
ALTER TABLE [dbo].[WebcastBoards] CHECK CONSTRAINT [FK_WebcastBoards_Webcasts]
GO
ALTER TABLE [dbo].[WebcastCreditImportErrors]  WITH CHECK ADD  CONSTRAINT [FK_WebcastCreditImportErrors_WebcastCreditImports] FOREIGN KEY([CreditImportID])
REFERENCES [dbo].[WebcastCreditImports] ([ID])
GO
ALTER TABLE [dbo].[WebcastCreditImportErrors] CHECK CONSTRAINT [FK_WebcastCreditImportErrors_WebcastCreditImports]
GO
ALTER TABLE [dbo].[WebcastCreditImportRecords]  WITH CHECK ADD  CONSTRAINT [FK_WebcastCreditImportRecords_WebcastCreditImports] FOREIGN KEY([CreditImportID])
REFERENCES [dbo].[WebcastCreditImports] ([ID])
GO
ALTER TABLE [dbo].[WebcastCreditImportRecords] CHECK CONSTRAINT [FK_WebcastCreditImportRecords_WebcastCreditImports]
GO
ALTER TABLE [dbo].[WebcastCreditImports]  WITH CHECK ADD  CONSTRAINT [FK_WebcastCreditImports_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[WebcastCreditImports] CHECK CONSTRAINT [FK_WebcastCreditImports_UserProfiles]
GO
ALTER TABLE [dbo].[WebcastEvaluationCompetencies]  WITH CHECK ADD  CONSTRAINT [FK_WebcastEvaluationCompetencies_WebcastEvaluations] FOREIGN KEY([WebcastEvaluationID])
REFERENCES [dbo].[WebcastEvaluations] ([ID])
GO
ALTER TABLE [dbo].[WebcastEvaluationCompetencies] CHECK CONSTRAINT [FK_WebcastEvaluationCompetencies_WebcastEvaluations]
GO
ALTER TABLE [dbo].[WebcastEvaluationPanels]  WITH CHECK ADD  CONSTRAINT [FK_WebcastEvaluationPanels_WebcastEvaluationPanels] FOREIGN KEY([WebcastEvaluationID])
REFERENCES [dbo].[WebcastEvaluations] ([ID])
GO
ALTER TABLE [dbo].[WebcastEvaluationPanels] CHECK CONSTRAINT [FK_WebcastEvaluationPanels_WebcastEvaluationPanels]
GO
ALTER TABLE [dbo].[WebcastEvaluationPanels]  WITH CHECK ADD  CONSTRAINT [FK_WebcastEvaluationPanels_WebcastPanels] FOREIGN KEY([WebcastPanelID])
REFERENCES [dbo].[WebcastPanels] ([ID])
GO
ALTER TABLE [dbo].[WebcastEvaluationPanels] CHECK CONSTRAINT [FK_WebcastEvaluationPanels_WebcastPanels]
GO
ALTER TABLE [dbo].[WebcastEvaluationProgramResults]  WITH CHECK ADD  CONSTRAINT [FK_WebcastEvaluationProgramResults_WebcastEvaluations] FOREIGN KEY([WebcastEvaluationID])
REFERENCES [dbo].[WebcastEvaluations] ([ID])
GO
ALTER TABLE [dbo].[WebcastEvaluationProgramResults] CHECK CONSTRAINT [FK_WebcastEvaluationProgramResults_WebcastEvaluations]
GO
ALTER TABLE [dbo].[WebcastEvaluations]  WITH CHECK ADD  CONSTRAINT [FK_WebcastEvaluations_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[WebcastEvaluations] CHECK CONSTRAINT [FK_WebcastEvaluations_UserProfiles]
GO
ALTER TABLE [dbo].[WebcastEvaluationSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_WebcastEvaluationSpeakers_WebcastSpeakers1] FOREIGN KEY([WebcastSpeakerID])
REFERENCES [dbo].[WebcastSpeakers] ([ID])
GO
ALTER TABLE [dbo].[WebcastEvaluationSpeakers] CHECK CONSTRAINT [FK_WebcastEvaluationSpeakers_WebcastSpeakers1]
GO
ALTER TABLE [dbo].[WebcastEvaluationSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_WebcastEvaluatonSpeakers_WebcastEvaluations] FOREIGN KEY([WebcastEvaluationID])
REFERENCES [dbo].[WebcastEvaluations] ([ID])
GO
ALTER TABLE [dbo].[WebcastEvaluationSpeakers] CHECK CONSTRAINT [FK_WebcastEvaluatonSpeakers_WebcastEvaluations]
GO
ALTER TABLE [dbo].[WebcastMOCCreditTypes]  WITH CHECK ADD  CONSTRAINT [FK_WebcastMOCCreditTypes_MOCCreditTypes1] FOREIGN KEY([MOCCreditTypeID])
REFERENCES [dbo].[MOCCreditTypes] ([ID])
GO
ALTER TABLE [dbo].[WebcastMOCCreditTypes] CHECK CONSTRAINT [FK_WebcastMOCCreditTypes_MOCCreditTypes1]
GO
ALTER TABLE [dbo].[WebcastMOCCreditTypes]  WITH CHECK ADD  CONSTRAINT [FK_WebcastMOCCreditTypes_Webcasts] FOREIGN KEY([WebcastID])
REFERENCES [dbo].[Webcasts] ([ID])
GO
ALTER TABLE [dbo].[WebcastMOCCreditTypes] CHECK CONSTRAINT [FK_WebcastMOCCreditTypes_Webcasts]
GO
ALTER TABLE [dbo].[WebcastNotes]  WITH CHECK ADD  CONSTRAINT [FK_WebcastNotes_UserProfiles] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[WebcastNotes] CHECK CONSTRAINT [FK_WebcastNotes_UserProfiles]
GO
ALTER TABLE [dbo].[WebcastNotes]  WITH CHECK ADD  CONSTRAINT [FK_WebcastNotes_UserProfiles1] FOREIGN KEY([LastUpdatedBy])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[WebcastNotes] CHECK CONSTRAINT [FK_WebcastNotes_UserProfiles1]
GO
ALTER TABLE [dbo].[WebcastOptions]  WITH CHECK ADD  CONSTRAINT [FK_WebcastOptions_WebcastOptionsGroup] FOREIGN KEY([GroupID])
REFERENCES [dbo].[WebcastOptionsGroups] ([ID])
GO
ALTER TABLE [dbo].[WebcastOptions] CHECK CONSTRAINT [FK_WebcastOptions_WebcastOptionsGroup]
GO
ALTER TABLE [dbo].[WebcastPanelSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_WebcastPanelSpeakers_WebcastPanels] FOREIGN KEY([WebcastPanelID])
REFERENCES [dbo].[WebcastPanels] ([ID])
GO
ALTER TABLE [dbo].[WebcastPanelSpeakers] CHECK CONSTRAINT [FK_WebcastPanelSpeakers_WebcastPanels]
GO
ALTER TABLE [dbo].[WebcastPanelSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_WebcastPanelSpeakers_WebcastSpeakers] FOREIGN KEY([WebcastSpeakerID])
REFERENCES [dbo].[WebcastSpeakers] ([ID])
GO
ALTER TABLE [dbo].[WebcastPanelSpeakers] CHECK CONSTRAINT [FK_WebcastPanelSpeakers_WebcastSpeakers]
GO
ALTER TABLE [dbo].[WebcastQuestions]  WITH CHECK ADD  CONSTRAINT [FK_WebcastQuestions_WebcastTest] FOREIGN KEY([TestID])
REFERENCES [dbo].[WebcastTest] ([ID])
GO
ALTER TABLE [dbo].[WebcastQuestions] CHECK CONSTRAINT [FK_WebcastQuestions_WebcastTest]
GO
ALTER TABLE [dbo].[WebcastRegistrationItems]  WITH CHECK ADD  CONSTRAINT [FK_WebcastRegistrationItems_WebcastOptions] FOREIGN KEY([OptionID])
REFERENCES [dbo].[WebcastOptions] ([ID])
GO
ALTER TABLE [dbo].[WebcastRegistrationItems] CHECK CONSTRAINT [FK_WebcastRegistrationItems_WebcastOptions]
GO
ALTER TABLE [dbo].[WebcastRegistrationItems]  WITH CHECK ADD  CONSTRAINT [FK_WebcastRegistrationItems_WebcastPrices] FOREIGN KEY([PriceID])
REFERENCES [dbo].[WebcastPrices] ([ID])
GO
ALTER TABLE [dbo].[WebcastRegistrationItems] CHECK CONSTRAINT [FK_WebcastRegistrationItems_WebcastPrices]
GO
ALTER TABLE [dbo].[WebcastRegistrationItems]  WITH CHECK ADD  CONSTRAINT [FK_WebcastRegistrationItems_WebcastRegistrations] FOREIGN KEY([WebcastRegistrationID])
REFERENCES [dbo].[WebcastRegistrations] ([ID])
GO
ALTER TABLE [dbo].[WebcastRegistrationItems] CHECK CONSTRAINT [FK_WebcastRegistrationItems_WebcastRegistrations]
GO
ALTER TABLE [dbo].[WebcastRegistrations]  WITH CHECK ADD  CONSTRAINT [FK_WebcastRegistrations_PaymentMethods] FOREIGN KEY([PaymentMethod])
REFERENCES [dbo].[PaymentMethods] ([Method])
GO
ALTER TABLE [dbo].[WebcastRegistrations] CHECK CONSTRAINT [FK_WebcastRegistrations_PaymentMethods]
GO
ALTER TABLE [dbo].[WebcastRegistrations]  WITH CHECK ADD  CONSTRAINT [FK_WebcastRegistrations_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[WebcastRegistrations] CHECK CONSTRAINT [FK_WebcastRegistrations_UserProfiles]
GO
ALTER TABLE [dbo].[Webcasts]  WITH NOCHECK ADD  CONSTRAINT [FK_Webcasts_EventProvidership] FOREIGN KEY([Providership])
REFERENCES [dbo].[EventProvidership] ([Type])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Webcasts] CHECK CONSTRAINT [FK_Webcasts_EventProvidership]
GO
ALTER TABLE [dbo].[Webcasts]  WITH NOCHECK ADD  CONSTRAINT [FK_Webcasts_EventStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[EventStatus] ([Status])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Webcasts] CHECK CONSTRAINT [FK_Webcasts_EventStatus]
GO
ALTER TABLE [dbo].[WebcastSpeakerChecklistAVNeeds]  WITH CHECK ADD  CONSTRAINT [FK_WebcastSpeakerChecklistAVNeeds_WebcastSpeakerChecklists] FOREIGN KEY([WebcastSpeakerChecklistID])
REFERENCES [dbo].[WebcastSpeakerChecklists] ([ID])
GO
ALTER TABLE [dbo].[WebcastSpeakerChecklistAVNeeds] CHECK CONSTRAINT [FK_WebcastSpeakerChecklistAVNeeds_WebcastSpeakerChecklists]
GO
ALTER TABLE [dbo].[WebcastSpeakerChecklistCVs]  WITH CHECK ADD  CONSTRAINT [FK_WebcastSpeakerChecklistCVs_WebcastSpeakerChecklist] FOREIGN KEY([WebcastSpeakerChecklistID])
REFERENCES [dbo].[WebcastSpeakerChecklists] ([ID])
GO
ALTER TABLE [dbo].[WebcastSpeakerChecklistCVs] CHECK CONSTRAINT [FK_WebcastSpeakerChecklistCVs_WebcastSpeakerChecklist]
GO
ALTER TABLE [dbo].[WebcastSpeakerChecklistPresentationFiles]  WITH CHECK ADD  CONSTRAINT [FK_WebcastSpeakerChecklistPresentationFiles_WebcastSpeakerChecklist] FOREIGN KEY([WebcastSpeakerChecklistID])
REFERENCES [dbo].[WebcastSpeakerChecklists] ([ID])
GO
ALTER TABLE [dbo].[WebcastSpeakerChecklistPresentationFiles] CHECK CONSTRAINT [FK_WebcastSpeakerChecklistPresentationFiles_WebcastSpeakerChecklist]
GO
ALTER TABLE [dbo].[WebcastSpeakerChecklists]  WITH CHECK ADD  CONSTRAINT [FK_WebcastSpeakerChecklist_WebcastSpeakers] FOREIGN KEY([WebcastSpeakerID])
REFERENCES [dbo].[WebcastSpeakers] ([ID])
GO
ALTER TABLE [dbo].[WebcastSpeakerChecklists] CHECK CONSTRAINT [FK_WebcastSpeakerChecklist_WebcastSpeakers]
GO
ALTER TABLE [dbo].[WebcastSpeakerConsentForms]  WITH CHECK ADD  CONSTRAINT [FK_WebcastSpeakerConsentForms_Webcasts] FOREIGN KEY([WebcastID])
REFERENCES [dbo].[Webcasts] ([ID])
GO
ALTER TABLE [dbo].[WebcastSpeakerConsentForms] CHECK CONSTRAINT [FK_WebcastSpeakerConsentForms_Webcasts]
GO
ALTER TABLE [dbo].[WebcastSpeakerConsentForms]  WITH CHECK ADD  CONSTRAINT [FK_WebcastSpeakerConsentForms_WebcastSpeakerChecklists] FOREIGN KEY([WebcastSpeakerChecklistID])
REFERENCES [dbo].[WebcastSpeakerChecklists] ([ID])
GO
ALTER TABLE [dbo].[WebcastSpeakerConsentForms] CHECK CONSTRAINT [FK_WebcastSpeakerConsentForms_WebcastSpeakerChecklists]
GO
ALTER TABLE [dbo].[WebcastSpeakerConsentForms]  WITH CHECK ADD  CONSTRAINT [FK_WebcastSpeakerConsentForms_WebcastSpeakers] FOREIGN KEY([WebcastSpeakerID])
REFERENCES [dbo].[WebcastSpeakers] ([ID])
GO
ALTER TABLE [dbo].[WebcastSpeakerConsentForms] CHECK CONSTRAINT [FK_WebcastSpeakerConsentForms_WebcastSpeakers]
GO
ALTER TABLE [dbo].[WebcastSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_WebcastEvaluationSpeakers_WebcastSpeakers] FOREIGN KEY([ID])
REFERENCES [dbo].[WebcastSpeakers] ([ID])
GO
ALTER TABLE [dbo].[WebcastSpeakers] CHECK CONSTRAINT [FK_WebcastEvaluationSpeakers_WebcastSpeakers]
GO
ALTER TABLE [dbo].[WebcastSpeakers]  WITH NOCHECK ADD  CONSTRAINT [FK_WebcastSpeakers_UserProfiles] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[WebcastSpeakers] NOCHECK CONSTRAINT [FK_WebcastSpeakers_UserProfiles]
GO
ALTER TABLE [dbo].[WebcastSpeakerTopics]  WITH CHECK ADD  CONSTRAINT [FK_WebcastSpeakerTopics_WebcastSpeakers] FOREIGN KEY([WebcastSpeakerID])
REFERENCES [dbo].[WebcastSpeakers] ([ID])
GO
ALTER TABLE [dbo].[WebcastSpeakerTopics] CHECK CONSTRAINT [FK_WebcastSpeakerTopics_WebcastSpeakers]
GO
ALTER TABLE [dbo].[WebcastSpecialties]  WITH CHECK ADD  CONSTRAINT [FK_WebcastSpecailties_Specialties] FOREIGN KEY([SpecialtyID])
REFERENCES [dbo].[Specialties] ([ID])
GO
ALTER TABLE [dbo].[WebcastSpecialties] CHECK CONSTRAINT [FK_WebcastSpecailties_Specialties]
GO
ALTER TABLE [dbo].[WebcastsViews]  WITH CHECK ADD  CONSTRAINT [FK_WebcastsViews_Webcasts] FOREIGN KEY([WebcastID])
REFERENCES [dbo].[Webcasts] ([ID])
GO
ALTER TABLE [dbo].[WebcastsViews] CHECK CONSTRAINT [FK_WebcastsViews_Webcasts]
GO
ALTER TABLE [dbo].[WebcastsViews]  WITH CHECK ADD  CONSTRAINT [FK_WebcastsViews_WebcastsViews] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfiles] ([UserID])
GO
ALTER TABLE [dbo].[WebcastsViews] CHECK CONSTRAINT [FK_WebcastsViews_WebcastsViews]
GO
ALTER TABLE [HangFire].[JobParameter]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_JobParameter_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[JobParameter] CHECK CONSTRAINT [FK_HangFire_JobParameter_Job]
GO
ALTER TABLE [HangFire].[State]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_State_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[State] CHECK CONSTRAINT [FK_HangFire_State_Job]
GO
/****** Object:  StoredProcedure [TaskHosting].[AddMessageIdToScheduleTask]    Script Date: 9/24/2022 9:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [TaskHosting].[AddMessageIdToScheduleTask]
	@ScheduleTaskId UNIQUEIDENTIFIER,
	@MessageId UNIQUEIDENTIFIER
AS
	SET NOCOUNT ON

	IF NOT EXISTS (
		SELECT * FROM [TaskHosting].ScheduleTask
		WHERE ScheduleTaskId = @ScheduleTaskId)
	BEGIN
      RAISERROR('@ScheduleTaskId argument is wrong.', 16, 1)
      RETURN
	END


	UPDATE [TaskHosting].ScheduleTask
	SET MessageId = @MessageId
	WHERE ScheduleTaskId = @ScheduleTaskId

GO
/****** Object:  StoredProcedure [TaskHosting].[CancelJob]    Script Date: 9/24/2022 9:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Cancel Job SP
CREATE PROCEDURE [TaskHosting].[CancelJob]
  @JobId     uniqueidentifier
AS
BEGIN
    IF @JobId IS NULL
	BEGIN
      RAISERROR('@JobId argument is wrong.', 16, 1)
      RETURN
	END

    SET NOCOUNT ON
    UPDATE TaskHosting.Job SET IsCancelled = 1 WHERE JobId = @JobId
END
GO
/****** Object:  StoredProcedure [TaskHosting].[CleanupCompletedJobs]    Script Date: 9/24/2022 9:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Job will not be deleted automatically like message. Upload/Download job will be removed when clean up blob.
--This SP is to remove other type of jobs which has been completed. It will be invoked in Scheduler.
CREATE PROCEDURE [TaskHosting].[CleanupCompletedJobs]
AS
BEGIN

	DECLARE @RowsAffected BIGINT
	DECLARE @DeleteBatchSize BIGINT

	SET @DeleteBatchSize = 1000
    SET @RowsAffected = @DeleteBatchSize

	WHILE (@RowsAffected = @DeleteBatchSize)
	BEGIN
		DELETE TOP (@DeleteBatchSize) [TaskHosting].[Job] FROM [TaskHosting].[Job] AS j WHERE DATEADD(Hour, 1, j.InitialInsertTimeUTC) < GETDATE()
		AND j.JobType<>7 --Exclude upload and download tasks
		AND NOT EXISTS
		(SELECT 1 FROM [TaskHosting].[MessageQueue] m WHERE m.jobId = j.jobId)
		SET @RowsAffected = @@ROWCOUNT
	END
END
GO
/****** Object:  StoredProcedure [TaskHosting].[CountMessages]    Script Date: 9/24/2022 9:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [TaskHosting].[CountMessages]
AS
BEGIN
SELECT COUNT([MessageId]) FROM TaskHosting.MessageQueue
END

GO
/****** Object:  StoredProcedure [TaskHosting].[CreateScheduleTask]    Script Date: 9/24/2022 9:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- create stored procedure [CreateScheduleTask]
CREATE PROCEDURE [TaskHosting].[CreateScheduleTask]
	@ScheduleTaskId UNIQUEIDENTIFIER,
    @TaskType INT,
    @TaskName NVARCHAR(128),
	@ScheduleType INT,
	@ScheduleInterval INT,
	@TaskInput NVARCHAR(MAX),
	@State INT,
	@QueueId UNIQUEIDENTIFIER

AS
BEGIN -- stored procedure
	SET NOCOUNT ON

	BEGIN TRY
		BEGIN TRANSACTION

			-- Check parameter
			IF @ScheduleType != 2 AND @ScheduleType != 4 AND @ScheduleType != 8
			BEGIN
				RAISERROR('Supported Schedule type are: 2(Second) / 4(Minute) / 8(Hour)', 16, 1)
				RETURN
			END

			-- create schedule first
			DECLARE @ScheduleId INT

			INSERT INTO [TaskHosting].[Schedule]
				   ([FreqType]
				   ,[FreqInterval])
			VALUES
				   (@ScheduleType, @ScheduleInterval)

			SET @ScheduleId = @@IDENTITY

			-- add one schedule task.
			INSERT INTO [TaskHosting].[ScheduleTask]
				   ([ScheduleTaskId]
				   ,[TaskType]
				   ,[TaskName]
				   ,[Schedule]
				   ,[TaskInput]
				   ,[State]
				   ,[QueueId]
				   ,[TracingId]
				   ,[NextRunTime])
				VALUES (
					@ScheduleTaskId,
					@TaskType,
					@TaskName,
					@ScheduleId,
					@TaskInput,
					@State,
					@QueueId,
					NEWID(),
					TaskHosting.GetNextRunTime(@ScheduleId)
					)
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF XACT_STATE() != 0
		BEGIN
			ROLLBACK TRANSACTION
		END

		-- Now raiserror for the error details.
		-- Note: business logic should catch the error and possibly retry.
		DECLARE @Error_Severity INT = ERROR_SEVERITY(),
              @Error_State INT = ERROR_STATE(),
              @Error_Number INT = ERROR_NUMBER(),
              @Error_Line INT = ERROR_LINE(),
              @Error_Message NVARCHAR(2048) = ERROR_MESSAGE();

		RAISERROR ('Msg %d, Line %d: %s',
              @Error_Severity, @Error_State,
              @Error_Number, @Error_Line, @Error_Message);
	END CATCH
END -- stored procedure



GO
/****** Object:  StoredProcedure [TaskHosting].[DeleteJob]    Script Date: 9/24/2022 9:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create DeleteJob SP.

CREATE PROCEDURE [TaskHosting].[DeleteJob]
  @JobId     uniqueidentifier
AS
BEGIN
    IF @JobId IS NULL
	BEGIN
      RAISERROR('@JobId argument is wrong.', 16, 1)
      RETURN
	END

    SET NOCOUNT ON
    DELETE TaskHosting.Job WHERE JobId = @JobId
END

GO
/****** Object:  StoredProcedure [TaskHosting].[DeleteMessage]    Script Date: 9/24/2022 9:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [TaskHosting].[DeleteMessage]
  @MessageId uniqueidentifier,
  @JobId uniqueidentifier OUTPUT,
  @PostActionState int OUTPUT,
  @JobType int OUTPUT,
  @JobInputData nvarchar(max) OUTPUT
AS
BEGIN
  SET NOCOUNT ON
  SET XACT_ABORT ON

  IF @MessageId IS NULL
  BEGIN
     RAISERROR('@MessageId argument is wrong.', 16, 1)
     RETURN
  END

  DECLARE @JobResult TABLE(JobId uniqueidentifier, JobType int, CompletedTaskCount int, TaskCount int, InputData nvarchar(max))
    BEGIN TRY
        BEGIN TRAN
          UPDATE TaskHosting.Job
          SET CompletedTaskCount = CompletedTaskCount + 1
          OUTPUT inserted.JobId, inserted.JobType, inserted.CompletedTaskCount, inserted.TaskCount, inserted.InputData
          INTO @JobResult
          FROM TaskHosting.Job j INNER JOIN TaskHosting.MessageQueue m
          ON j.JobId = m.JobId
          WHERE m.MessageId = @MessageId

          SELECT @JobType = JobType, @JobInputData = InputData, @JobId = JobId,
          @PostActionState =
            CASE WHEN CompletedTaskCount = TaskCount THEN 1
            ELSE 0
            END
          FROM @JobResult

          DELETE FROM TaskHosting.MessageQueue
          WHERE MessageId = @MessageId

        COMMIT TRAN
    END TRY
    BEGIN CATCH
      IF XACT_STATE() != 0
      BEGIN
        ROLLBACK TRAN
      END

      -- Now raiserror for the error details.
      -- Note: business logic should catch the error and possibly retry.
      DECLARE @Error_Severity INT = ERROR_SEVERITY(),
              @Error_State INT = ERROR_STATE(),
              @Error_Number INT = ERROR_NUMBER(),
              @Error_Line INT = ERROR_LINE(),
              @Error_Message NVARCHAR(2048) = ERROR_MESSAGE();

      RAISERROR ('Msg %d, Line %d: %s',
                @Error_Severity, @Error_State,
                @Error_Number, @Error_Line, @Error_Message);
    END CATCH
END

GO
/****** Object:  StoredProcedure [TaskHosting].[DisableScheduleTask]    Script Date: 9/24/2022 9:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [TaskHosting].[DisableScheduleTask]
	@ScheduleTaskId UNIQUEIDENTIFIER
AS
	SET NOCOUNT ON

	DECLARE @State INT
	IF NOT EXISTS (
		SELECT * FROM [TaskHosting].ScheduleTask
		WHERE ScheduleTaskId = @ScheduleTaskId)
	BEGIN
      RAISERROR('@ScheduleTaskId argument is wrong.', 16, 1)
      RETURN
	END


	UPDATE [TaskHosting].ScheduleTask
	SET State = 0
	WHERE ScheduleTaskId = @ScheduleTaskId


GO
/****** Object:  StoredProcedure [TaskHosting].[EnableScheduleTask]    Script Date: 9/24/2022 9:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [TaskHosting].[EnableScheduleTask]
	@ScheduleTaskId UNIQUEIDENTIFIER
AS
	SET NOCOUNT ON

	DECLARE @State INT
	IF NOT EXISTS (
		SELECT * FROM [TaskHosting].ScheduleTask
		WHERE ScheduleTaskId = @ScheduleTaskId)
	BEGIN
      RAISERROR('@ScheduleTaskId argument is wrong.', 16, 1)
      RETURN
	END


	UPDATE [TaskHosting].ScheduleTask
	SET State = 1, NextRunTime = TaskHosting.GetNextRunTime(Schedule)
	WHERE ScheduleTaskId = @ScheduleTaskId AND
		State = 0	-- only enabled the task in disabled state, otherwise, keep the current state.


GO
/****** Object:  StoredProcedure [TaskHosting].[GetCancelStatus]    Script Date: 9/24/2022 9:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Check whether a job is cancelled. When dss.job.IsCancelled is set, the job is cancelled.
--There are 2 possible states: cancelling and cancelled. A job is consider cancelling only
--when there's still live message exist for this job. Otherwise, it's in cancelled state.
--Add another parameter @CheckCancellingOnly so that we can use the same SP to check both
--Cancelling and Cancelled state without querying the DB twice.
CREATE PROCEDURE [TaskHosting].[GetCancelStatus]
  @JobId     uniqueidentifier,
  @CancelState  bit OUTPUT,
  @IsJobRunning  bit OUTPUT
AS
BEGIN
    IF @JobId IS NULL
	BEGIN
      RAISERROR('@JobId argument is wrong.', 16, 1)
      RETURN
	END

    SET NOCOUNT ON

    SELECT @CancelState = IsCancelled FROM TaskHosting.Job WHERE JobId = @JobId

    IF EXISTS (SELECT * FROM TaskHosting.MessageQueue WHERE JobId = @JobId)
        SET @IsJobRunning = 1
    ELSE
        SET @IsJobRunning = 0;

END

GO
/****** Object:  StoredProcedure [TaskHosting].[GetJobByMessageId]    Script Date: 9/24/2022 9:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Currently, this sproc is created as place holder for test purpose.

CREATE PROCEDURE [TaskHosting].[GetJobByMessageId]
	@MessageId uniqueidentifier
AS
BEGIN
  IF @MessageId IS NULL
  BEGIN
     RAISERROR('@MessageId argument is wrong.', 16, 1)
     RETURN
  END

  SET NOCOUNT ON
  SELECT JobId FROM TaskHosting.MessageQueue
      WHERE MessageId = @MessageId

RETURN 0
END

GO
/****** Object:  StoredProcedure [TaskHosting].[GetMessageById]    Script Date: 9/24/2022 9:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [TaskHosting].[GetMessageById]
	@MessageId uniqueidentifier
AS
BEGIN
  IF @MessageId IS NULL
  BEGIN
     RAISERROR('@MessageId argument is wrong.', 16, 1)
     RETURN
  END

  SET NOCOUNT ON

  SELECT JobId, TracingId, InsertTimeUTC, InitialInsertTimeUTC, UpdateTimeUTC, [Version]
  FROM TaskHosting.MessageQueue
  WHERE MessageId = @MessageId

END

GO
/****** Object:  StoredProcedure [TaskHosting].[GetMessageStatusBySyncGroupMemberId]    Script Date: 9/24/2022 9:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [TaskHosting].[GetMessageStatusBySyncGroupMemberId]
	@SyncGroupMemberId UNIQUEIDENTIFIER,
	@StartTime DATETIME,
	@MaxExecTimes TINYINT,
	@TimeoutInSeconds INT,
	@HasMessage BIT OUTPUT,
	@HasRunningMessage BIT OUTPUT
AS
BEGIN
	IF @SyncGroupMemberId IS NULL
	BEGIN
		RAISERROR('@SyncGroupMemberId argument is wrong', 16, 1)
		RETURN
	END

	SET NOCOUNT ON

	SELECT
		@HasMessage = COUNT(*),
		@HasRunningMessage =
			COUNT
			(
				CASE WHEN
				-- Execute Times less than max, or execute times equal to max but it is still running, then return 1.
					(ExecTimes < @MaxExecTimes) OR (ExecTimes = @MaxExecTimes AND UpdateTimeUTC >= DATEADD(SECOND, -@TimeoutInSeconds, GETUTCDATE()))
				THEN 1
				END
			)
	FROM TaskHosting.MessageQueue
	WHERE
		InsertTimeUTC >= @StartTime
		AND MessageData LIKE '%' + CONVERT(VARCHAR(50), @SyncGroupMemberId) + '%'

END

GO
/****** Object:  StoredProcedure [TaskHosting].[GetNextMessage]    Script Date: 9/24/2022 9:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create GetNextMessage SP.
-- GetNextMessage may return one row of message if next message is available or no row if no message is available.
CREATE PROCEDURE [TaskHosting].[GetNextMessage]
  @QueueId UNIQUEIDENTIFIER,       -- The worker can pick up messages from different queue.
  @WorkerId UNIQUEIDENTIFIER,      -- The dispatchers have different worker id.
  @TimeoutInSeconds INT,           -- Let the business logic layer decides when a message is timed out, do not hardcode in SQL code.
  @MaxExecTimes TINYINT,           -- Let the business logic layer decides when a message is regarded dead, do not hardcode in SQL code.
  @Version BIGINT = 0              -- Only retrieve a message with version smaller than or equal to this value
AS
BEGIN
	SET XACT_ABORT ON

    IF @TimeoutInSeconds IS NULL OR @TimeoutInSeconds <= 0
    BEGIN
      RAISERROR('@TimeoutInSeconds argument is wrong.', 16, 1)
      RETURN
    END
    IF @MaxExecTimes IS NULL OR @MaxExecTimes <= 0
    BEGIN
      RAISERROR('@MaxExecTimes argument is wrong.', 16, 1)
      RETURN
    END

    SET NOCOUNT ON
    DECLARE @MsgId UNIQUEIDENTIFIER, @JobId UNIQUEIDENTIFIER, @MessageType INT, @TracingId UNIQUEIDENTIFIER, @State INT, @ExecTimes TINYINT, @MessageData NVARCHAR(max), @InsertTimeUTC DATETIME, @InitialInsertTimeUTC DATETIME, @UpdateTimeUTC DATETIME, @IsCancelled BIT, @ActualVersion BIGINT

    BEGIN TRY
        BEGIN TRAN

            -- Get new message which has null UpdateTimeUtc or it's timed out in UpdateTimeUtc but executed less than max times.

			SELECT TOP 1
                @MsgId=m.MessageId,
                @JobId=m.JobId,
                @MessageType=m.MessageType,
                @TracingId=m.TracingId,
                @ExecTimes=m.ExecTimes,
                @MessageData=m.MessageData,
                @InsertTimeUTC=m.InsertTimeUTC,
                @InitialInsertTimeUTC = m.InitialInsertTimeUTC,
                @UpdateTimeUTC=m.UpdateTimeUTC,
                @ActualVersion=m.[Version]
			FROM
			(
				SELECT TOP 1 *
				FROM TaskHosting.MessageQueue WITH (READPAST, UPDLOCK, FORCESEEK)
				WHERE UpdateTimeUTC IS NULL
				AND [Version] <= @Version
				AND [QueueId] = @QueueId
				ORDER BY InsertTimeUTC
				UNION
				SELECT TOP 1 *
				FROM TaskHosting.MessageQueue WITH (READPAST, UPDLOCK, FORCESEEK)
				WHERE UpdateTimeUTC < DATEADD(SECOND, -@TimeoutInSeconds, GETUTCDATE()) AND ExecTimes < @MaxExecTimes
				AND [Version] <= @Version
				AND [QueueId] = @QueueId
				ORDER BY InsertTimeUTC
			) m
			ORDER BY m.InsertTimeUTC

            IF @MsgId IS NOT NULL
            BEGIN
                -- New message is found, take ownership of it and return the information.
                UPDATE TaskHosting.MessageQueue
                SET ExecTimes = ExecTimes + 1, UpdateTimeUTC = GETUTCDATE(), WorkerId = @WorkerId
                WHERE MessageId = @MsgId

                SELECT @IsCancelled = j.IsCancelled FROM TaskHosting.Job j INNER JOIN TaskHosting.MessageQueue m ON j.JobId = m.JobId WHERE m.MessageId = @MsgId
                SELECT
                    @MsgId as MessageId,
                    @JobId as JobId,
                    @MessageType as MessageType,
                    @MessageData as MessageData,
                    @TracingId as TracingId,
                    @InsertTimeUTC as InsertTimeUTC,
                    @InitialInsertTimeUTC as InitialInsertTimeUTC,
                    @UpdateTimeUTC as UpdateTimeUTC,
                    @IsCancelled as IsCancelled,
                    @QueueId as QueueId,
                    @WorkerId as WorkerId,
                    @ActualVersion as [Version]
            END

            -- If no message is found, return nothing.

        COMMIT TRAN
    END TRY
    BEGIN CATCH
      IF XACT_STATE() != 0
      BEGIN
        ROLLBACK TRAN
      END

      -- Now raiserror for the error details.
      -- Note: business logic should catch the error and possibly retry.
      DECLARE @Error_Severity INT = ERROR_SEVERITY(),
              @Error_State INT = ERROR_STATE(),
              @Error_Number INT = ERROR_NUMBER(),
              @Error_Line INT = ERROR_LINE(),
              @Error_Message NVARCHAR(2048) = ERROR_MESSAGE();

      RAISERROR ('Msg %d, Line %d: %s',
                @Error_Severity, @Error_State,
                @Error_Number, @Error_Line, @Error_Message);
    END CATCH
END

GO
/****** Object:  StoredProcedure [TaskHosting].[GetNextMessageByType]    Script Date: 9/24/2022 9:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create GetNextMessageByType SP.
-- GetNextMessageByType may return one row of message if next message is available or no row if no message is available.
-- Do not merge this with GetNextMessage. The separation is a result of DB performance tuning
CREATE PROCEDURE [TaskHosting].[GetNextMessageByType]
  @TaskType INT,                   -- The task type to pick up
  @QueueId UNIQUEIDENTIFIER,       -- The worker can pick up messages from different queue.
  @WorkerId UNIQUEIDENTIFIER,      -- The dispatchers have different worker id.
  @TimeoutInSeconds INT,           -- Let the business logic layer decides when a message is timed out, do not hardcode in SQL code.
  @MaxExecTimes TINYINT,           -- Let the business logic layer decides when a message is regarded dead, do not hardcode in SQL code.
  @Version BIGINT = 0              -- Only retrieve a message with version smaller than or equal to this value
AS
BEGIN
	SET XACT_ABORT ON

    IF @TimeoutInSeconds IS NULL OR @TimeoutInSeconds <= 0
    BEGIN
      RAISERROR('@TimeoutInSeconds argument is wrong.', 16, 1)
      RETURN
    END
    IF @MaxExecTimes IS NULL OR @MaxExecTimes <= 0
    BEGIN
      RAISERROR('@MaxExecTimes argument is wrong.', 16, 1)
      RETURN
    END

    SET NOCOUNT ON
    DECLARE @MsgId UNIQUEIDENTIFIER, @JobId UNIQUEIDENTIFIER, @MessageType INT, @TracingId UNIQUEIDENTIFIER, @State INT, @ExecTimes TINYINT, @MessageData NVARCHAR(max), @InsertTimeUTC DATETIME, @InitialInsertTimeUTC DATETIME, @UpdateTimeUTC DATETIME, @IsCancelled BIT, @ActualVersion BIGINT

    BEGIN TRY
        BEGIN TRAN

            -- Get new message which has null UpdateTimeUtc or it's timed out in UpdateTimeUtc but executed less than max times.

			SELECT TOP 1
                @MsgId=m.MessageId,
                @JobId=m.JobId,
                @MessageType=m.MessageType,
                @TracingId=m.TracingId,
                @ExecTimes=m.ExecTimes,
                @MessageData=m.MessageData,
                @InsertTimeUTC=m.InsertTimeUTC,
                @InitialInsertTimeUTC = m.InitialInsertTimeUTC,
                @UpdateTimeUTC=m.UpdateTimeUTC,
                @ActualVersion=m.[Version]
			FROM
			(
				SELECT TOP 1 *
				FROM TaskHosting.MessageQueue WITH (READPAST, UPDLOCK, FORCESEEK)
				WHERE UpdateTimeUTC IS NULL
				AND [Version] <= @Version
				AND [QueueId] = @QueueId
                AND [MessageType] = @TaskType
				ORDER BY InsertTimeUTC
				UNION
				SELECT TOP 1 *
				FROM TaskHosting.MessageQueue WITH (READPAST, UPDLOCK, FORCESEEK)
				WHERE UpdateTimeUTC < DATEADD(SECOND, -@TimeoutInSeconds, GETUTCDATE()) AND ExecTimes < @MaxExecTimes
				AND [Version] <= @Version
                AND [MessageType] = @TaskType
				AND [QueueId] = @QueueId
				ORDER BY InsertTimeUTC
			) m
			ORDER BY m.InsertTimeUTC

            IF @MsgId IS NOT NULL
            BEGIN
                -- New message is found, take ownership of it and return the information.
                UPDATE TaskHosting.MessageQueue
                SET ExecTimes = ExecTimes + 1, UpdateTimeUTC = GETUTCDATE(), WorkerId = @WorkerId
                WHERE MessageId = @MsgId

                SELECT @IsCancelled = j.IsCancelled FROM TaskHosting.Job j INNER JOIN TaskHosting.MessageQueue m ON j.JobId = m.JobId WHERE m.MessageId = @MsgId
                SELECT
                    @MsgId as MessageId,
                    @JobId as JobId,
                    @MessageType as MessageType,
                    @MessageData as MessageData,
                    @TracingId as TracingId,
                    @InsertTimeUTC as InsertTimeUTC,
                    @InitialInsertTimeUTC as InitialInsertTimeUTC,
                    @UpdateTimeUTC as UpdateTimeUTC,
                    @IsCancelled as IsCancelled,
                    @QueueId as QueueId,
                    @WorkerId as WorkerId,
                    @ActualVersion as [Version]
            END

            -- If no message is found, return nothing.

        COMMIT TRAN
    END TRY
    BEGIN CATCH
      IF XACT_STATE() != 0
      BEGIN
        ROLLBACK TRAN
      END

      -- Now raiserror for the error details.
      -- Note: business logic should catch the error and possibly retry.
      DECLARE @Error_Severity INT = ERROR_SEVERITY(),
              @Error_State INT = ERROR_STATE(),
              @Error_Number INT = ERROR_NUMBER(),
              @Error_Line INT = ERROR_LINE(),
              @Error_Message NVARCHAR(2048) = ERROR_MESSAGE();

      RAISERROR ('Msg %d, Line %d: %s',
                @Error_Severity, @Error_State,
                @Error_Number, @Error_Line, @Error_Message);
    END CATCH
END

GO
/****** Object:  StoredProcedure [TaskHosting].[GetNextScheduleTask]    Script Date: 9/24/2022 9:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- create stored procedure to get the next the due schedule tasks.

CREATE PROCEDURE [TaskHosting].[GetNextScheduleTask]
AS
BEGIN -- stored procedure
	SET NOCOUNT ON
	BEGIN TRY
		BEGIN TRANSACTION


			SELECT ScheduleTaskId, TaskType, TaskName,
				State, NextRunTime, MessageId, TaskInput, QueueId, TracingId, JobId
			FROM [TaskHosting].[ScheduleTask] WITH (UPDLOCK, READPAST)
			WHERE State = 1	-- enabled task.
			AND DATEDIFF(SECOND, NextRunTime, GETUTCDATE()) > 0	-- task is due.

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF XACT_STATE() != 0
		BEGIN
			ROLLBACK TRANSACTION
		END

		-- Now raiserror for the error details.
		-- Note: business logic should catch the error and possibly retry.
		DECLARE @Error_Severity INT = ERROR_SEVERITY(),
              @Error_State INT = ERROR_STATE(),
              @Error_Number INT = ERROR_NUMBER(),
              @Error_Line INT = ERROR_LINE(),
              @Error_Message NVARCHAR(2048) = ERROR_MESSAGE();

		RAISERROR ('Msg %d, Line %d: %s',
              @Error_Severity, @Error_State,
              @Error_Number, @Error_Line, @Error_Message);
	END CATCH
END  -- stored procedure
GO
/****** Object:  StoredProcedure [TaskHosting].[GetPendingMessageCount]    Script Date: 9/24/2022 9:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [TaskHosting].[GetPendingMessageCount]
AS
	SELECT [MessageType], COUNT(*) as [MessageCount] FROM [TaskHosting].[MessageQueue] WITH (NOLOCK) WHERE UpdateTimeUTC IS NULL
    GROUP BY [MessageType]
    RETURN 0
GO
/****** Object:  StoredProcedure [TaskHosting].[GetRunningMessageCount]    Script Date: 9/24/2022 9:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [TaskHosting].[GetRunningMessageCount]
AS
	SELECT [MessageType], COUNT(*) as [MessageCount] FROM [TaskHosting].[MessageQueue] WITH (NOLOCK)
    WHERE UpdateTimeUTC IS NOT NULL AND ExecTimes < 3
    GROUP BY [MessageType]
    RETURN 0
GO
/****** Object:  StoredProcedure [TaskHosting].[GetScheduleTaskInfo]    Script Date: 9/24/2022 9:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- create stored procedure [TaskHosting].[GetScheduleTaskInfo]

CREATE PROCEDURE [TaskHosting].[GetScheduleTaskInfo]
	@MessageId uniqueidentifier
AS
BEGIN -- stored procedure
	SET NOCOUNT ON

	SELECT * FROM [TaskHosting].[ScheduleTask]
	WHERE MessageId = @MessageId
END  -- stored procedure
GO
/****** Object:  StoredProcedure [TaskHosting].[InsertJob]    Script Date: 9/24/2022 9:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create InsertJob SP.

CREATE PROCEDURE [TaskHosting].[InsertJob]
  @JobId     uniqueidentifier,
  @JobType int,
  @TracingId uniqueidentifier
AS
BEGIN
    IF @JobId IS NULL
	BEGIN
      RAISERROR('@JobId argument is wrong.', 16, 1)
      RETURN
	END

    SET NOCOUNT ON
    INSERT TaskHosting.Job([JobId], [JobType], [TracingId])
    VALUES (@JobId, @JobType, @TracingId)
END

GO
/****** Object:  StoredProcedure [TaskHosting].[InsertJobAndMessages]    Script Date: 9/24/2022 9:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [TaskHosting].[InsertJobAndMessages]
    @JobId uniqueidentifier,
    @JobType int,
    @JobInputData nvarchar(max),
    @TracingId uniqueidentifier,
    @MessageList [TaskHosting].[MessageListType] READONLY
AS
BEGIN
	SET XACT_ABORT ON

    DECLARE @TaskCount int
    SELECT @TaskCount = COUNT(*) FROM @MessageList

    BEGIN TRY
        BEGIN TRAN
            INSERT TaskHosting.Job([JobId], [JobType], [InputData], [TracingId], [TaskCount])
            VALUES (@JobId, @JobType, @JobInputData, @TracingId, @TaskCount)

            INSERT INTO TaskHosting.MessageQueue
            (
                [MessageId],
                [JobId],
                [QueueId],
                [MessageType],
                [MessageData],
                [TracingId],
                [InitialInsertTimeUTC],
                [InsertTimeUTC],
                [Version]
            )
            SELECT
                [MessageId],
                [JobId],
                [QueueId],
                [MessageType],
                [MessageData],
                [TracingId],
                GETUTCDATE(),
                GETUTCDATE(),
                [Version]
            FROM @MessageList
        COMMIT TRAN
    END TRY
    BEGIN CATCH
      IF XACT_STATE() != 0
      BEGIN
        ROLLBACK TRAN
      END

      -- Now raiserror for the error details.
      -- Note: business logic should catch the error and possibly retry.
      DECLARE @Error_Severity INT = ERROR_SEVERITY(),
              @Error_State INT = ERROR_STATE(),
              @Error_Number INT = ERROR_NUMBER(),
              @Error_Line INT = ERROR_LINE(),
              @Error_Message NVARCHAR(2048) = ERROR_MESSAGE();

      RAISERROR ('Msg %d, Line %d: %s',
                @Error_Severity, @Error_State,
                @Error_Number, @Error_Line, @Error_Message);
    END CATCH
END


GO
/****** Object:  StoredProcedure [TaskHosting].[InsertMessage]    Script Date: 9/24/2022 9:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create InsertMessage SP.

CREATE PROCEDURE [TaskHosting].[InsertMessage]
  @MessageId	uniqueidentifier,
  @JobId		uniqueidentifier,
  @MessageType	int,
  @MessageData	nvarchar(max),
  @QueueId		uniqueidentifier,
  @TracingId	uniqueidentifier,
  @Version		bigint = 0
AS
BEGIN
    IF @MessageId IS NULL
	BEGIN
      RAISERROR('@MessageId argument is wrong.', 16, 1)
      RETURN
	END

	IF @JobId IS NULL
	BEGIN
      RAISERROR('@JobId argument is wrong.', 16, 1)
      RETURN
	END

    SET NOCOUNT ON
    INSERT TaskHosting.MessageQueue ([MessageId], [JobId], [MessageType], [MessageData], [QueueId], [TracingId], [InitialInsertTimeUTC], [InsertTimeUTC], [Version])
    VALUES (@MessageId, @JobId, @MessageType, @MessageData, @QueueId, @TracingId, GETUTCDATE(), GETUTCDATE(), @Version)
END

GO
/****** Object:  StoredProcedure [TaskHosting].[IsJobRunning]    Script Date: 9/24/2022 9:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Detect whether the job is running by checking the messages

CREATE PROCEDURE [TaskHosting].[IsJobRunning]
	@JobId UNIQUEIDENTIFIER
AS
	IF @JobId IS NULL
	BEGIN
		RAISERROR('@JobId argument is wrong.', 16, 1)
		RETURN
	END

	SET NOCOUNT ON

	IF EXISTS
		(SELECT *
		FROM [TaskHosting].[MessageQueue]
		WHERE JobId = @JobId
		)
		SELECT 1
	ELSE
		SELECT 0

RETURN 0

GO
/****** Object:  StoredProcedure [TaskHosting].[KeepAliveMessage]    Script Date: 9/24/2022 9:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create KeepAliveMessage SP.
-- The @Applied will contain 1 if the message was kept alive, 0 if message does not exist
CREATE PROCEDURE [TaskHosting].[KeepAliveMessage]
  @MessageId uniqueidentifier,
  @Applied INT OUTPUT
AS
BEGIN
  SET XACT_ABORT ON

  IF @MessageId IS NULL
  BEGIN
     RAISERROR('@MessageId argument is wrong.', 16, 1)
     RETURN
  END

  SET NOCOUNT ON
  -- Check we are not running for untaken messages.
  DECLARE @execTimes TINYINT
  DECLARE @resetTimes INT

  SELECT
        @execTimes = ExecTimes,
        @resetTimes = ResetTimes
  FROM TaskHosting.MessageQueue
  WHERE MessageId = @MessageId

  IF @ExecTimes = 0 AND @resetTimes = 0
  BEGIN
    DECLARE @msgStr NVARCHAR(100)
    SET @msgStr = 'KeepAlive on new message ' + CONVERT(NVARCHAR(128), @MessageId) + '.'
    RAISERROR(@msgStr, 16, 1)
    RETURN
  END
  -- Else: When @resetTimes > 0 but @ExecTimes = 0, it is possible that the message has just been reset under some timing conditions
  --       We are not going to error out this condition
  BEGIN TRY
      BEGIN TRAN
          --When message exists and has been picked up to run @Applied will be updated to 1.
          UPDATE TaskHosting.MessageQueue SET UpdateTimeUTC = GETUTCDATE()
          WHERE MessageId = @MessageId AND UpdateTimeUTC IS NOT NULL
          SET @Applied = @@ROWCOUNT -- @@ROWCOUNT not affected by NOCOUNT ON

          -- If the UpdateTimeUTC is NULL but the MessageID exist, the message should have been reset. @Applied will be set to 3
          SELECT @Applied = 3
          FROM TaskHosting.MessageQueue WHERE MessageId = @MessageId AND UpdateTimeUTC IS NULL

          -- When job is cancelled, @Applied will be updated to 2
          SELECT @Applied = 2
          FROM TaskHosting.Job j INNER JOIN TaskHosting.MessageQueue m ON j.JobId = m.JobId
          WHERE m.MessageId = @MessageId AND j.IsCancelled = 1
      COMMIT TRAN
  END TRY
  BEGIN CATCH
      IF XACT_STATE() != 0
      BEGIN
        ROLLBACK TRAN
      END

      -- Now raiserror for the error details.
      -- Note: business logic should catch the error and possibly retry.
      DECLARE @Error_Severity INT = ERROR_SEVERITY(),
              @Error_State INT = ERROR_STATE(),
              @Error_Number INT = ERROR_NUMBER(),
              @Error_Line INT = ERROR_LINE(),
              @Error_Message NVARCHAR(2048) = ERROR_MESSAGE();

      RAISERROR ('Msg %d, Line %d: %s',
                @Error_Severity, @Error_State,
                @Error_Number, @Error_Line, @Error_Message);
  END CATCH
END

GO
/****** Object:  StoredProcedure [TaskHosting].[ResetMessageById]    Script Date: 9/24/2022 9:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create ResetMessageById SP.

CREATE PROCEDURE [TaskHosting].[ResetMessageById]
  @MessageId uniqueidentifier
AS
BEGIN
    IF @MessageId IS NULL
	BEGIN
      RAISERROR('@MessageId argument is wrong.', 16, 1)
      RETURN
	END

    SET NOCOUNT ON
    UPDATE TaskHosting.MessageQueue
	SET [InsertTimeUTC] = GETUTCDATE(),
		[UpdateTimeUTC] = NULL,
		[ExecTimes] = 0,
        [WorkerId] = NULL,
		[ResetTimes] = [ResetTimes] + 1
	WHERE [MessageId] = @MessageId
END

GO
/****** Object:  StoredProcedure [TaskHosting].[ResetMessageQueue]    Script Date: 9/24/2022 9:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Reset the message in the particular queue to ready state so that they will be picked up again
CREATE PROCEDURE [TaskHosting].[ResetMessageQueue]
	@QueueId uniqueidentifier
AS
BEGIN
    IF @QueueId IS NULL
	BEGIN
      RAISERROR('@QueueId argument is wrong.', 16, 1)
      RETURN
	END

    -- All the messages in the queue is still in running state and need to be re-picked up
    UPDATE TaskHosting.MessageQueue
    SET UpdateTimeUTC = NULL, WorkerId = NULL, ExecTimes = 0, ResetTimes = ResetTimes + 1
    WHERE QueueId = @QueueId

    RETURN 0
END
GO
/****** Object:  StoredProcedure [TaskHosting].[UpdateAllTaskNextRunTime]    Script Date: 9/24/2022 9:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- create stored procedure to get the next the due schedule tasks.

CREATE PROCEDURE [TaskHosting].[UpdateAllTaskNextRunTime]
AS
BEGIN -- stored procedure
	SET NOCOUNT ON

	-- update next run time
	UPDATE TaskHosting.ScheduleTask WITH (UPDLOCK, READPAST)
	SET NextRunTime = TaskHosting.GetNextRunTime(Schedule), JobId='00000000-0000-0000-0000-000000000000'
	WHERE State = 1	-- enabled task.
END  -- stored procedure
GO
/****** Object:  StoredProcedure [TaskHosting].[UpdateNextRunTime]    Script Date: 9/24/2022 9:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- create stored procedure to get the next the due schedule tasks.

CREATE PROCEDURE [TaskHosting].[UpdateNextRunTime]
@ScheduleTaskId UNIQUEIDENTIFIER
AS
BEGIN -- stored procedure
	SET NOCOUNT ON

	-- update next run time
	UPDATE TaskHosting.ScheduleTask WITH (UPDLOCK, READPAST)
	SET NextRunTime = TaskHosting.GetNextRunTime(Schedule)
	WHERE State = 1	-- enabled task.
	 AND ScheduleTaskId = @ScheduleTaskId
END  -- stored procedure
GO
/****** Object:  StoredProcedure [TaskHosting].[UpdateScheduleTask]    Script Date: 9/24/2022 9:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- create stored procedure [UpdateScheduleTask]
CREATE PROCEDURE [TaskHosting].[UpdateScheduleTask]
	@ScheduleTaskId UNIQUEIDENTIFIER,
    @TaskType INT,
    @TaskName NVARCHAR(128),
	@ScheduleType INT,
	@ScheduleInterval INT,
	@TaskInput NVARCHAR(MAX),
	@State INT,
	@QueueId UNIQUEIDENTIFIER

AS
BEGIN -- stored procedure
	SET NOCOUNT ON

	BEGIN TRY
		BEGIN TRANSACTION

			-- Check parameter
			IF @ScheduleType != 2 AND @ScheduleType != 4 AND @ScheduleType != 8
			BEGIN
				RAISERROR('Supported Schedule type are: 2(Second) / 4(Minute) / 8(Hour)', 16, 1)
				RETURN
			END

			IF NOT EXISTS (
				SELECT * FROM [TaskHosting].ScheduleTask
				WHERE ScheduleTaskId = @ScheduleTaskId)
			BEGIN
			  RAISERROR('@ScheduleTaskId argument is wrong.', 16, 1)
			  RETURN
			END

			-- create schedule first
			DECLARE @ScheduleId INT

			SELECT @ScheduleId = [Schedule]
			FROM [TaskHosting].[ScheduleTask]
			WHERE [ScheduleTaskId] = @ScheduleTaskId

			UPDATE [TaskHosting].[Schedule]
			SET [FreqType] = @ScheduleType, [FreqInterval] = @ScheduleInterval
			WHERE [ScheduleId] = @ScheduleId

			-- update the schedule task.
			UPDATE [TaskHosting].[ScheduleTask]
				SET
						[TaskType] = @TaskType,
						[TaskName] = @TaskName,
						[TaskInput] = @TaskInput,
						[State] = @State,
						[QueueId] = @QueueId,
						[NextRunTime] = TaskHosting.GetNextRunTime(@ScheduleId)
				WHERE	[ScheduleTaskId] = @ScheduleTaskId

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF XACT_STATE() != 0
		BEGIN
			ROLLBACK TRANSACTION
		END

		-- Now raiserror for the error details.
		-- Note: business logic should catch the error and possibly retry.
		DECLARE @Error_Severity INT = ERROR_SEVERITY(),
              @Error_State INT = ERROR_STATE(),
              @Error_Number INT = ERROR_NUMBER(),
              @Error_Line INT = ERROR_LINE(),
              @Error_Message NVARCHAR(2048) = ERROR_MESSAGE();

		RAISERROR ('Msg %d, Line %d: %s',
              @Error_Severity, @Error_State,
              @Error_Number, @Error_Line, @Error_Message);
	END CATCH
END -- stored procedure



GO
/****** Object:  StoredProcedure [TaskHosting].[UpdateScheduleTaskJobInfo]    Script Date: 9/24/2022 9:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [TaskHosting].[UpdateScheduleTaskJobInfo]
	@ScheduleTaskId UNIQUEIDENTIFIER,
	@JobId UNIQUEIDENTIFIER
AS
	SET NOCOUNT ON

	IF NOT EXISTS (
		SELECT * FROM [TaskHosting].ScheduleTask
		WHERE ScheduleTaskId = @ScheduleTaskId)
	BEGIN
      RAISERROR('@ScheduleTaskId argument is wrong.', 16, 1)
      RETURN
	END


	UPDATE [TaskHosting].ScheduleTask
	SET JobId = @JobId
	WHERE ScheduleTaskId = @ScheduleTaskId

GO
/****** Object:  StoredProcedure [TaskHosting].[UpdateScheduleTaskMessageInfoV2]    Script Date: 9/24/2022 9:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [TaskHosting].[UpdateScheduleTaskMessageInfoV2]
	@ScheduleTaskId UNIQUEIDENTIFIER,
	@MessageId UNIQUEIDENTIFIER,
	@JobId UNIQUEIDENTIFIER
AS
	SET NOCOUNT ON

	IF NOT EXISTS (
		SELECT * FROM [TaskHosting].ScheduleTask
		WHERE ScheduleTaskId = @ScheduleTaskId)
	BEGIN
      RAISERROR('@ScheduleTaskId argument is wrong.', 16, 1)
      RETURN
	END

	UPDATE [TaskHosting].ScheduleTask
	SET MessageId = @MessageId,
		JobId = @JobId,
		NextRunTime = TaskHosting.GetNextRunTime(Schedule)
	WHERE ScheduleTaskId = @ScheduleTaskId


GO
EXEC sys.sp_addextendedproperty @name=N'MS_name', @value=N'DataSync' , @level0type=N'SCHEMA',@level0name=N'dss'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_name', @value=N'DataSync' , @level0type=N'SCHEMA',@level0name=N'TaskHosting'
GO
USE [master]
GO
ALTER DATABASE [osuccme-dev] SET  READ_WRITE 
GO
