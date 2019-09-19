CREATE TABLE diabetes.cptevents AS
SELECT DISTINCT
  cptevents.subject_id, 
  cptevents.hadm_id, 
  cptevents.sectionheader, 
  cptevents.subsectionheader,
  cptevents.chartdate
FROM 
  mimiciii.cptevents, 
  mimiciii.diagnoses_icd
WHERE 
  cptevents.hadm_id = diagnoses_icd.hadm_id AND
  cptevents.chartdate IS NOT NULL AND
  subsectionheader IS NOT NULL AND
  diagnoses_icd.icd9_code BETWEEN '25000' AND '25003';