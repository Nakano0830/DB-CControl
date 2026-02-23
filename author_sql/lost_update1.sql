BEGIN TRANSACTION;

SELECT
    name,
    qty AS "Stock"
FROM
    stocks
WHERE
    name IN ('Cola');
