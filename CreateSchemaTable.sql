CREATE SCHEMA Cube;
GO

CREATE TABLE [Cube].[Legislation](
	[LegislationVersionId] [int] NOT NULL,
	[LegislationSourceId] [varchar](100) NOT NULL,
	[LegislationVersionOrdinal] [int] NULL,
	[Title] [varchar](500) NULL,
	[NativeTitle] [varchar](max) NULL,
	[JurisdictionSourceId] [varchar](100) NULL,
	[JurisdictionName] [varchar](100) NULL,
	[IssuingBodySourceId] [varchar](100) NULL,
	[IssuingBodyName] [varchar](100) NULL,
	[PartVersionId] [int] NOT NULL,
	[PartSourceId] [varchar](100) NULL,
	[PartVersionOrdinal] [int] NULL,
	[OrderNum] [int] NULL,
	[Content] [text] NULL,
	[NativeContent] [varchar](max) NULL,
	[ParentPartVersionId] [int] NULL,
	[ParentPartSourceId] [varchar](100) NULL,
	[ParentPartVersionOrdinal] [int] NULL,
 CONSTRAINT [Composite_Key_Legislation] PRIMARY KEY CLUSTERED 
(
	[LegislationVersionId] ASC,
	[LegislationSourceId] ASC,
	[PartVersionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
