-- Admissions
SELECT count(distinct subject_id) as patients_no, count(distinct hadm_id) as admissions_no, count(distinct activity) as activity, count(*) as rows
  FROM diabetes.admission_diabetes;

-- callout
SELECT count(distinct subject_id) as patients_no, count(distinct hadm_id) as admissions_no, count(distinct activity) as activity, count(*) as rows
  FROM diabetes.diabetes_callout;


-- chartevents
SELECT count(distinct subject_id) as patients_no, count(distinct hadm_id) as admissions_no, count(distinct activity) as activity, count(*) as rows
  FROM diabetes.chartevents_diabetes;


-- cptevents
SELECT count(distinct subject_id) as patients_no, count(distinct hadm_id) as admissions_no, count(distinct activity) as activity, count(*) as rows
  FROM diabetes.cptevents;

-- datetimeevents
SELECT count(distinct subject_id) as patients_no, count(distinct hadm_id) as admissions_no, count(distinct activity) as activity, count(*) as rows
  FROM diabetes.datetimeevents;

-- icustays
SELECT count(distinct subject_id) as patients_no, count(distinct hadm_id) as admissions_no, count(distinct activity) as activity, count(*) as rows
  FROM diabetes.diabetes_icustays;

-- inputevents_cv
SELECT count(distinct subject_id) as patients_no, count(distinct hadm_id) as admissions_no, count(distinct activity) as activity, count(*) as rows
  FROM diabetes.diabetes_inputevents_cv;

-- inputevents_mv
SELECT count(distinct subject_id) as patients_no, count(distinct hadm_id) as admissions_no, count(distinct activity) as activity, count(*) as rows
  FROM diabetes.diabetes_inputevents_mv;

-- labevents
SELECT count(distinct subject_id) as patients_no, count(distinct hadm_id) as admissions_no, count(distinct activity) as activity, count(*) as rows
  FROM diabetes.diabetes_labevents;

-- microbiologyevents
SELECT count(distinct subject_id) as patients_no, count(distinct hadm_id) as admissions_no, count(distinct activity) as activity, count(*) as rows
  FROM diabetes.diabetes_microbiologyevents;

-- noteevents
SELECT count(distinct subject_id) as patients_no, count(distinct hadm_id) as admissions_no, count(distinct activity) as activity, count(*) as rows
  FROM diabetes.diabetes_noteevents;

-- outputevents
SELECT count(distinct subject_id) as patients_no, count(distinct hadm_id) as admissions_no, count(distinct activity) as activity, count(*) as rows
  FROM diabetes.diabetes_outputevents;

-- prescriptions
SELECT count(distinct subject_id) as patients_no, count(distinct hadm_id) as admissions_no, count(distinct activity) as activity, count(*) as rows
  FROM diabetes.diabetes_prescriptions;

-- procedureevents_mv
SELECT count(distinct subject_id) as patients_no, count(distinct hadm_id) as admissions_no, count(distinct activity) as activity, count(*) as rows
  FROM diabetes.diabetes_procedureevents_mv;

-- services
SELECT count(distinct subject_id) as patients_no, count(distinct hadm_id) as admissions_no, count(distinct activity) as activity, count(*) as rows
  FROM diabetes.diabetes_services;

-- transfers
SELECT count(distinct subject_id) as patients_no, count(distinct hadm_id) as admissions_no, count(distinct activity) as activity, count(*) as rows
  FROM diabetes.diabetes_transfers;