-- using CTEs
WITH base_count AS (
	-- subquery
    SELECT
        mb.creation_year,
        COUNT(*) AS num_bases
    FROM military_bases mb
    GROUP BY mb.creation_year
),
intervention_count AS (
	-- subquery
    SELECT
        mi.start_year,
        COUNT(*) AS num_interventions
    FROM military_interventions mi
    GROUP BY mi.start_year
),
school_shooting_count AS (
	-- subquery
    SELECT
        YEAR(ss.date) AS shooting_year,
        COUNT(*) AS num_school_shootings,
        MAX(fatalities) AS max_fatalities
    FROM school_shootings ss
    GROUP BY YEAR(ss.date)
)

-- Years with many school shootings
SELECT
	'High School Shooting Year' AS "Category",
    ms.year AS "Year",
    p.president AS "President",
    ms.defense_budget AS "Defense Budget",
    ms.population AS "Population",
    COALESCE(sc.num_school_shootings, 0) AS "Number of School Shootings",
    COALESCE(sc.max_fatalities, 0) AS "Deadliest School Shooting (deaths)",
    COALESCE(bc.num_bases, 0) AS "New Military Bases",
    COALESCE(ic.num_interventions, 0) AS "Military Interventions"
FROM military_spending ms
LEFT JOIN presidents p
    ON ms.year BETWEEN YEAR(p.start_date) AND YEAR(p.end_date) - 1
LEFT JOIN base_count bc
    ON bc.creation_year = ms.year
LEFT JOIN intervention_count ic
    ON ic.start_year = ms.year
LEFT JOIN school_shooting_count sc
    ON sc.shooting_year = ms.year
-- using a WHERE clause
WHERE COALESCE(sc.num_school_shootings, 0) > 15
-- using GROUP BY
GROUP BY ms.year, p.president, ms.defense_budget, ms.population, sc.num_school_shootings, sc.max_fatalities, bc.num_bases, ic.num_interventions

-- using UNION ALL
UNION ALL

-- Years with many military interventions
SELECT
	'High Intervention Year' AS "Category",
    ms.year AS "Year",
    p.president AS "President",
    ms.defense_budget AS "Defense Budget",
    ms.population AS "Population",
    COALESCE(sc.num_school_shootings, 0) AS "Number of School Shootings",
    COALESCE(sc.max_fatalities, 0) AS "Deadliest School Shooting (deaths)",
    COALESCE(bc.num_bases, 0) AS "New Military Bases",
    COALESCE(ic.num_interventions, 0) AS "Military Interventions"
FROM military_spending ms
LEFT JOIN presidents p
    ON ms.year BETWEEN YEAR(p.start_date) AND YEAR(p.end_date) - 1
LEFT JOIN base_count bc
    ON bc.creation_year = ms.year
LEFT JOIN intervention_count ic
    ON ic.start_year = ms.year
LEFT JOIN school_shooting_count sc
    ON sc.shooting_year = ms.year
-- using a WHERE clause
WHERE COALESCE(ic.num_interventions, 0) > 5
-- using GROUP BY
GROUP BY ms.year, p.president, ms.defense_budget, ms.population, sc.num_school_shootings, sc.max_fatalities, bc.num_bases, ic.num_interventions
-- using HAVING
HAVING COUNT(ms.year) > 0

-- using ORDER BY
ORDER BY `New Military Bases` DESC
-- using LIMIT
LIMIT 20;