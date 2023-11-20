USE ironhack_mid;

-- Creat a new CENSUS table that connects all the tables via the common key 'ced_id'

CREATE TABLE census AS
SELECT *
FROM census_pop
JOIN (census_inc JOIN census_edu USING(ced_id)) USING(ced_id)
JOIN census_wk USING(ced_id)
JOIN census_rel USING(ced_id);

SELECT * FROM census;

-- Creat a new COMPLETE table that connects all the tables via the electoral names

CREATE TABLE complete AS
SELECT * FROM census
JOIN (division JOIN referendum USING(electoral)) USING(ced_id);

SELECT * FROM complete;

-- Top 10 of areas that voted YES and their respective indigenous population %

SELECT total_p, indigenous_p, birth_aus, birth_oth, electoral, state, total_votes,
		(yes_votes / (yes_votes + no_votes)) * 100 AS yes_percent,
		(indigenous_p / total_p) * 100 AS indigenous_percent,
		(birth_aus / (birth_aus + birth_oth)) * 100 AS born_aus_percent
FROM complete
ORDER BY yes_percent DESC
LIMIT 10;


-- Top 10 of areas that voted NO and their respective indigenous population %

SELECT total_p, indigenous_p, birth_aus, birth_oth, electoral, state, total_votes,
       (no_votes / (yes_votes + no_votes)) * 100 AS no_percent,
       (indigenous_p / total_p) * 100 AS indigenous_percent,
		(birth_aus / (birth_aus + birth_oth)) * 100 AS born_aus_percent
FROM complete
ORDER BY no_percent DESC
LIMIT 10;

-- Top 10 of areas with highest indigenous population that voted yes

SELECT total_p, indigenous_p, birth_aus, birth_oth, electoral, state, total_votes,
       (yes_votes / (yes_votes + no_votes)) * 100 AS yes_percent,
       (indigenous_p / total_p) * 100 AS indigenous_percent
FROM complete
ORDER BY indigenous_percent DESC
LIMIT 10;


-- How states voted by percentage

SELECT 
    state,
    SUM(total_p) AS total_p_sum,
    SUM(indigenous_p) AS indigenous_p_sum,
    SUM(birth_aus) AS birth_aus_sum,
    SUM(birth_oth) AS birth_oth_sum,
    SUM(total_votes) AS total_votes_sum,
    SUM(no_votes) AS no_votes_sum,
	(SUM(yes_votes) / (SUM(yes_votes) + SUM(no_votes))) * 100 AS yes_percent,
    (SUM(no_votes) / (SUM(yes_votes) + SUM(no_votes))) * 100 AS no_percent,
    (SUM(indigenous_p) / SUM(total_p)) * 100 AS indigenous_percent,
    (SUM(birth_aus) / (SUM(birth_aus) + SUM(birth_oth))) * 100 AS born_aus_percent
FROM complete
GROUP BY state
ORDER BY no_percent DESC;


-- Top 10 highest median monthly income by electoral areas

SELECT total_p, indigenous_p, median_income_mtly, electoral, state, total_votes,
		(yes_votes / (yes_votes + no_votes)) * 100 AS yes_percent,
		(indigenous_p / total_p) * 100 AS indigenous_percent
FROM complete
ORDER BY median_income_mtly DESC
LIMIT 10;


-- Top 10 lowest median monthly income by electoral areas

SELECT total_p, indigenous_p, median_income_mtly, electoral, state, total_votes,
		(yes_votes / (yes_votes + no_votes)) * 100 AS yes_percent,
		(indigenous_p / total_p) * 100 AS indigenous_percent
FROM complete
ORDER BY median_income_mtly ASC
LIMIT 10;

-- Top 10 electoral areas with a Bachelor's degree

SELECT total_p, indigenous_p, median_income_mtly, electoral, state, total_votes,
		(edu_tertiary / (age_20_34 + age_35_54)) * 100 AS tertiary_percent,
		(edu_adv_diploma / (age_20_34 + age_35_54)) * 100 AS advdiploma_percent,
		(edu_bachelors / (age_20_34 + age_35_54)) * 100 AS bachelors_percent,
		(edu_postgrad / (age_20_34 + age_35_54)) * 100 AS postgrad_percent,
        (yes_votes / (yes_votes + no_votes)) * 100 AS yes_percent,
		(indigenous_p / total_p) * 100 AS indigenous_percent
FROM complete
ORDER BY bachelors_percent DESC
LIMIT 10;

-- Top 10 electoral areas with a majority born overseas

SELECT total_p, aus_citizen, electoral, state, total_votes,
		(birth_oth / (birth_oth + birth_aus)) * 100 AS born_os_percent,
		(aus_citizen / (birth_oth + birth_aus)) * 100 AS aus_citizen_percent,
        (yes_votes / (yes_votes + no_votes)) * 100 AS yes_percent,
		(indigenous_p / total_p) * 100 AS indigenous_percent
FROM complete
ORDER BY born_os_percent DESC
LIMIT 10;

