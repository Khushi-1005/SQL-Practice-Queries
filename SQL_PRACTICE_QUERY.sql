CREATE TABLE employees(
	emp_id int primary key,
	name varchar(100),
	Department varchar(50),
	Salary numeric(10),
	City varchar(50)
);
INSERT INTO employees(emp_id, name, Department, Salary, City)
VALUES (101, 'Rahul', 'IT', 50000, 'Pune'),
       (102, 'Priya', 'HR', 40000, 'Mumbai'),
	   (103, 'Amit', 'IT', 60000, 'Pune'),
	   (104, 'Neha', 'Finance', 55000, 'Delhi'),
	   (105, 'Khushi', 'HR', 60000, 'Pune'),
	   (106, 'Suhani', 'Finance', 45000, 'Nashik');


-- 1.Display all employee records.
SELECT * FROM EMPLOYEES;

--2. Show only employee names and salaries.
SELECT name, Salary From employees;

--3. Find employees whose salary is greater than 50,000.
SELECT Name, Salary 
FROM employees
WHERE Salary>50000;

--4.Find employees belonging to the IT department.
SELECT Name, Department
FROM employees
WHERE department='IT';

--5.Display employees from Pune.
SELECT NAME, City
FROM EMPLOYEES
WHERE CITY ='Pune';

--6.Find employees whose salary is between 40,000 and 60,000.
SELECT Name, Salary 
FROM employees
WHERE Salary BETWEEN 40000 AND 60000;

--7.Sort employees by salary in descending order.
SELECT NAME, Salary FROM employees
Order by SALARY DESC;

--8.Display unique departments.
SELECT DISTINCT Department 
FROM EMPLOYEES;

--9.Find employees whose name starts with 'P'.
SELECT NAME FROM EMPLOYEES
WHERE NAME LIKE 'P%';

--10.Count total employees.
SELECT COUNT(*) AS total_emp
FROM EMPLOYEES;

--Level 2: Aggregate Functions
--11.Find the maximum salary.

SELECT MAX(SALARY)
FROM EMPLOYEES;

--12.Find the minimum salary.
SELECT MIN(SALARY)
FROM EMPLOYEES;

--13.Calculate average salary.
SELECT AVG(SALARY) AS AVG_SALARY
FROM EMPLOYEES;

--14.Find total salary paid.
SELECT SUM(SALARY) AS TOTAL_SALARY
FROM EMPLOYEES;

--15. Count employees in each department.
SELECT department,COUNT(*) AS TOTAL_EMP 
FROM EMPLOYEES
GROUP BY DEPARTMENT;

--16. Find departments having more than one employee.
SELECT department
FROM EMPLOYEES
WHERE Emp_id > 1
GROUP BY DEPARTMENT;

--17.Find average salary department-wise.
SELECT DEPARTMENT, AVG(SALARY) as AVG_SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT;

--LEVEL 3 JOINS

--CREATING TABLES
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount INT,
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);

--INSERTING VALUES IN IT
INSERT INTO customers (customer_id, customer_name)
VALUES
(1, 'A'),
(2, 'B'),
(3, 'C'),
(4, 'D');

INSERT INTO orders (order_id, customer_id, amount)
VALUES
(101, 1, 500),
(102, 2, 700),
(103, 1, 900);

SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;


--18.Display customer names with their order amounts. (INNER JOIN)
SELECT c.customer_name, o.order_id, o.amount
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id;

--19.Find customers even if they haven't placed orders.(left join)
SELECT c.customer_name, o.order_id, o.amount
From Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;


--20. SHOW ALL orders with its matching customers(RIGHT JOIN)
SELECT c.customer_id, o.order_id, o.amount
From Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;


--21 Show all customers and all orders (FULL JOIN)

SELECT c.customer_id, c.customer_name,o.order_id, o.amount
From Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;

--22.Find customers who have not placed any orders.
SELECT c.customer_name
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
Where o.customer_id IS NULL;

--23.Calculate total order amount for each customer.
SELECT c.customer_name,SUM(o.amount)
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

--24.Count Orders per Customer
SELECT c.customer_name, count(o.order_id) AS Total_order
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

--25.Find Customer with Highest Purchase
SELECT c.customer_name, SUM(o.amount) AS Total_purchase
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY Total_purchase desc LIMIT 1;



--Level 4: Subqueries
--26.Find employees earning more than average salary.
SELECT EMP_ID,name,SALARY,DEPARTMENT FROM EMPLOYEES
WHERE SALARY >
     (SELECT AVG(SALARY)
	 FROM EMPLOYEES);

--27. Find the employee with the second highest salary.
SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees
    )
);

--28.Find Employees Having the Same Department as Rahul
SELECT *
from EMPLOYEES
WHERE DEPARTMENT = (
	SELECT DEPARTMENT
	FROM EMPLOYEES
	WHERE NAME ='RAHUL'
);
	  

--29.Find Department with Highest Average Salary
SELECT DEPARTMENT, AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT
ORDER BY AVG(SALARY) DESC LIMIT 3;


