WITH ticket_metrics AS (
    SELECT
        ticket_id,
        issue_type,
        channel,
        priority,
        EXTRACT(EPOCH FROM (resolved_at - created_at)) / 3600 AS resolution_hours,
        CASE
            WHEN EXTRACT(EPOCH FROM (resolved_at - created_at)) / 3600 > sla_target_hours THEN 1
            ELSE 0
        END AS sla_breached,
        reopened_flag,
        csat_score
    FROM tickets
    WHERE resolved_at IS NOT NULL
)

SELECT
    issue_type,
    COUNT(*) AS ticket_count,
    ROUND(AVG(resolution_hours), 2) AS avg_resolution_hours,
    ROUND(100.0 * AVG(sla_breached), 2) AS sla_breach_rate_pct,
    ROUND(100.0 * AVG(CASE WHEN reopened_flag THEN 1 ELSE 0 END), 2) AS reopen_rate_pct,
    ROUND(AVG(csat_score), 2) AS avg_csat
FROM ticket_metrics
GROUP BY issue_type
HAVING COUNT(*) >= 1
ORDER BY avg_resolution_hours DESC;
