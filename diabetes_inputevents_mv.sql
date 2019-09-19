CREATE TABLE diabetes.diabetes_inputevents_mv AS
SELECT 
  inputevents_mv.subject_id, 
  inputevents_mv.hadm_id, 
  inputevents_mv.icustay_id, 
  d_items.category, 
  d_items.label AS activity, 
  inputevents_mv.starttime, 
  inputevents_mv.endtime, 
  caregivers.label AS caregiver
FROM 
  mimiciii.inputevents_mv, 
  mimiciii.diagnoses_icd, 
  mimiciii.d_items, 
  mimiciii.caregivers
WHERE 
  inputevents_mv.hadm_id = diagnoses_icd.hadm_id AND
  inputevents_mv.itemid = d_items.itemid AND
  inputevents_mv.cgid = caregivers.cgid AND
  starttime IS NOT NULL AND
  d_items.label IS NOT NULL AND
  diagnoses_icd.icd9_code BETWEEN '25000' AND '25003'
ORDER BY subject_id, hadm_id, starttime, activity;