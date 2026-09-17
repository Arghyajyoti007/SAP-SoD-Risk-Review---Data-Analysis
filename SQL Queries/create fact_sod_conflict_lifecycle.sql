CREATE OR REPLACE TABLE fact_sod_conflict_lifecycle AS

WITH conflict_years AS
(
    SELECT DISTINCT
        f.user_id,
        f.risk_id,
        f.system_id,
        YEAR(r.review_date) AS review_year
    FROM dbo.fact_sod_conflict f
    INNER JOIN dbo.dim_risk_review r
        ON f.review_id = r.review_id
),

conflict_history AS
(
    SELECT
        user_id,
        risk_id,
        system_id,
        MIN(review_year) AS first_seen_year,
        MAX(review_year) AS last_seen_year,
        COUNT(DISTINCT review_year) AS review_count
    FROM conflict_years
    GROUP BY
        user_id,
        risk_id,
        system_id
),

annual_status AS
(
    SELECT
        c.user_id,
        c.risk_id,
        c.system_id,
        c.review_year,
        h.first_seen_year,
        h.last_seen_year,
        h.review_count,

        CASE
            WHEN c.review_year = h.first_seen_year
                THEN 'New'

            WHEN EXISTS
            (
                SELECT 1
                FROM conflict_years p
                WHERE p.user_id = c.user_id
                  AND p.risk_id = c.risk_id
                  AND p.system_id = c.system_id
                  AND p.review_year = c.review_year - 1
            )
                THEN 'Persistent'

            ELSE 'New'
        END AS lifecycle_status

    FROM conflict_years c
    INNER JOIN conflict_history h
        ON c.user_id = h.user_id
        AND c.risk_id = h.risk_id
        AND c.system_id = h.system_id
),

resolved_events AS
(
    SELECT
        p.user_id,
        p.risk_id,
        p.system_id,
        p.review_year AS review_year,
        h.first_seen_year,
        h.last_seen_year,
        h.review_count,
        'Resolved' AS lifecycle_status

    FROM conflict_years p

    INNER JOIN conflict_history h
        ON p.user_id = h.user_id
        AND p.risk_id = h.risk_id
        AND p.system_id = h.system_id

    WHERE NOT EXISTS
    (
        SELECT 1
        FROM conflict_years c
        WHERE c.user_id = p.user_id
          AND c.risk_id = p.risk_id
          AND c.system_id = p.system_id
          AND c.review_year = p.review_year + 1
    )
)

SELECT *
FROM annual_status

UNION ALL

SELECT *
FROM resolved_events;
