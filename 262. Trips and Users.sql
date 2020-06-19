SELECT A.Request_at "Day",IFNULL(ROUND(B.Cancel_Status/A.Total_Status,2),0) AS "Cancellation Rate"
FROM (
    SELECT Request_at, COUNT(Id) AS Total_Status FROM Trips 
    WHERE (Request_at BETWEEN "2013-10-01" AND "2013-10-03") AND (Client_Id NOT IN (SELECT Users_Id FROM Users WHERE Banned = "Yes")) AND (Driver_Id NOT IN (SELECT Users_Id FROM Users WHERE Banned = "Yes"))
    GROUP BY Request_at ) AS A
LEFT JOIN 
    (SELECT Request_at, COUNT(Id) AS Cancel_Status FROM Trips 
    WHERE Status != "completed" AND (Request_at BETWEEN "2013-10-01" AND "2013-10-03") AND (Client_Id NOT IN (SELECT Users_Id FROM Users WHERE Banned = "Yes")) AND (Driver_Id NOT IN (SELECT Users_Id FROM Users WHERE Banned = "Yes"))
    GROUP BY Request_at) AS B
ON A.Request_at = B.Request_at
GROUP BY A.Request_at