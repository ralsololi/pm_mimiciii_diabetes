CREATE TABLE diabetes.Q_type_1_ED AS
(SELECT DISTINCT
  admissions.subject_id, 
  admissions.hadm_id, 
  'ED registration' AS activity,
  admissions.edregtime AS charttime
FROM 
   mimiciii.admissions,
   mimiciii.diagnoses_icd
WHERE 
  admissions.hadm_id = diagnoses_icd.hadm_id AND
  diagnoses_icd.icd9_code SIMILAR TO '25001|25003'
  AND edregtime IS NOT NULL
 
UNION ALL
SELECT DISTINCT
  admissions.subject_id, 
  admissions.hadm_id, 
  'ED out',
  admissions.edouttime
FROM 
  mimiciii.admissions,
   mimiciii.diagnoses_icd
WHERE 
  admissions.hadm_id = diagnoses_icd.hadm_id AND
  diagnoses_icd.icd9_code SIMILAR TO '25001|25003'
  AND edouttime IS NOT NULL)
  
ORDER BY subject_id, hadm_id, charttime, activity;