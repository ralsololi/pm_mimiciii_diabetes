CREATE TABLE diabetes.diabetes_outputevents AS
SELECT 
  outputevents.subject_id, 
  outputevents.hadm_id, 
  outputevents.icustay_id, 
  d_items.category, 
  d_items.label AS activity, 
  outputevents.charttime, 
  caregivers.label AS caregiver
FROM 
  mimiciii.diagnoses_icd, 
  mimiciii.d_items, 
  mimiciii.outputevents, 
  mimiciii.caregivers
WHERE 
  outputevents.hadm_id = diagnoses_icd.hadm_id AND
  outputevents.itemid = d_items.itemid AND
  caregivers.cgid = outputevents.cgid AND
  d_items.label IS NOT NULL AND
  diagnoses_icd.icd9_code BETWEEN '25000' AND '25003'
ORDER BY subject_id, hadm_id, charttime, activity;