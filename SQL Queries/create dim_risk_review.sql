CREATE VIEW dim_risk_review AS
SELECT
    review_id, 
    review_name, 
    review_date
FROM dbo.silver_risk_review_master;


SELECT * FROM dim_risk_review;
