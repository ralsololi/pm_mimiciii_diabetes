CREATE TABLE diabetes.diabetes_labevents AS
SELECT 
  labevents.subject_id, 
  labevents.hadm_id, 
  d_labitems.category, 
  d_labitems.label AS activity, 
  labevents.charttime
FROM 
  mimiciii.diagnoses_icd, 
  mimiciii.labevents, 
  mimiciii.d_labitems
WHERE 
  labevents.hadm_id = diagnoses_icd.hadm_id AND
  labevents.itemid = d_labitems.itemid AND
  d_labitems.label IS NOT NULL AND
  charttime IS NOT NULL AND
  diagnoses_icd.icd9_code BETWEEN '25000' AND '25003'
ORDER BY subject_id, hadm_id, charttime, activity;