--1How many rows are in the data_analyst_jobs table?1793

SELECT *
FROM data_analyst_jobs;
--1793

--2Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

SELECT *
FROM data_analyst_jobs
LIMIT 10;
-- XTO Land Data Analyst- ExxonMobil

--3How many postings are in Tennessee?21 How many are there in either Tennessee or Kentucky?27

Select company, location
FROM data_analyst_jobs
WHERE location = 'TN' OR location = 'KY';
--21--27

--4How many postings in Tennessee have a star rating above 4? 3
SELECT company, location, star_rating
FROM data_analyst_jobs
WHERE location = 'TN'
AND (star_rating > '4');
--3

--5How many postings in the dataset have a review count between 500 and 1000? 150
SELECT review_count
FROM data_analyst_jobs
WHERE review_count < '1000' AND review_count > '500';
-- 150

--6Show the average star rating for companies in each state. 
--The output should show the state as `state` and the average rating for the state as `avg_rating`. 
--Which state shows the highest average rating? NE 4.1999

SELECT location AS state, avg(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL 
GROUP BY location
ORDER BY avg(star_rating) DESC;
--NE 4.1999998090000000

--7Select unique job titles from the data_analyst_jobs table. How many are there?

SELECT DISTINCT (title)
FROM data_analyst_jobs;
-- 881 unique titles

--8How many unique job titles are there for California companies?

SELECT DISTINCT(title), location
FROM data_analyst_jobs
WHERE location = 'CA';
--230 titles

--9Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations.
--How many companies are there with more that 5000 reviews across all locations?

SELECT company, location, review_count, avg(star_rating)
FROM data_analyst_jobs
WHERE review_count > '5000'
GROUP BY company, location, review_count;
--83 companies

--10Add the code to order the query in #9 from highest to lowest average star rating.
--Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

SELECT company, location, review_count, avg(star_rating)
FROM data_analyst_jobs
WHERE review_count > '5000'
GROUP BY company, location, review_count
ORDER BY avg(star_rating) DESC;
--Nike, 4.1999998090000000

--11Find all the job titles that contain the word ‘Analyst’. 
--How many different job titles are there?

SELECT title
FROM data_analyst_jobs
WHERE title LIKE '%Analyst%';
--1636 job titles

--12How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’?
--What word do these positions have in common?

SELECT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' AND title NOT ILIKE '%Analytics%';
--4 totals with 3 different. 
--Tableau

--**BONUS:**
--You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 
-- - Disregard any postings where the domain is NULL. 
-- - Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 
--  - Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?

SELECT skill, domain, days_since_posting
FROM data_analyst_jobs
WHERE skill LIKE '%SQL%'
AND days_since_posting > 21
AND domain IS NOT NULL
ORDER BY days_since_posting DESC;
--"Consulting and Business Services"
--"Restaurants, Travel and Leisure"
--"Banks and Financial Services"
--403 jobs


