BEGIN;

-- 明示的に Read Committed を設定
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- 1回目の読み取り（画面に結果が表示されます）
SELECT
    '1回目の読み取り' AS step,
    qty
FROM
    stocks
WHERE
    name = 'Cola';

-- Terminal Bが更新する時間を稼ぐため、5秒間待機します
SELECT
    PG_SLEEP(5);

-- 2回目の読み取り（待機中にBが更新した場合、ここでの結果が変わってしまいます）
SELECT
    '2回目の読み取り' AS step,
    qty
FROM
    stocks
WHERE
    name = 'Cola';

COMMIT;