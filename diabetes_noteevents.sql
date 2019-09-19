CREATE TABLE diabetes.diabetes_noteevents AS
SELECT 
  noteevents.subject_id, 
  noteevents.hadm_id, 
  noteevents.category, 
  noteevents.description AS activity, 
  noteevents.charttime, 
  caregivers.label AS caregiver
FROM 
  mimiciii.diagnoses_icd, 
  mimiciii.noteevents, 
  mimiciii.caregivers
WHERE 
  noteevents.hadm_id = diagnoses_icd.hadm_id AND
  noteevents.cgid = caregivers.cgid AND
  noteevents.description IS NOT NULL AND
  charttime IS NOT NULL AND
  diagnoses_icd.icd9_code BETWEEN '2500' AND '25003'
ORDER BY subject_id, hadm_id, charttime, activity;