CREATE VIEW dim_system AS
SELECT
    system_id,
    system_name
FROM dbo.silver_system_master;

SELECT * FROM dim_system;
