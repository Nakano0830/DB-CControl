-- 既に同名のテーブルがあれば削除する
DROP TABLE IF EXISTS stocks;

-- 在庫情報を保持するテーブルを作成する
CREATE TABLE stocks (
  id INT PRIMARY KEY,
  name TEXT NOT NULL,
  qty INT,
  last_updated TIMESTAMP NOT NULL
);

-- テーブルにレコード（ユーザ情報）を挿入する
INSERT INTO
  stocks (id, name, qty, last_updated)
VALUES
  (1, 'Cola', 300, '2026-02-14 15:30'),
  (2, 'Fanta', 200, '2026-02-14 15:00'),
  (3, 'Water', 400, '2026-02-14 15:50');

-- すべてのレコードを抽出する
SELECT
  *
FROM
  stocks;