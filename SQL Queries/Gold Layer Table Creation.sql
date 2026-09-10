-- fact_sod_conflict Creation
CREATE TABLE fact_sod_conflict AS
SELECT
    assesment_id as assessment_record_id,
    review_id,
    user_id,
    risk_id,
    system_id,
    conflict_detection_date
FROM dbo.silver_sod_risk_assessment;

select * from dbo.fact_sod_conflict
limit 10;

-- Create the bridge table
CREATE TABLE bridge_conflict_role AS
SELECT 
    f.assessment_record_id,
    r.role_key
FROM dbo.fact_sod_conflict f
JOIN dbo.silver_role_conflict_assignment r
    ON f.assessment_record_id = r.assessment_record_id;  
-- Checks 
SELECT COUNT(*) AS bridge_rows
FROM dbo.bridge_conflict_role;

-- Create Dim Table
-- dim_risk Creation
CREATE TABLE dim_risk AS
SELECT
    risk_id,
    risk_name,
    risk_level,
    business_process,
    function_1,
    function_2
FROM dbo.silver_risk_master;

SELECT * FROM dim_risk;

-- dim_risk_review Creation
CREATE TABLE dim_risk_review AS
SELECT
    review_id, 
    review_name, 
    review_date
FROM dbo.silver_risk_review_master;


SELECT * FROM dim_risk_review;


-- dim_role Creation
CREATE TABLE dim_role AS
SELECT
    role_id,
    role_name,
    role_type,
    sap_module,
    risk_indicator
FROM dbo.silver_role_master;


SELECT * FROM dim_role;

-- dim_system Creation
CREATE TABLE dim_system AS
SELECT
    system_id,
    system_name
FROM dbo.silver_system_master;

SELECT * FROM dim_system;

-- dim_user Creation
CREATE TABLE dim_user AS
SELECT
    user_id,
	user_name,
	business_unit,
	department,
	region,
	active_status
FROM dbo.silver_user_master;


SELECT * FROM dim_user;
