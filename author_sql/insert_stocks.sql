-- 既に同名のテーブルがあれば削除する
DROP TABLE IF EXISTS stocks;

-- ユーザ情報を保持するテーブルを作成する
CREATE TABLE stocks (id INT PRIMARY KEY, name TEXT NOT NULL, qty INT);

-- テーブルにレコード（ユーザ情報）を挿入する
INSERT INTO
  stocks (id, name, qty )
VALUES
  (1, 'Cola', 300),
  (2, 'Fanta', 200),
  (3, 'Water', 400);

-- すべてのレコードを抽出する
SELECT * FROM stocks;