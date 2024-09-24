WITH RankedSleepLogs AS (
  SELECT 
      b.[ParticipantIdentifier],
      d.[startdate],
      d.[enddate],
      DATEDIFF(minute, d.[startdate], d.[enddate]) AS sleepvalue,
      b.[Duration],
      b.[Efficiency],
      b.[InfoCode],
      b.[MinutesAfterWakeup],
      b.[MinutesAsleep],
      b.[MinutesAwake],
      b.[MinutesToFallAsleep],
      b.[TimeInBed],
      b.[Type] AS [FitBitType],        -- Aliased column from FactFitBitSleepLogs
      b.[SleepLevelAwake],
      b.[SleepLevelAsleep],
      b.[SleepLevelDeep],
      b.[SleepLevelLight],
      b.[SleepLevelRem],
      b.[SleepLevelRestless],
      b.[SleepLevelWake],
      b.[LogId],
      b.[SurrogateKey],
      b.[SurveyResultKey_FK],
      d.[sleeplogdate],
      d.[type] AS [SleepDetailsType],  -- Aliased column from DimSleepDetailsLogs
      d.[value],
      d.[logID] as detailLogID,
      ROW_NUMBER() OVER (PARTITION BY b.[ParticipantIdentifier], d.[startdate], d.[enddate] ORDER BY d.[startdate], d.[enddate]) AS rn
  FROM [DW].[FactFitBitSleepLogs] b
  JOIN [DW].[DimSleepDetailsLogs] d ON b.[ParticipantIdentifier] = d.[partcipantIdentifier]
  AND b.[LogId] = d.[logID]
)
SELECT * 
FROM RankedSleepLogs
WHERE rn = 1;
