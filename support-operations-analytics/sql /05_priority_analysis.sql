SELECT
    priority,
    COUNT(*) AS ticket_count,
    ROUND(AVG(EXTRACT(EPOCH FROM (resolved_at - created_at)) / 3600), 2) AS avg_resolution_hours,
    ROUND(AVG(EXTRACT(EPOCH FROM (first_response_at - created_at)) / 3600), 2) AS avg_first_response_hours
FROM tickets
GROUP BY priority
ORDER BY
    CASE priority
        WHEN 'urgent' THEN 1
        WHEN 'high' THEN 2
        WHEN 'medium' THEN 3
        WHEN 'low' THEN 4
    END;
