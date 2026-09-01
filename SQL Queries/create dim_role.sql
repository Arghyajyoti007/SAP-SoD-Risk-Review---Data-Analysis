CREATE VIEW dim_role AS
SELECT
    role_id,
    role_name,
    role_type,
    sap_module,
    risk_indicator
FROM dbo.silver_role_master;


SELECT * FROM dim_role;
