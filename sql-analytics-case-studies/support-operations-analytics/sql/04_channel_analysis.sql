SELECT
    channel,
    COUNT(*) AS ticket_count,
    ROUND(AVG(EXTRACT(EPOCH FROM (resolved_at - created_at)) / 3600), 2) AS avg_resolution_hours,
    ROUND(AVG(csat_score), 2) AS avg_csat
FROM tickets
WHERE resolved_at IS NOT NULL
GROUP BY channel
ORDER BY ticket_count DESC;
