DROP TABLE department CASCADE CONSTRAINTS;
CREATE TABLE department(
  dept_id NUMBER(9) NOT NULL,
  dept_name VARCHAR(255) NOT NULL,
  PRIMARY KEY(dept_id)
);

DROP TABLE people CASCADE CONSTRAINTS;
CREATE TABLE people (
  personal_id NUMBER(9) NOT NULL,
  lname VARCHAR(60) NOT NULL,
  fname VARCHAR(30) NOT NULL,
  age NUMBER(2) NOT NULL,
  gender VARCHAR(1) NOT NULL,
  address_line1 VARCHAR(255),
  address_line2 VARCHAR(80),
  city VARCHAR(60),
  st VARCHAR(2),
  zip NUMBER(5),
  PRIMARY KEY(personal_id),
  CONSTRAINT age CHECK (17 < age AND age < 65)
);

DROP TABLE phone CASCADE CONSTRAINTS;
CREATE TABLE phone (
  personal_id NUMBER(9) NOT NULL,
  phone NUMBER(10) NOT NULL,
  PRIMARY KEY (personal_id),
  FOREIGN KEY (personal_id) REFERENCES people(personal_id)
);

DROP TABLE customer CASCADE CONSTRAINTS;
CREATE TABLE customer (
  personal_id NUMBER(9) NOT NULL,
  sales_rep NUMBER(9) NOT NULL,
  PRIMARY KEY (personal_id),
  FOREIGN KEY (personal_id) REFERENCES people(personal_id),
  FOREIGN KEY (sales_rep) REFERENCES people(personal_id)
);

DROP TABLE employee CASCADE CONSTRAINTS;
CREATE TABLE employee(
  personal_id NUMBER(9) NOT NULL,
  dept_id NUMBER(9) NOT NULL,
  title VARCHAR(30) NOT NULL,
  rank number(1) NOT NULL,
  PRIMARY KEY (personal_id),
  FOREIGN KEY (personal_id) REFERENCES people(personal_id),
  FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

DROP TABLE manages CASCADE CONSTRAINTS;
CREATE TABLE manages (
  personal_id NUMBER(9) NOT NULL,
  manager_id number(9) NOT NULL,
  PRIMARY KEY (personal_id),
  FOREIGN KEY (personal_id) REFERENCES people(personal_id),
  FOREIGN KEY (manager_id) REFERENCES people(personal_id)
);

DROP TABLE shifts CASCADE CONSTRAINTS;
CREATE TABLE shifts(
  personal_id NUMBER(9) NOT NULL,
  start_time DATE NOT NULL,
  end_time DATE NOT NULL,
  dept_id NUMBER(9),
  FOREIGN KEY (personal_id) REFERENCES people(personal_id),
  FOREIGN KEY (dept_id) REFERENCES department(dept_id),
  CONSTRAINT shifts_pk PRIMARY KEY (personal_id, start_time)
);

DROP TABLE jobs CASCADE CONSTRAINTS;
CREATE TABLE jobs (
  job_id NUMBER(9) NOT NULL,
  description VARCHAR(255) NOT NULL,
  posted DATE NOT NULL,
  dept_id NUMBER(9),
  PRIMARY KEY (job_id),
  FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

DROP TABLE interviews CASCADE CONSTRAINTS;
CREATE TABLE interviews (
  interview_id NUMBER(9) NOT NULL,
  interview_time DATE NOT NULL,
  grade NUMBER(3) NOT NULL,
  PRIMARY KEY (interview_id),
  CONSTRAINT grade CHECK (0 <= grade AND grade <= 100)
);

DROP TABLE interview_details CASCADE CONSTRAINTS;
CREATE TABLE interview_details(
  interview_id NUMBER(9) NOT NULL,
  job_id NUMBER(9) NOT NULL,
  personal_id NUMBER(9) NOT NULL,
  PRIMARY KEY (interview_id),
  FOREIGN KEY (interview_id) REFERENCES interviews(interview_id),
  FOREIGN KEY (job_id) REFERENCES jobs(job_id),
  FOREIGN KEY (personal_id) REFERENCES people(personal_id)
);

DROP TABLE interviewers CASCADE CONSTRAINTS;
CREATE TABLE interviewers(
  interview_id NUMBER(9) NOT NULL,
  personal_id NUMBER(9) NOT NULL,
  FOREIGN KEY (interview_id) REFERENCES interviews(interview_id),
  FOREIGN KEY (personal_id) REFERENCES people(personal_id),
  CONSTRAINT interviews_pk PRIMARY KEY (interview_id, personal_id)
);

DROP TABLE products CASCADE CONSTRAINTS;
CREATE TABLE products(
  product_id NUMBER(9) NOT NULL,
  p_type VARCHAR(20) NOT NULL,
  p_size VARCHAR(3),
  price FLOAT NOT NULL,
  weight FLOAT NOT NULL,
  styling VARCHAR(20),
  PRIMARY KEY (product_id)
);

DROP TABLE sites CASCADE CONSTRAINTS;
CREATE TABLE sites (
  site_id NUMBER(9) NOT NULL,
  site_name VARCHAR(30) NOT NULL,
  site_location VARCHAR(30) NOT NULL,
  PRIMARY KEY (site_id)
);

DROP TABLE site_sales CASCADE CONSTRAINTS;
CREATE TABLE site_sales (
  salesmen_id NUMBER(9) NOT NULL,
  customer_id NUMBER(9) NOT NULL,
  site_id NUMBER(9) NOT NULL,
  sale_time DATE NOT NULL, 
  product_id NUMBER(9) NOT NULL,
  FOREIGN KEY(salesmen_id) REFERENCES people(personal_id),
  FOREIGN KEY (customer_id) REFERENCES people (personal_id),
  FOREIGN KEY (site_id) REFERENCES sites(site_id),
  CONSTRAINT site_sales_pk PRIMARY KEY (salesmen_id, customer_id, site_id, sale_time)
);

DROP TABLE site_workers CASCADE CONSTRAINTS;
CREATE TABLE site_workers (
  site_id NUMBER(9) NOT NULL,
  worker_id NUMBER(9) NOT NULL,
  FOREIGN KEY (site_id) REFERENCES sites(site_id),
  FOREIGN KEY (worker_id) REFERENCES people(personal_id),
  CONSTRAINT site_workers_pk PRIMARY KEY (site_id, worker_id)
);

DROP TABLE vendors CASCADE CONSTRAINTS;
CREATE TABLE vendors (
  vendor_id NUMBER(9) NOT NULL,
  vname VARCHAR(30) NOT NULL,
  addr VARCHAR(90) NOT NULL,
  account_number NUMBER(9),
  credit NUMBER(4),
  purchase_url VARCHAR(255),
  PRIMARY KEY (vendor_id)
);

DROP TABLE parts CASCADE CONSTRAINTS;
CREATE TABLE parts(
  part_id NUMBER(9) NOT NULL,
  PRIMARY KEY(part_id)
);

DROP TABLE vendor_parts CASCADE CONSTRAINTS;
CREATE TABLE vendor_parts(
	vendor_id NUMBER(9) NOT NULL,
	part_id NUMBER(9) NOT NULL,
	price FLOAT NOT NULL,
  FOREIGN KEY(vendor_id) REFERENCES vendors(vendor_id),
  FOREIGN KEY(part_id) REFERENCES parts(part_id),
  CONSTRAINT vendor_parts_pk PRIMARY KEY (vendor_id, part_id)
);

DROP TABLE product_parts CASCADE CONSTRAINTS;
CREATE TABLE product_parts(
product_id NUMBER(9) NOT NULL,
part_id NUMBER(9) NOT NULL,
quantity NUMBER(2) NOT NULL,
FOREIGN KEY(product_id) REFERENCES products(product_id),
FOREIGN KEY(part_id) REFERENCES parts(part_id),
CONSTRAINT product_parts_pk PRIMARY KEY (product_id, part_id)
);

DROP TABLE salaries CASCADE CONSTRAINTS;
CREATE TABLE salaries ( 
  transaction_num NUMBER(9) NOT NULL,
  personal_id NUMBER(9) NOT NULL,
	pay_date DATE NOT NULL,
  amount NUMBER(9) NOT NULL,
	FOREIGN KEY (personal_id) REFERENCES people(personal_id),
  CONSTRAINT salaries_pk PRIMARY KEY (transaction_num, personal_id)
);