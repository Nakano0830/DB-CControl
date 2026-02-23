-- Terminal Bも初期状態のversion=1を指定して更新を試みる
-- しかし、既にAによってversionが2になっているため、該当行なし(0 rows updated)となる
UPDATE stocks
SET
    qty = 260,
    version = version + 1
WHERE
    name = 'Cola' AND
    version = 1;