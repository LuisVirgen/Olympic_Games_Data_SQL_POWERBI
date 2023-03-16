
SELECT [ID]
      ,[Name] AS 'Competitor Name' -- Renamed Column
	  ,Case When Sex='M' Then 'Male' ELSE 'Female' END As Sex 
      ,[Age]
	  ,Case  When [Age]<19 Then 'Under 18'
			 When [Age] Between 18 and 25 Then '18-25'
			 When [Age] Between 25 and 30 Then '25-30'
			 When [Age]>30 Then 'Over 30'
		End as [Age Grouping]
      ,[Height]
      ,[Weight]
      ,[NOC] as 'Nation Code' --Abbreviation for Country
	  --,CHARINDEX(' ',Games)-1 --Used this to extract the number of character for the year
	  --,CHARINDEX(' ',REVERSE(Games))-1 -- Used this to extract how many letters the season has to extract it.
	  ,LEFT (Games,(CHARINDEX(' ',Games)-1)) as 'Year'
	  ,RIGHT(Games,CHARINDEX(' ',REVERSE(Games))-1) as 'Season'
      --,[Games]
      --,[City] Commented out since it is not necessary for analysis
      ,[Sport]
      ,[Event]
	  ,CASE WHEN Medal='NA' THEN 'Not Registered' ELSE Medal END as Medal -- Replace NA with Not Registered
  FROM [olympic_games].[dbo].[athletes_event_results]
  WHERE RIGHT(Games,CHARINDEX(' ',REVERSE(Games))-1)='Summer' --Where Clause to filter only Games that happened on Summer.
