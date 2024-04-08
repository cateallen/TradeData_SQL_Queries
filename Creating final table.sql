USE [Tradecube 3.0 Processed Files]
GO

/****** Object:  Table [dbo].[SPC_2010_2016_Air_Value_V430]    Script Date: 4/30/2019 9:48:04 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SPC_2010_2016_Air_VW_3](
	[state] [varchar](2) NULL,
	[district] [varchar](2) NULL,
	[port] [varchar](2) NULL,
	[country] [varchar](4) NULL,
	[Mode] [nvarchar](50) NULL,
	[V2010] [float] NULL,
	[V2011] [float] NULL,
	[V2012] [float] NULL,
	[V2013] [float] NULL,
	[V2014] [float] NULL,
	[V2015] [float] NULL,
	[V2016] [float] NULL,
	[W2010] [float] NULL,
	[W2011] [float] NULL,
	[W2012] [float] NULL,
	[W2013] [float] NULL,
	[W2014] [float] NULL,
	[W2015] [float] NULL,
	[W2016] [float] NULL
) ON [PRIMARY]
GO


