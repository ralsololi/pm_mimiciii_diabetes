CREATE TABLE diabetes.callout_trans AS
(SELECT 
  callout.subject_id, 
  callout.hadm_id, 
  'create callout' AS activity,
  callout.createtime AS charttime
FROM
  mimiciii.callout
WHERE 
  createtime IS NOT NULL
UNION ALL
SELECT 
  callout.subject_id, 
  callout.hadm_id, 
  'update callout',
  callout.updatetime
FROM
  mimiciii.callout
WHERE 
  updatetime IS NOT NULL
UNION ALL
SELECT 
  callout.subject_id, 
  callout.hadm_id, 
  'acknowledge callout',
  callout.acknowledgetime
FROM
  mimiciii.callout
WHERE 
  acknowledgetime IS NOT NULL
UNION ALL
SELECT 
  callout.subject_id, 
  callout.hadm_id, 
  'outcome callout',
  callout.outcometime
FROM
  mimiciii.callout
WHERE 
  outcometime IS NOT NULL
UNION ALL
SELECT 
  callout.subject_id, 
  callout.hadm_id, 
  'first reservation',
  callout.firstreservationtime
FROM
  mimiciii.callout
WHERE 
  firstreservationtime IS NOT NULL
UNION ALL
SELECT 
  callout.subject_id, 
  callout.hadm_id, 
  'current reservation',
  callout.currentreservationtime
FROM 
  mimiciii.callout
WHERE 
  currentreservationtime IS NOT NULL)
ORDER BY subject_id, hadm_id, charttime, activity;
