CREATE TABLE diabetes.admissions_icustays_t_2 AS
(SELECT DISTINCT
  subject_id, 
  hadm_id, 
  'admissions_t_2' tablename,
  activity AS activity, 
  charttime
FROM 
  diabetes.admissions_t_2
UNION ALL
SELECT DISTINCT
  subject_id, 
  hadm_id, 
  'icustays_t_2',
  activity, 
  charttime
FROM 
  diabetes.icustays_t_2)
ORDER BY subject_id, hadm_id, charttime, activity;