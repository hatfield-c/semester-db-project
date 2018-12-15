/* Gets the average salary of each employee since they began working. */
DROP VIEW view1;
CREATE VIEW view1 AS
  SELECT AVG(amount) AS "Average Salary", personal_id 
  FROM salaries 
  GROUP BY personal_id
;

/* Gets the number of interview rounds each interviewee has passed for each job description */
DROP VIEW view2;
CREATE VIEW view2 AS
  SELECT personal_id, interview_details.job_id, COUNT(*) AS num_passes
  FROM interviews 
  JOIN interview_details 
    ON interviews.interview_id = interview_details.interview_id 
  WHERE (interviews.grade >= 60) 
  GROUP BY personal_id, interview_details.job_id
;

/* Gets the number of times each type of product has been sold */
DROP VIEW view3;
CREATE VIEW view3 AS
  SELECT p_type, COUNT(*) as "Num Sold"
  FROM site_sales
  JOIN products
  ON site_sales.product_id = products.product_id
  GROUP BY p_type
;

/* Gets the cheapest cost of parts for each product */
DROP VIEW view4;
CREATE VIEW view4 AS 
  SELECT product_part_price.product_id, SUM(price_t) AS "Price of Parts" 
  FROM (
    SELECT product_parts.product_id, (price * quantity) AS price_t
    FROM (
      SELECT product_parts.part_id, MIN(vendor_parts.price) AS price
      FROM product_parts
      JOIN vendor_parts
      ON vendor_parts.part_id = product_parts.part_id
      GROUP BY product_parts.part_id
    ) cheapest_price_per_part
    JOIN product_parts
    ON cheapest_price_per_part.part_id = product_parts.part_id
  ) product_part_price
  GROUP BY product_part_price.product_id
;