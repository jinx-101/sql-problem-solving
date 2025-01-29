https://datalemur.com/questions/sql-well-paid-employees


Well Paid Employees
FAANG SQL Interview Question


SELECT E.employee_id , E.name as employee_name
from employee E inner join employee M 
ON E.manager_id = M.employee_id
WHERE E.salary > M.salary
