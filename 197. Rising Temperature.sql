SELECT W2.Id
FROM Weather W1
INNER JOIN Weather W2
ON  DATEDIFF(W2.Recorddate,W1.Recorddate) = 1 AND W2.Temperature > W1.Temperature