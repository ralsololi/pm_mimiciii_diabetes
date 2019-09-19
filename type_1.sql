CREATE TABLE diabetes.new_type1_procedure AS
(SELECT DISTINCT
  admission_diabetes.subject_id,
  admission_diabetes.hadm_id, 
  admission_diabetes.activity, 
  admission_diabetes.charttime
FROM
  diabetes.admission_diabetes,
  mimiciii.diagnoses_icd
WHERE 
  admission_diabetes.hadm_id = diagnoses_icd.hadm_id AND
  diagnoses_icd.icd9_code SIMILAR TO '25001|25003'
  UNION ALL
  SELECT DISTINCT
  icustays.subject_id, 
  icustays.hadm_id,
  icustays.activity, 
  icustays.charttime
FROM 
  diabetes.icustays,
  mimiciii.diagnoses_icd
WHERE 
  icustays.hadm_id = diagnoses_icd.hadm_id AND
  diagnoses_icd.icd9_code SIMILAR TO '25001|25003'
UNION ALL
SELECT DISTINCT
  procedureevents_mv.subject_id,
  procedureevents_mv.hadm_id, 
  procedureevents_mv.activity, 
  procedureevents_mv.starttime 
FROM 
  diabetes.procedureevents_mv,
  mimiciii.diagnoses_icd
WHERE 
  procedureevents_mv.hadm_id = diagnoses_icd.hadm_id AND
  diagnoses_icd.icd9_code SIMILAR TO '25001|25003')
ORDER BY subject_id, hadm_id, charttime, activity;
