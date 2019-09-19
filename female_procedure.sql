CREATE TABLE diabetes.female_procedures AS
(SELECT DISTINCT 
  admission_diabetes.subject_id,
  admission_diabetes.hadm_id, 
  admission_diabetes.activity, 
  admission_diabetes.charttime
FROM 
  diabetes.admission_diabetes,
  mimiciii.patients
WHERE 
  admission_diabetes.subject_id = patients.subject_id AND 
  patients.gender = 'F'  
  
  UNION ALL
  SELECT DISTINCT
  icustays.subject_id, 
  icustays.hadm_id,
  icustays.activity, 
  icustays.charttime
FROM 
  diabetes.icustays,
  mimiciii.patients
WHERE 
  icustays.subject_id = patients.subject_id AND 
  patients.gender = 'F'  
  
  
UNION ALL
SELECT DISTINCT
  procedureevents_mv.subject_id,
  procedureevents_mv.hadm_id, 
  procedureevents_mv.activity, 
  procedureevents_mv.starttime 
FROM 
  diabetes.procedureevents_mv,
  mimiciii.patients
WHERE 
  procedureevents_mv.subject_id = patients.subject_id AND 
  patients.gender = 'F')
ORDER BY  hadm_id, charttime, activity;