SELECT
    issue_type,
    COUNT(*) AS total_tickets,
    ROUND(AVG(EXTRACT(EPOCH FROM (first_response_at - created_at)) / 3600), 2) AS avg_first_response_hours,
    ROUND(AVG(EXTRACT(EPOCH FROM (resolved_at - created_at)) / 3600), 2) AS avg_resolution_hours
FROM tickets
WHERE resolved_at IS NOT NULL
GROUP BY issue_type
ORDER BY avg_resolution_hours DESC;
