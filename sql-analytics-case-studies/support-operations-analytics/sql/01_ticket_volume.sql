SELECT
    issue_type,
    COUNT(*) AS ticket_count
FROM tickets
GROUP BY issue_type
ORDER BY ticket_count DESC;
