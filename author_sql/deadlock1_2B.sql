BEGIN;

-- 1. まず「水」のロックを獲得
SELECT
    name
FROM
    stocks
WHERE
    name = 'Water'
FOR UPDATE;

-- 2. 業者Aが「コーラ」をロックする時間を稼ぐために3秒待機
SELECT
    PG_SLEEP(3);

-- 3. 次に「コーラ」のロックを獲得しようとする（しかし業者Aが持っているためブロックされる）
SELECT
    name
FROM
    stocks
WHERE
    name = 'Cola'
FOR UPDATE;

-- ※ どちらかが犠牲になり、こちらは成功するか、あるいはエラーで終了します
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