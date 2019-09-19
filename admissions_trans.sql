CREATE TABLE diabetes.admission_diabetes AS
(SELECT DISTINCT
  admissions.subject_id, 
  admissions.hadm_id, 
  'admission' AS activity,
  admissions.admittime AS charttime
FROM 
   mimiciii.admissions,
   mimiciii.diagnoses_icd
WHERE 
  admissions.hadm_id = diagnoses_icd.hadm_id AND
  diagnoses_icd.icd9_code LIKE '250%'
  AND admittime IS NOT NULL
 
UNION ALL
SELECT DISTINCT
  admissions.subject_id, 
  admissions.hadm_id, 
  'discharge',
  admissions.dischtime
FROM 
  mimiciii.admissions,
   mimiciii.diagnoses_icd
WHERE 
  admissions.hadm_id = diagnoses_icd.hadm_id AND
  diagnoses_icd.icd9_code LIKE '250%'
  AND dischtime IS NOT NULL

UNION ALL
SELECT DISTINCT
  admissions.subject_id, 
  admissions.hadm_id, 
  'death',
  admissions.deathtime
FROM 
  mimiciii.admissions,
   mimiciii.diagnoses_icd
WHERE 
  admissions.hadm_id = diagnoses_icd.hadm_id AND
  diagnoses_icd.icd9_code LIKE '250%'
  AND deathtime IS NOT NULL
 
UNION ALL
SELECT DISTINCT
  admissions.subject_id, 
  admissions.hadm_id, 
  'ED registration',
  admissions.edregtime
 FROM 
  mimiciii.admissions,
   mimiciii.diagnoses_icd
WHERE 
  admissions.hadm_id = diagnoses_icd.hadm_id AND
  diagnoses_icd.icd9_code LIKE '250%'
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
  diagnoses_icd.icd9_code LIKE '250%'
  AND edouttime IS NOT NULL)
  
ORDER BY subject_id, hadm_id, charttime, activity;