-- =====================================================================
-- 7-Day Rolling Conversion Rate & WoW Drop Detection
-- Description: Core analytical query to calculate rolling rates and flag drops
-- =====================================================================

WITH running_total AS (
    SELECT 
        date, 
        page,
        visits,
        conversions, 
        -- 7-day sliding window for visits (current row + preceding 6 rows)
        SUM(visits) OVER (
            PARTITION BY page 
            ORDER BY date 
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS running_visit,
        -- 7-day sliding window for conversions
        SUM(conversions) OVER (
            PARTITION BY page 
            ORDER BY date
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS running_conversions
    FROM traffic_data
),
rolling_total AS (
    SELECT 
        date,
        page,
        visits,
        conversions,
        -- Calculate current 7-day rolling conversion rate
        CAST(running_conversions AS NUMERIC) / NULLIF(running_visit, 0) AS current_rolling,
        -- Look back 7 days (7 rows) for the prior week's rolling rate
        LAG(CAST(running_conversions AS NUMERIC) / NULLIF(running_visit, 0), 7) 
            OVER (PARTITION BY page ORDER BY date) AS prev_rolling
    FROM running_total
)
SELECT 
    date,
    page,
    ROUND(current_rolling * 100, 2) AS current_rate_pct,
    ROUND(prev_rolling * 100, 2) AS prev_rate_pct,
    ROUND(((current_rolling - prev_rolling) / NULLIF(prev_rolling, 0)) * 100, 2) AS week_over_week_pct
FROM rolling_total 
WHERE 
    prev_rolling IS NOT NULL 
    AND ((current_rolling - prev_rolling) / NULLIF(prev_rolling, 0)) < -0.20;
