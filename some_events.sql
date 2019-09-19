CREATE TABLE diabetes.diabetes_transfers_events AS
(SELECT DISTINCT
  subject_id, 
  hadm_id, 
  'admissions' tablename,
  activity, 
  charttime
FROM 
  diabetes.admissions
UNION ALL
SELECT DISTINCT
  subject_id, 
  hadm_id, 
  'diabetes_transfers',
  category,
  activity, 
  charttime
FROM 
  diabetes.diabetes_transfers)
ORDER BY subject_id, hadm_id, charttime, activity;