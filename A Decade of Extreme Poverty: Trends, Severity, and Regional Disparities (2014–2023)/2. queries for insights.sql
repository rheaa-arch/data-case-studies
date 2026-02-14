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
