CREATE TABLE diabetes.diabetes_prescriptions AS
SELECT 
  prescriptions.subject_id, 
  prescriptions.hadm_id, 
  prescriptions.icustay_id, 
  prescriptions.drug_type AS category, 
  prescriptions.drug AS activity, 
  prescriptions.startdate, 
  prescriptions.enddate
FROM 
  mimiciii.diagnoses_icd, 
  mimiciii.prescriptions
WHERE 
  prescriptions.hadm_id = diagnoses_icd.hadm_id AND
  prescriptions.drug IS NOT NULL AND
  prescriptions.startdate IS NOT NULL AND
  diagnoses_icd.icd9_code BETWEEN '25000' AND '25003'
ORDER BY subject_id, hadm_id, startdate, activity;