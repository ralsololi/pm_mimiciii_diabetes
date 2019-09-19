CREATE TABLE diabetes.diabetes_allevents AS
(SELECT DISTINCT
  subject_id, 
  hadm_id, 
  'admissions' tablename,
  activity AS category,
  activity AS activity, 
  charttime
FROM 
  diabetes.admissions
UNION ALL
SELECT DISTINCT
  subject_id, 
  hadm_id, 
  'datetimeevents',
  category,
  activity, 
  charttime
FROM 
  diabetes.datetimeevents
UNION ALL
 SELECT DISTINCT
  subject_id, 
  hadm_id, 
  'diabetes_prescriptions',
  category,
  activity, 
  startdate
FROM 
  diabetes.diabetes_prescriptions
UNION ALL
SELECT DISTINCT
  subject_id, 
  hadm_id, 
  'diabetes_icustays',
  activity,
  activity, 
  charttime
FROM 
  diabetes.diabetes_icustays
UNION ALL
SELECT DISTINCT
  subject_id, 
  hadm_id, 
  'diabetes_inputevents_cv',
  category,
  activity, 
  charttime
FROM 
  diabetes.diabetes_inputevents_cv
UNION ALL
SELECT DISTINCT
  subject_id, 
  hadm_id, 
  'diabetes_inputevents_mv',
  category,
  activity, 
  starttime
FROM 
  diabetes.diabetes_inputevents_mv
UNION ALL
SELECT DISTINCT
  subject_id, 
  hadm_id, 
  'diabetes_labevents',
  category,
  activity, 
  charttime
FROM 
  diabetes.diabetes_labevents
UNION ALL
SELECT DISTINCT
  subject_id, 
  hadm_id, 
  'diabetes_noteevents',
  category,
  activity, 
  charttime
FROM 
  diabetes.diabetes_noteevents
UNION ALL
SELECT DISTINCT
  subject_id, 
  hadm_id, 
  'diabetes_outputevents',
  category,
  activity, 
  charttime
FROM 
  diabetes.diabetes_outputevents
UNION ALL
SELECT DISTINCT
  subject_id, 
  hadm_id, 
  'diabetes_procedureevents_mv',
  category,
  activity, 
  starttime
FROM 
  diabetes.diabetes_procedureevents_mv
UNION ALL
SELECT DISTINCT
  subject_id, 
  hadm_id, 
  'diabetes_services',
  activity,
  activity, 
  charttime
FROM 
  diabetes.diabetes_services
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