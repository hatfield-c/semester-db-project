select * from view1;
select * from view2;
select * from view3;
select * from view4;

/* Gets the ID and name of interviewers for interviewee Hellen Cole and job 11111 */
SELECT found_interviewers.personal_id, (fname || ' ' || lname) AS "Name"
FROM (
  SELECT personal_id
  FROM (
    SELECT interview_id
    FROM interview_details
    JOIN people
    ON interview_details.personal_id = people.personal_id 
      AND (people.fname || ' ' || people.lname) = 'Hellen Cole' AND interview_details.job_id = 11111
  ) found_interviews
  JOIN interviewers
  ON interviewers.interview_id = found_interviews.interview_id
) found_interviewers
JOIN people
ON people.personal_id = found_interviewers.personal_id;

/* Finds all jobs posted by the Marketing department in January, 2011 */
SELECT jobs.job_id
FROM jobs
JOIN (
  SELECT dept_id
  FROM department
  WHERE dept_name = 'Marketing'
) found_departments
ON found_departments.dept_id = jobs.dept_id
  AND jobs.posted >= '01-JAN-11'
  AND jobs.posted <= '31-JAN-11'
;

/* Finds all employees who don't supervise anyone */
SELECT personal_id, fname, lname
FROM(
  SELECT employee.personal_id AS entry_id
  FROM employee
  MINUS
  SELECT UNIQUE manages.manager_id
  FROM manages
) entry_level_emp
JOIN people
ON people.personal_id = entry_level_emp.entry_id
;

/* Returns the id and location of sites which made no sales during March, 2011 */
SELECT sites.site_id, sites.site_location
FROM (
  SELECT site_id
  FROM sites
  MINUS
  SELECT site_id 
  FROM site_sales
  WHERE sale_time >= '01-MAR-2011'
    AND sale_time <= '31-MAR-2011'
) no_sales
JOIN sites
ON sites.site_id = no_sales.site_id
;

/* Returns the job id and description of a job which hasn't hired anyone one month
   after it was posted */
SELECT jobs.job_id, jobs.description
FROM (
  SELECT jobs.job_id
  FROM jobs
  MINUS
  SELECT total_job_passes.job_id
  FROM (
    SELECT view2.personal_id, view2.job_id, jobs.posted
    FROM view2
    JOIN jobs
    ON jobs.job_id = view2.job_id
      AND num_passes >= 5
  ) total_job_passes
  JOIN (
    SELECT interview_details.personal_id, 
      interview_details.job_id, 
      MAX(interviews.interview_time) AS last_interview
    FROM interviews 
    JOIN interview_details 
    ON interviews.interview_id = interview_details.interview_id
    GROUP BY interview_details.personal_id, interview_details.job_id
  ) interview_data
  ON interview_data.personal_id = total_job_passes.personal_id
    AND interview_data.job_id = total_job_passes.job_id
    AND (interview_data.last_interview - total_job_passes.posted) <= 30
) no_passes
JOIN jobs
ON jobs.job_id = no_passes.job_id
;

/* Gets the id and name of salesman who have sold any product type
with a price above $200 */
SELECT people.personal_id, people.fname, people.lname
FROM (
  SELECT UNIQUE site_sales.salesmen_id as personal_id
  FROM site_sales
  JOIN products
  ON products.product_id = site_sales.product_id
    AND products.price > 200
) best_salesman
JOIN people
ON people.personal_id = best_salesman.personal_id
;

/* Returns the ID and name of the department which has no job posts
   between Jan-Feb 2011 */
SELECT UNIQUE department.dept_id, department.dept_name
FROM (
  SELECT department.dept_id, department.dept_name
  FROM department
  JOIN jobs
  ON jobs.dept_id = department.dept_id
    AND NOT (jobs.posted >= '01-Jan-11' AND jobs.posted <= '28-Feb-11')
) no_postings
JOIN department
ON department.dept_id = no_postings.dept_id
;

/* Returns the id, name, and department id of the existing employees who apply
   for job with id=12345 */
SELECT people.personal_id, 
  people.fname, 
  people.lname, 
  applied_employees.dept_id
FROM (
  SELECT UNIQUE interview_details.personal_id, employee.dept_id
  FROM interview_details
  JOIN employee
  ON employee.personal_id = interview_details.personal_id
    AND interview_details.job_id = 12345
) applied_employees
JOIN people
ON people.personal_id = applied_employees.personal_id
;

/* Returns the type of item sold the most */
SELECT products.p_type, best_seller.num_sold
FROM (
  SELECT product_id, MAX(num_count) AS num_sold 
  FROM (
    SELECT site_sales.product_id, COUNT(*) AS num_count
    FROM site_sales
    GROUP BY site_sales.product_id
  )
  GROUP BY product_id
) best_seller
JOIN products
ON products.product_id = best_seller.product_id