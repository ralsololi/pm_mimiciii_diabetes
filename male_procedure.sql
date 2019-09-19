CREATE TABLE diabetes.male_procedures AS
(SELECT 
  subject_id, 
  hadm_id, 
  activity, 
  charttime
FROM 
  diabetes.admission_diabetes,
  mimiciii.patients
WHERE 
  admission_diabetes.subject_id = patients.subject_id AND 
  patients.gender = 'm'  
  
  UNION ALL
  SELECT 
  subject_id, 
  hadm_id,
  activity, 
  charttime
FROM 
  diabetes.icustays
  mimiciii.patients
WHERE 
  icustays.subject_id = patients.subject_id AND 
  patients.gender = 'm'  
  
  
UNION ALL
SELECT 
  subject_id, 
  hadm_id, 
  activity, 
  starttime 
FROM 
  diabetes.procedureevents_mv
  mimiciii.patients
WHERE 
  procedureevents_mv.subject_id = patients.subject_id AND 
  patients.gender = 'm')
ORDER BY subject_id, hadm_id, charttime, activity;