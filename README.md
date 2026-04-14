# Support Operations Analytics with SQL

## Overview
This project analyzes fictional SaaS support ticket data to identify the main drivers of ticket volume, long resolution times, and SLA breaches.

The goal is to simulate how a support operations or product operations team might use SQL to improve support efficiency, customer experience, and workflow design.

---

## Business Problem
Support teams often deal with high ticket volume across multiple issue types, channels, and customer segments. Leadership needs to understand:

- which issue types take the longest to resolve
- where SLA breaches are happening
- which channels create the most support workload
- whether some issues should be automated, rerouted, or better documented

---

## Objectives
This analysis aims to:

- measure ticket volume across issue types
- calculate average first response and resolution time
- identify high-risk SLA categories
- compare workload by support channel
- analyze whether customer plan type affects support burden
- highlight candidates for automation or process improvement

---

## Dataset
The project uses three fictional datasets:

### `tickets.csv`
Contains ticket lifecycle and performance data such as:
- created time
- first response time
- resolved time
- issue type
- priority
- support channel
- SLA target
- CSAT score
- reopened flag

### `customers.csv`
Contains customer segmentation data:
- plan type
- region
- company size
- industry

### `agents.csv`
Contains agent and team metadata:
- team
- tenure
- location

---

## SQL Skills Demonstrated
- filtering
- grouping and aggregation
- joins
- CASE statements
- CTEs
- time-based calculations
- window functions
- business metric analysis

---

## Key Questions
1. Which issue types generate the highest ticket volume?
2. Which issue types have the longest average resolution time?
3. Which ticket categories have the highest SLA breach rates?
4. Which channels generate the most work?
5. Do customer plan types affect support complexity?
6. Which issues might be strong candidates for automation?

---

## Example Findings
Sample findings from the analysis may include:

- Integration and API-related tickets had the longest average resolution times.
- Billing and workflow automation issues showed elevated SLA breach rates.
- Chat generated fast first responses, but email cases often took longer to fully resolve.
- Enterprise customers created fewer tickets overall, but their issues were more complex and more likely to breach SLA.
- High-volume, low-complexity categories such as password resets or account setup are strong candidates for automation or self-serve documentation.

---

## Business Recommendations
Based on the analysis, a support operations team could consider:

- improving documentation for high-friction issue categories
- refining routing rules for technically complex tickets
- automating repetitive low-complexity requests
- reviewing SLA targets for categories that consistently breach
- creating proactive support content for common ticket drivers

---

## Files
- `sql/01_ticket_volume.sql` – ticket volume by issue type
- `sql/02_resolution_time.sql` – response and resolution time metrics
- `sql/03_sla_breach_analysis.sql` – SLA performance analysis
- `sql/04_channel_analysis.sql` – channel-based workload analysis
- `sql/05_priority_analysis.sql` – priority handling comparison
- `sql/06_customer_segment_analysis.sql` – customer plan comparison
- `sql/07_cte_operational_insights.sql` – combined operational insights
- `sql/08_window_function_rankings.sql` – ranking ticket drivers

---

## Tools Used
- SQL
- PostgreSQL-style syntax
- CSV datasets
- GitHub for documentation and version control

---

## Why This Project Matters
This case study demonstrates how SQL can be used not just to query data, but to generate operational insights that help teams make decisions about support workflows, customer experience, and process design.

---

## License
This project is licensed under the MIT License.

© 2026 Rachel L. Portfolio project created for analytics and systems engineering demonstration purposes.
