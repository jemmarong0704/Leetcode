SELECT E1.Name Employee
FROM Employee E1, Employee E2
WHERE E1.ManagerId = E2.Id
AND E1.Salary > E2.Salary