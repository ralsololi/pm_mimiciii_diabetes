CREATE TABLE diabetes.diabetes_services AS
SELECT 
  services.subject_id, 
  services.hadm_id, 
  'services' AS category,
  services.curr_service AS activity, 
  services.transfertime AS charttime
FROM 
  mimiciii.diagnoses_icd, 
  mimiciii.services
WHERE 
  services.hadm_id = diagnoses_icd.hadm_id AND
  services.curr_service IS NOT NULL AND
  transfertime IS NOT NULL AND
  diagnoses_icd.icd9_code BETWEEN '25000' AND '25003'
ORDER BY subject_id, hadm_id, transfertime, activity;