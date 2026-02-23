BEGIN;

-- 最強の隔離レベル「SERIALIZABLE」を設定
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- 1. 現在の合計電力を確認（800W。上限1000Wまで、あと200W余裕がある）
SELECT
    SUM(watts) AS total_power
FROM
    power_usage;

-- （ここでTerminal Bが裏で動くのを5秒間待つ）
SELECT
    PG_SLEEP(5);

-- 2. 余裕があると判断したので、AirConの電力を 600W に引き上げる
UPDATE power_usage
SET
    watts = 600
WHERE
    device_name = 'AirCon';

-- 3. 確定させる
-- ※ 先にBがコミットを完了させていると、PostgreSQLが矛盾（Write Skew）を検知し、
-- ここでシリアライズエラーを吐いてAの処理を強制ロールバックします！
COMMIT;