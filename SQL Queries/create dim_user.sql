CREATE VIEW dim_user AS
SELECT
    user_id,
	user_name,
	business_unit,
	department,
	region,
	active_status
FROM dbo.silver_user_master;


SELECT * FROM dim_user;
