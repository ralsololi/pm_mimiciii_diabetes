CREATE TABLE diabetes.diabetes_male AS
(SELECT DISTINCT
  admission_trans.subject_id, 
  admission_trans.hadm_id, 
  admission_trans.activity, 
  admission_trans.charttime  
FROM 
  mimiciii.admission_trans, 
  mimiciii.diagnoses_icd,
  mimiciii.patients
WHERE 
  admission_trans.hadm_id = diagnoses_icd.hadm_id AND
  admission_trans.subject_id = patients.subject_id AND 
  patients.gender = 'm' AND
  diagnoses_icd.icd9_code SIMILAR TO '25000|25001|25002|25003'
  
  UNION ALL
 SELECT DISTINCT
 diabetes_icustays.subject_id,
 diabetes_icustays.hadm_id,
 diabetes_icustays.activity,
 diabetes_icustays.charttime
 FROM 
  diabetes.diabetes_icustays, 
  mimiciii.diagnoses_icd,
  mimiciii.patients
WHERE 
  diabetes_icustays.hadm_id = diagnoses_icd.hadm_id AND
  diabetes_icustays.subject_id = patients.subject_id AND 
  patients.gender = 'm' AND
  diagnoses_icd.icd9_code SIMILAR TO '25000|25001|25002|25003')
  ORDER BY subject_id, hadm_id, charttime, activity;