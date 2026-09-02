# per-experiment count by variant
SELECT experiment_id, variant, count(*) AS variant_count
FROM public.assignments
GROUP BY experiment_id, variant
ORDER BY experiment_id, variant;

# daily conversation by variant
SELECT
	e.experiment_id,
	e.event_date,
	a.variant,
	COUNT(*) AS n_events,
	SUM(CASE WHEN e.converted THEN 1 ELSE 0 END) AS n_converted,
	ROUND(
		SUM(CASE WHEN e.converted THEN 1 ELSE 0 END)::numeric / COUNT(*), 4) AS conversion_rate
FROM public.events e
JOIN public.assignments a
	ON e.experiment_id = a.experiment_id
	AND e.user_id = a.user_id
GROUP BY e.experiment_id, e.event_date, a.variant
ORDER BY e.experiment_id, e.event_date, a.variant

# Revenue distribution summaries
SELECT 
	e.experiment_id,
	a.variant,
	COUNT(DISTINCT e.user_id) AS variant_count,
	SUM(e.revenue_xaf) AS total_revenue,
	ROUND(AVG(e.revenue_xaf), 2) AS avg_revenue_per_event,
	ROUND(
		SUM(e.revenue_xaf)::numeric / COUNT(DISTINCT e.user_id), 2) AS avg_revenue_per_user
FROM public.events e
JOIN public.assignments a
	ON e.experiment_id = a.experiment_id
	AND e.user_id = a.user_id
GROUP BY e.experiment_id, a.variant
ORDER BY e.experiment_id, a.variant
	
# segment breakdown
SELECT 
	a.experiment_id,
	a.variant,
	u.device,
	COUNT(DISTINCT a.user_id) AS variant_count,
	SUM(e.revenue_xaf) AS total_revenue,
	ROUND(
		SUM(CASE WHEN e.converted THEN 1 ELSE 0 END)::numeric / COUNT(*), 4) AS conversio_rate
FROM public.assignments a
JOIN public.users u
	ON a.user_id = u.user_id
JOIN public.events e
	ON e.experiment_id = a.experiment_id
	AND e.user_id = a.user_id
GROUP BY a.experiment_id, a.variant, u.device
ORDER BY a.experiment_id, a.variant, u.device

