-- Aが5秒待っている間に素早く実行して、値を書き換えます
UPDATE stocks
SET
    qty = qty + 50
WHERE
    name = 'Cola';