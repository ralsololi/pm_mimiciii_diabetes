CREATE TABLE diabetes.admissions_icustays AS
(SELECT DISTINCT
  admissions.subject_id, 
  admissions.hadm_id, 
  admissions.activity, 
  admissions.charttime
FROM 
  diabetes.admissions, 
  mimiciii.diagnoses_icd
WHERE 
  admissions.hadm_id = diagnoses_icd.hadm_id AND
  diagnoses_icd.icd9_code SIMILAR TO  '25000|25001|25002|25003'
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
  diagnoses_icd.icd9_code SIMILAR TO  '25000|25001|25002|25003')
ORDER BY subject_id, hadm_id, charttime, activity;