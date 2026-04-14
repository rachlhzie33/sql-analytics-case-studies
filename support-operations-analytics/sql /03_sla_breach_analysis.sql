SELECT
    issue_type,
    COUNT(*) AS total_tickets,
    SUM(
        CASE
            WHEN EXTRACT(EPOCH FROM (resolved_at - created_at)) / 3600 > sla_target_hours THEN 1
            ELSE 0
        END
    ) AS breached_tickets,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN EXTRACT(EPOCH FROM (resolved_at - created_at)) / 3600 > sla_target_hours THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS sla_breach_rate_pct
FROM tickets
WHERE resolved_at IS NOT NULL
GROUP BY issue_type
ORDER BY sla_breach_rate_pct DESC, total_tickets DESC;
