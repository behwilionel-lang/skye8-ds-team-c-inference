#ASSIGNMENT CHECKING
#spreads by experiment/variance
SELECT 
	a.experiment_id,
	ex.planned_split,
	a.variant,
	COUNT(*) AS observed_count
FROM public.assignmentS a
JOIN public.experiments ex ON a.experiment_id = ex.experiment_id
GROUP BY a.experiment_id, ex.planned_split, a.variant
ORDER BY a.experiment_id, a.variant;

#changes the date style and brings in the experiment's planned windows to compare against
SELECT 
	a.experiment_id,
	a.variant,
	ex.start_date,
	ex.end_date,
	(ex.end_date - ex.start_date) AS window_length_days,
	MIN(a.assigned_at::date) AS earliest_assignment,
	MAX(a.assigned_at::date) AS latest_assignment,
	(MAX(a.assigned_at::date) - MIN(a.assigned_at::date)) AS actual_spread_days
FROM public.assignments a
JOIN public.experiments ex ON a.experiment_id = ex.experiment_id
GROUP BY a.experiment_id, a.variant, ex.start_date, ex.end_date
ORDER BY a.experiment_id, a.variant;

#changes the date style and does the direct varaint-to-variant comparison
SET datestyle  = 'ISO, DMY';

WITH variant_timing AS (
	SELECT
		a.experiment_id, 
		a.variant,
		MIN(a.assigned_at::date) 	AS earliest,
		MAX(a.assigned_at::date) AS latest,
		AVG(a.assigned_at::date - ex.start_date) AS avg_days_from_start
	FROM public.assignments a
	JOIN public.experiments ex ON a.experiment_id = ex.experiment_id
	GROUP BY a.experiment_id, a.variant, ex.start_date
)
SELECT
	t.experiment_id, 
	t.variant, 
	t.earliest,
	t.latest,
	ROUND(t.avg_days_from_start, 2) AS avg_days_from_start,
	MAX(t.avg_days_from_start) OVER (PARTITION BY t.experiment_id) - 
	MIN(t.avg_days_from_start) OVER (PARTITION BY t.experiment_id) AS variant_gap_days
FROM variant_timing t
ORDER BY t.experiment_id, t.variant;

#THIS QUERIES IS FOR THE ASSIGNMENT TIMING CKECKS
	#This query finds users who have events but were not assigned.
		SELECT DISTINCT e.experiment_id, e.user_id
		FROM public.events e
		LEFT JOIN public.assignments a
			ON e.experiment_id = a.experiment_id
			AND e.user_id = a.user_id
		WHERE a.assignment_id IS NULL;
	# The result of the query is an empty table showing that the was no user with events and were never assigned.
	#This query finds users who ended up in both control and treatment groups for the same experiment.
		SELECT experiment_id, user_id, COUNT(DISTINCT variant) AS variant_count
		FROM public.assignments 
		GROUP BY experiment_id, user_id
		HAVING COUNT(DISTINCT variant) > 1;