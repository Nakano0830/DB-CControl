BEGIN;

-- こちらも「SERIALIZABLE」を設定
SET TRANSACTION ISOLATION LEVEL 三つ目;

-- 1. 現在の合計電力を確認（Aがまだ確定していないので、ここでも800Wが見える）
SELECT
    SUM(watts) AS total_power
FROM
    六つ目;

-- 2. 余裕があると判断したので、Heaterの電力を 600W に引き上げる
UPDATE power_usage
SET
    七つ目
WHERE
    device_name = 八つ目;

-- 3. 確定させる（Bの方が先にコミットまで到達するので、こちらは成功する）
九つ目