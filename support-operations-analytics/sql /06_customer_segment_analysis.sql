SELECT
    c.plan_type,
    t.issue_type,
    COUNT(*) AS ticket_count,
    ROUND(AVG(EXTRACT(EPOCH FROM (t.resolved_at - t.created_at)) / 3600), 2) AS avg_resolution_hours,
    ROUND(AVG(t.csat_score), 2) AS avg_csat
FROM tickets t
JOIN customers c
    ON t.customer_id = c.customer_id
WHERE t.resolved_at IS NOT NULL
GROUP BY c.plan_type, t.issue_type
ORDER BY c.plan_type, ticket_count DESC;
