SELECT Department.Name Department, Employee.Name Employee, Salary
FROM Employee, Department
WHERE (DepartmentId, Salary) IN (
SELECT DepartmentId, MAX(Salary) AS Salary
FROM Employee
GROUP BY DepartmentId)
AND Employee.DepartmentId = Department.Id