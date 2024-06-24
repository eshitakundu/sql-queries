--For every project located in 'Stafford', list the project number, the controlling department number, and the department manager's last name, address, and birth date.

SELECT P.PNUMBER, P.DNUM, E.LNAME, E.ADDRESS, E.BDATE
FROM EMPLOYEE E, PROJECT P, DEPARTMENT D
WHERE E.SSN = D.MGRSSN AND E.DNO = P.DNUM AND D.DNUMBER = P.DNUM AND P.PLOCATION = 'Stafford';


--Retrieve the name of each employee who works on all the projects controlled by department number 5.

SELECT (E.FNAME||' '||E.MINIT||' '||E.LNAME) as NAME
FROM EMPLOYEE E, PROJECT P, WORKS_ON W
WHERE P.DNUM = 5 AND W.PNO= P.PNUMBER AND E.SSN = W.ESSN
GROUP BY (E.FNAME||' '||E.MINIT||' '||E.LNAME)
HAVING COUNT(DISTINCT P.PNUMBER) = (SELECT COUNT(*) FROM PROJECT WHERE DNUM = 5);

--alternative

SELECT (FNAME||' '||MINIT||' '||LNAME) as NAME
FROM EMPLOYEE E
WHERE (SELECT COUNT(DISTINCT(PNUMBER)) 
       FROM PROJECT WHERE DNUM = 5)
       =
      (SELECT COUNT(DISTINCT(W.PNO)) 
       FROM WORKS_ON W, PROJECT P 
       WHERE P.PNUMBER = W.PNO AND P.DNUM = 5 AND W.ESSN = E.SSN);


--Make a list of all project numbers for projects that involve an employee whose last name is 'Smith', either as a worker or as a manager of the department that controls the project.

SELECT W.PNO, E.LNAME
FROM EMPLOYEE E, WORKS_ON W
WHERE E.SSN = W.ESSN AND E.LNAME = 'Smith';


--Retrieve the names of employees who have no dependents.

SELECT (E.FNAME||' '||E.MINIT||' '||E.LNAME) as NAME
from EMPLOYEE E
WHERE SSN NOT IN(SELECT D.ESSN FROM DEPENDENT D);


--List the names of managers who have at least one dependent.

SELECT DISTINCT(E.LNAME||' '||E.MINIT||' '||E.LNAME) as Name
FROM EMPLOYEE E, DEPARTMENT D, DEPENDENT DP
WHERE E.SSN = D.MGRSSN AND DP.ESSN = E.SSN;


--For each employee, retrieve the employee's first and last name and the first and last name of his or her immediate supervisor. (SELF JOIN)

SELECT (E1.FNAME ||' '|| E1.LNAME) AS "Employee Name", 
(SELECT (E2.FNAME ||' '|| E2.LNAME) FROM EMPLOYEE E2 WHERE E2.SSN = E1.SUPERSSN) AS "Supervisor Name"
FROM EMPLOYEE E1
ORDER BY "Supervisor Name" ASC; 

--alternative:

SELECT (E1.FNAME||' '||E1.LNAME) AS "Employee Name", 
       (E2.FNAME||' '||E2.LNAME) AS "Supervisor Name"
FROM EMPLOYEE E1, EMPLOYEE E2
WHERE E1.SUPERSSN = E2.SSN
ORDER BY "Supervisor Name" ASC;


--Show the resulting salaries if every employee working on the 'ProductX' project is given a 10 per cent raise.

SELECT E.SALARY+(E.SALARY*0.1) as "UPDATED SALARY"
FROM EMPLOYEE E, PROJECT P, WORKS_ON W
WHERE P.DNUM = E.DNO AND P.PNAME = 'ProductX' AND P.PNUMBER = W.PNO AND W.ESSN = E.SSN;


--Retrieve a list of employees and the projects they are working on, ordered by department and, within each department, ordered alphabetically by last name, and first name.

SELECT (E.FNAME||' '||E.MINIT||' '||E.LNAME) AS NAME, P.PNAME, D.DNAME
FROM EMPLOYEE E, WORKS_ON W, PROJECT P, DEPARTMENT D
WHERE E.SSN = W.ESSN AND W.PNO = P.PNUMBER AND E.DNO = D.DNUMBER AND D.DNUMBER = P.DNUM
ORDER BY D.DNAME, E.LNAME, E.FNAME;


--Retrieve the names of all employees who do not have supervisors.

SELECT DISTINCT(FNAME||' '||MINIT||' '||LNAME) as NAME
FROM EMPLOYEE
WHERE SUPERSSN IS NULL;


--Retrieve the social security numbers of all employees who work on project numbers 1,2.

SELECT DISTINCT(E.SSN)
FROM EMPLOYEE E, WORKS_ON W
WHERE W.ESSN = E.SSN AND W.PNO IN (1,2);


--Returns the names of employees whose salary is greater than the salary of all the employees in department 5.

SELECT (FNAME||' '||MINIT||' '||LNAME) as NAME
FROM EMPLOYEE
WHERE SALARY > ( SELECT MAX(SALARY) FROM EMPLOYEE WHERE DNO = 5 );


--Find the sum of the salaries of all employees, the maximum salary, the minimum salary, and the average salary.

SELECT SUM(SALARY) as "Sum of Salaries", 
       MAX(SALARY) as "Maximum Salary", 
       MIN(SALARY) as "Minimum Salary", 
       AVG(SALARY) as "Average Salary" 
from EMPLOYEE;


--Find the sum of the salaries of all employees of the 'Research' department, as well as the maximum salary, the minimum salary, and the average salary in this department.

SELECT SUM(SALARY) as "SUM OF SALARY",
       MAX(SALARY) as "MAX SALARY",
       MIN(SALARY) as "MIN SALARY",
       AVG(SALARY) as "AVERAGE SALARY"
FROM EMPLOYEE, DEPARTMENT D
WHERE E.DNO = D.DNUMBER AND DNAME = 'Research';


--Retrieve the names of all employees who have two or more dependents.

SELECT (E.FNAME||' '||E.MINIT||' '||E.LNAME) as NAME
FROM EMPLOYEE E, DEPENDENT D
WHERE E.SSN = D.ESSN
GROUP BY (E.FNAME||' '||E.MINIT||' '||E.LNAME)
HAVING COUNT (E.FNAME||' '||E.MINIT||' '||E.LNAME) > = 2;

--alternative

SELECT (E.FNAME||' '||E.MINIT||' '||E.LNAME) as NAME
FROM EMPLOYEE E
WHERE 2 <= (SELECT COUNT(D.ESSN) 
            FROM DEPENDENT D 
            WHERE E.SSN = D.ESSN);


--Count the total number of employees whose salaries exceed $40,000 in each department, but only for departments where more than five employees work.

SELECT COUNT(*) as "Employee Count"
FROM EMPLOYEE
WHERE SALARY>40000 AND DNO IN (
SELECT DNO                                               
FROM EMPLOYEE
GROUP BY DNO
HAVING COUNT(*) > 5);


--For each project, retrieve the project number, the project name, and the number of employees who work on that project.

SELECT P.PNUMBER, P.PNAME, COUNT(W.ESSN) AS NUM_EMPLOYEES
FROM PROJECT P
LEFT JOIN WORKS_ON W ON P.PNUMBER = W.PNO
GROUP BY P.PNUMBER, P.PNAME
ORDER BY P.PNUMBER;

--alternative

SELECT P.PNUMBER, P.PNAME, (SELECT COUNT(*) 
                            FROM WORKS_ON W 
                            WHERE W.PNO = P.PNUMBER) 
                            AS NUM_EMPLOYEES
FROM PROJECT P
ORDER BY P.PNUMBER;


SELECT P.PNUMBER, P.PNAME, COUNT(W.ESSN) AS NUM_EMPLOYEES
FROM PROJECT P, WORKS_ON W
WHERE P.PNUMBER = W.PNO
GROUP BY P.PNUMBER, P.PNAME
ORDER BY P.PNUMBER;


--For each project on which more than two employees work, retrieve the project number, the project name, and the number of employees who work on the project.

SELECT P.PNUMBER, P.PNAME, COUNT(*) AS "NO. OF EMPLOYEES"
FROM PROJECT P, WORKS_ON W
WHERE P.PNUMBER = W.PNO
GROUP BY P.PNUMBER, P.PNAME
HAVING COUNT(*) > 2;


--For each project, retrieve the project number, the project name, and the number of employees from department 5 who work on the project.

SELECT P.PNUMBER, P.PNAME, COUNT(W.ESSN) as “NO. OF EMPLOYEES”
FROM PROJECT P, WORKS_ON W, EMPLOYEE E
WHERE P.PNUMBER = W.PNO AND E.SSN = W.ESSN AND E.DNO = 5
GROUP BY P.PNUMBER, P.PNAME;


--For each department that has more than five employees, retrieve the department number and the number of its employees who are making more than $40,000

SELECT DNO, COUNT(SSN) AS "NO. OF EMPLOYEES"
FROM EMPLOYEE
WHERE SALARY > 40000
GROUP BY DNO
HAVING COUNT(SSN) > 5;
