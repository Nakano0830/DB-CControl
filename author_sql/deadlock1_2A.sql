BEGIN;

-- 1. まず「コーラ」のロックを獲得
SELECT
    name
FROM
    stocks
WHERE
    name = 'Cola'
FOR UPDATE;

-- 2. 業者Bが「水」をロックする時間を稼ぐために3秒待機
SELECT
    PG_SLEEP(3);

-- 3. 次に「水」のロックを獲得しようとする（しかし業者Bが持っているためブロックされる）
SELECT
    name
FROM
    stocks
WHERE
    name = 'Water'
FOR UPDATE;

-- ※ 実際にはここでデッドロックが検知され、トランザクションが強制終了(ROLLBACK)されます
UPDATE stocks
SET
    qty = qty - 20
WHERE
    name = 'Cola';

UPDATE stocks
SET
    qty = qty - 20
WHERE
    name = 'Water';

COMMIT;