BEGIN;

-- 1. 排他ロック（FOR UPDATE）を獲得
SELECT
    name,
    qty
FROM
    stocks
WHERE
    name = 'Cola'
FOR UPDATE;

-- 2. ここで意図的に10秒間、処理を一時停止（ロックを保持し続ける）
SELECT
    PG_SLEEP(10);

-- 3. 10秒後に在庫を280に更新してコミット
UPDATE stocks
SET
    qty = 280
WHERE
    name = 'Cola';

COMMIT;