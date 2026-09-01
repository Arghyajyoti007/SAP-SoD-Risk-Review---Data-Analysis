CREATE VIEW dim_risk AS
SELECT
    risk_id,
    risk_name,
    risk_level,
    business_process,
    function_1,
    function_2
FROM dbo.silver_risk_master;

SELECT * FROM dim_risk;
