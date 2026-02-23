BEGIN;

-- 1. まず「コーラ」のロックを獲得
SELECT
    name
FROM
    stocks
WHERE
    name = 'Cola'
FOR UPDATE;

-- 2. 業者Aが「コーラ」をロックする時間を稼ぐために3秒待機
SELECT
    PG_SLEEP(3);

-- 3. 次に「水」のロックを獲得しようとする
SELECT
    name
FROM
    stocks
WHERE
    name = 'Water'
FOR UPDATE;

UPDATE stocks
SET
    qty = qty - 40
WHERE
    name = 'Cola';

UPDATE stocks
SET
    qty = qty - 40
WHERE
    name = 'Water';

COMMIT;