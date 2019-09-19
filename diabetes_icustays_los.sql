CREATE TABLE diabetes.icustays_LOS AS
(SELECT 
  icustays.subject_id, 
  icustays.hadm_id, 
  icustays.icustay_id,
  icustays.LOS,  
  'ICU in' AS activity,
  icustays.intime AS charttime
FROM 
  mimiciii.diagnoses_icd, 
  mimiciii.icustays
WHERE 
  icustays.hadm_id = diagnoses_icd.hadm_id AND
  icustays.intime IS NOT NULL AND
  diagnoses_icd.icd9_code BETWEEN '25000' AND '25003'
UNION ALL
SELECT
  icustays.subject_id, 
  icustays.hadm_id, 
  icustays.icustay_id,
  icustays.LOS,  
  'ICU out',
  icustays.outtime
FROM 
  mimiciii.diagnoses_icd, 
  mimiciii.icustays
WHERE 
  icustays.hadm_id = diagnoses_icd.hadm_id AND
  icustays.outtime IS NOT NULL AND
  diagnoses_icd.icd9_code BETWEEN '25000' AND '25003'
ORDER BY subject_id, hadm_id, icustay_id, charttime, activity;