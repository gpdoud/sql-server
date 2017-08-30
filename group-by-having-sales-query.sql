/****** Script for SelectTopNRows command from SSMS  ******/
SELECT ABC, sum(SalesYTD), AVG(salesytd)
  FROM Sales
  group by ABC
  having avg(salesytd) > 1000000