select  count(distinct participantidentifier) from [DW].[DimSurveyQuestionResult]
where[ParticipantIdentifier]  in (select [ParticipantIdentifier]  from [dbo].[StudyParticipants]) AND [resultidentifier] IN('asleep0_2', 'concentr0_2', 'down0_2', 'interest0_2', 'tired0_2','appetite0_2', 'activity0_2', 'failure0_2', 'suic0_2')
AND [answers] IS NOT NULL  
AND participantidentifier IN (select  participantidentifier from  [DW].[DimSurveyQuestionResult] where [resultidentifier] IN ('asleep0_1', 'concentr0_1', 'down0_1', 'interest0_1', 'tired0_1','appetite0_1', 'activity0_1', 'failure0_1', 'suic0_1')  AND [answers] IS NOT NULL)
AND participantidentifier IN (select  participantidentifier from  [DW].[DimSurveyQuestionResult] where [resultidentifier] IN ('asleep0', 'concentr0', 'down0', 'interest0', 'tired0','appetite0', 'activity0', 'failure0', 'suic0') AND [answers] IS NOT NULL)

