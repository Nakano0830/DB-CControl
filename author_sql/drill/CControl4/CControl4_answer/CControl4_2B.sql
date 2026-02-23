BEGIN;

-- こちらも「SERIALIZABLE」を設定
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- 1. 現在の合計電力を確認（Aがまだ確定していないので、ここでも800Wが見える）
SELECT
    SUM(watts) AS total_power
FROM
    power_usage;

-- 2. 余裕があると判断したので、Heaterの電力を 600W に引き上げる
UPDATE power_usage
SET
    watts = 600
WHERE
    device_name = 'Heater';

-- 3. 確定させる（Bの方が先にコミットまで到達するので、こちらは成功する）
COMMIT;