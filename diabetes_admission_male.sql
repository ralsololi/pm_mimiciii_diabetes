CREATE TABLE diabetes.admissions_diabetes_male AS
SELECT DISTINCT
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
  diagnoses_icd.icd9_code BETWEEN '25000' AND '25003'
  ORDER BY subject_id, hadm_id, charttime, activity;