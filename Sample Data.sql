INSERT INTO people VALUES (1, 'Gavin', 'Terry', 22, 'M', NULL, NULL, NULL, NULL, NULL);
INSERT INTO people VALUES (2, 'Googenheim', 'Henry', 33, 'F', NULL, NULL, NULL, NULL, NULL);
INSERT INTO people VALUES (3, 'Cole', 'Hellen', 45, 'F', NULL, NULL, NULL, NULL, NULL);

INSERT INTO department VALUES (1, 'Dept of Departments');
INSERT INTO department VALUES (2, 'Marketing');

INSERT INTO employee VALUES (1, 1, 'Title Here', 0);
INSERT INTO employee VALUES (2, 1, 'Title', 1);
INSERT INTO employee VALUES (3, 2, 'Title', 1);

INSERT INTO manages VALUES (1, 2);
INSERT INTO manages VALUES (3, 2);

INSERT INTO salaries VALUES (1, 1, '01-Jan-01', 10000);
INSERT INTO salaries VALUES (3, 1, '01-Feb-01', 12000);
INSERT INTO salaries VALUES (2, 2, '01-Feb-01', 12000);

INSERT INTO interviews VALUES(1, '09-Dec-00', 61);
INSERT INTO interviews VALUES(2, '11-Dec-00', 92);
INSERT INTO interviews VALUES(3, '16-Dec-00', 33);
INSERT INTO interviews VALUES(4, '01-Feb-08', 78);
INSERT INTO interviews VALUES(5, '09-Feb-09', 68);
INSERT INTO interviews VALUES(6, '22-Dec-00', 70);
INSERT INTO interviews VALUES(7, '28-Dec-00', 70);
INSERT INTO interviews VALUES(8, '03-Jan-01', 70);
INSERT INTO interviews VALUES(9, '04-Jan-01', 70);
INSERT INTO interviews VALUES(10, '04-Jan-14', 55);
INSERT INTO interviews VALUES(11, '04-Jul-05', 88);

INSERT INTO jobs VALUES (1, 'Its a living', '08-DEC-00', 1);
INSERT INTO jobs VALUES (2, 'To the market', '05-Jan-11', 2);
INSERT INTO jobs VALUES (3, 'From the market', '05-Feb-11', 2);
INSERT INTO jobs VALUES (11111, 'Its more than a living', '05-MAR-05', 1);
INSERT INTO jobs VALUES (12345, 'Gold Digging: A love story', '05-MAR-05', 1);

INSERT INTO interview_details VALUES(1, 1, 1);
INSERT INTO interview_details VALUES(2, 1, 1);
INSERT INTO interview_details VALUES(3, 1, 1);
INSERT INTO interview_details VALUES(4, 1, 2);
INSERT INTO interview_details VALUES(5, 11111, 3);
INSERT INTO interview_details VALUES(6, 2, 1);
INSERT INTO interview_details VALUES(7, 1, 1);
INSERT INTO interview_details VALUES(8, 1, 1);
INSERT INTO interview_details VALUES(9, 1, 1);
INSERT INTO interview_details VALUES(10, 12345, 2);
INSERT INTO interview_details VALUES(11, 12345, 3);

INSERT INTO interviewers VALUES (5,1);
INSERT INTO interviewers VALUES (5,2);

INSERT INTO products VALUES (1, 'Type1', 'XXL', 10, 10, 'Trimmed');
INSERT INTO products VALUES (2, 'Type1', 'XXL', 20, 1, 'Trimmed');
INSERT INTO products VALUES (3, 'Type2', 'XXL', 222.23, 5, 'Trimmed');

INSERT INTO sites VALUES (1, 'Site1', 'Loc1');
INSERT INTO site_sales VALUES (1, 2, 1, '04-JUN-02', 1);
INSERT INTO site_sales VALUES (1, 2, 1, '05-JUN-02', 2);
INSERT INTO site_sales VALUES (1, 2, 1, '07-JUL-02', 1);
INSERT INTO site_sales VALUES (1, 2, 1, '06-JUL-02', 3);

INSERT INTO vendors VALUES (1, 'Vendor1', 'Vendor Avenue', 11223, 755, 'vendor.com');
INSERT INTO vendors VALUES (2, 'Vendor2', 'Vendor Raod', 3345, 992, 'vending.net');
INSERT INTO parts VALUES (1);
INSERT INTO parts VALUES (2);

INSERT INTO product_parts VALUES (1, 1, 1);
INSERT INTO product_parts VALUES (2, 1, 1);
INSERT INTO product_parts VALUES (2, 2, 2);
INSERT INTO product_parts VALUES (3, 1, 3);

INSERT INTO vendor_parts VALUES (1, 1, 2);
INSERT INTO vendor_parts VALUES (2, 1, 1);
INSERT INTO vendor_parts VALUES (1, 2, 1);
INSERT INTO vendor_parts VALUES (2, 2, 5);