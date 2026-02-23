-- 既に同名のテーブルがあれば削除する
DROP TABLE IF EXISTS stocks;

-- 在庫情報を保持するテーブルを作成する
CREATE TABLE stocks (id INT PRIMARY KEY, name TEXT NOT NULL, qty INT, version INTEGER DEFAULT 1);

-- テーブルにレコード（ユーザ情報）を挿入する
INSERT INTO
    stocks (id, name, qty, version)
VALUES
    (1, 'Cola', 300, 1),
    (2, 'Fanta', 200, 1),
    (3, 'Water', 400, 1);

-- すべてのレコードを抽出する
SELECT
    *
FROM
    stocks;