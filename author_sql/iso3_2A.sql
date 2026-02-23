BEGIN;

-- 分離レベルを Repeatable Read に引き上げる
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- 1回目の読み取り
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

-- 2回目の読み取り（Bが書き換えたとしても、1回目と同じ値が返ってきます！）
SELECT
    '2回目の読み取り' AS step,
    qty
FROM
    stocks
WHERE
    name = 'Cola';

COMMIT;