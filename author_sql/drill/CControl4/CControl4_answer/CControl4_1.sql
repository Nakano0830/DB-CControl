-- 電力管理テーブルを作成し、初期データを投入
DROP TABLE IF EXISTS power_usage;

CREATE TABLE power_usage (device_name TEXT PRIMARY KEY, watts INTEGER);

INSERT INTO
    power_usage (device_name, watts)
VALUES
    ('AirCon', 400),
    ('Heater', 400);

-- 現在の合計: 800W (システム上限は1000Wとする)