CREATE TABLE diabetes.procedureevents_mv AS
SELECT 
  procedureevents_mv.subject_id, 
  procedureevents_mv.hadm_id, 
  procedureevents_mv.icustay_id, 
  d_items.category, 
  d_items.label AS activity, 
  procedureevents_mv.starttime, 
  procedureevents_mv.endtime, 
  caregivers.label AS caregiver
FROM 
  mimiciii.diagnoses_icd, 
  mimiciii.d_items, 
  mimiciii.caregivers, 
  mimiciii.procedureevents_mv
WHERE 
  procedureevents_mv.hadm_id = diagnoses_icd.hadm_id AND
  procedureevents_mv.itemid = d_items.itemid AND
  procedureevents_mv.cgid = caregivers.cgid AND
  d_items.label IS NOT NULL AND
  starttime IS NOT NULL AND
  diagnoses_icd.icd9_code LIKE '250%'
ORDER BY subject_id, hadm_id, starttime, activity;