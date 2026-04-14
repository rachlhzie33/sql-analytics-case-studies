SELECT
    issue_type,
    channel,
    COUNT(*) AS ticket_count,
    ROUND(AVG(EXTRACT(EPOCH FROM (resolved_at - created_at)) / 3600), 2) AS avg_resolution_hours,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS volume_rank,
    RANK() OVER (ORDER BY AVG(EXTRACT(EPOCH FROM (resolved_at - created_at)) / 3600) DESC) AS resolution_rank
FROM tickets
WHERE resolved_at IS NOT NULL
GROUP BY issue_type, channel
ORDER BY volume_rank, resolution_rank;
