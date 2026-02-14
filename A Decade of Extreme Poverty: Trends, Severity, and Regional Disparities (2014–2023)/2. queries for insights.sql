SELECT DISTINCT(region_name) as region, survey_year as years, sum(spr)as total_spr
FROM pip
WHERE survey_year in (
	SELECT round(survey_year)
	FROM pip
	WHERE survey_year BETWEEN 2014 and 2023
	)
GROUP by region_name, survey_year
ORDER by survey_year ASC; 

SELECT DISTINCT(region_name) as region, survey_year as years, sum(poverty_severity) as total_severity, sum(mld) as total_mld, sum(watts) as total_watts
FROM pip
WHERE survey_year in (
	SELECT round(survey_year)
	FROM pip
	WHERE survey_year BETWEEN 2014 and 2023
	)
GROUP by region_name, survey_year
ORDER by survey_year ASC;

SELECT DISTINCT(region),years, avg(average_spr) as avg_spr_per_year, avg(average_cpi) as avg_cpi_per_year
FROM (
	SELECT region_name as region, survey_year as years, sum(spr) as average_spr, sum(cpi) as average_cpi
FROM pip
WHERE survey_year in (
	SELECT round(survey_year) FROM pip WHERE survey_year BETWEEN 2014 and 2023
	)
GROUP by region_name, survey_year
ORDER by survey_year ASC )
GROUP by region, years
ORDER by years;

SELECT DISTINCT(region_name) as region, survey_year as years, sum(headcount) as total_headcount ,sum(poverty_gap) as total_gap
FROM pip
WHERE survey_year in (
	SELECT round(survey_year)
	FROM pip
	WHERE survey_year BETWEEN 2014 and 2023
	)
GROUP by region_name, survey_year
ORDER by survey_year ASC;  

SELECT DISTINCT(region_name) as region, survey_year as years, welfare_type
FROM pip
WHERE survey_year in (
	SELECT round(survey_year)
	FROM pip
	WHERE survey_year BETWEEN 2014 and 2023
	)
GROUP by region_name, survey_year
ORDER by survey_year ASC;  

SELECT
    AVG(total_spr) AS avg_yearly_spr
FROM (
    SELECT
        survey_year,
        SUM(spr) AS total_spr
    FROM pip
    WHERE survey_year BETWEEN 2014 AND 2023
    GROUP BY survey_year);

SELECT avg(spr) FROM pip
WHERE survey_year BETWEEN 2014 and 2023;

WITH yearly_avg AS (
    SELECT
        survey_year,
        AVG(spr) AS avg_spr
    FROM pip
    WHERE survey_year IN (2014, 2023)
    GROUP BY survey_year
),
pivot AS (
    SELECT
        MAX(CASE WHEN survey_year = 2014 THEN avg_spr END) AS spr_2014,
        MAX(CASE WHEN survey_year = 2023 THEN avg_spr END) AS spr_2023
    FROM yearly_avg
)
SELECT
    spr_2014,
    spr_2023,
    (spr_2023 - spr_2014) / spr_2014 * 100 AS spr_change_percent
FROM pivot;

SELECT
    region_name,
    AVG(spr) AS avg_spr
FROM pip
WHERE survey_year BETWEEN 2014 AND 2023
GROUP BY region_name
ORDER BY avg_spr DESC
LIMIT 3;

SELECT
    region_name,
    MAX(CASE WHEN survey_year = 2014 THEN spr END) AS spr_2014,
    MAX(CASE WHEN survey_year = 2023 THEN spr END) AS spr_2023,
    (MAX(CASE WHEN survey_year = 2014 THEN spr END)
     - MAX(CASE WHEN survey_year = 2023 THEN spr END)) AS spr_reduction
FROM pip
WHERE survey_year IN (2014, 2023)
GROUP BY region_name
ORDER BY spr_reduction DESC;

SELECT
    region_name,
    AVG(poverty_gap) AS avg_poverty_gap_2014_2023
FROM pip
WHERE survey_year BETWEEN 2014 AND 2023
GROUP BY region_name
ORDER BY avg_poverty_gap_2014_2023 DESC;
