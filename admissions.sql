CREATE TABLE diabetes.admissions AS
SELECT DISTINCT
  admission_trans.subject_id, 
  admission_trans.hadm_id, 
  admission_trans.activity, 
  admission_trans.charttime
FROM 
  mimiciii.admission_trans, 
  mimiciii.diagnoses_icd
WHERE 
  admission_trans.hadm_id = diagnoses_icd.hadm_id AND
  diagnoses_icd.icd9_code LIKE  '250%'
  ORDER BY subject_id, hadm_id, charttime, activity;