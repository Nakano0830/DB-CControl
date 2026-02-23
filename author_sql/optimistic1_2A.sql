-- version=1であることを条件に更新し、versionを2にインクリメントする
UPDATE stocks
SET
    qty = 280,
    version = version + 1
WHERE
    name = 'Cola' AND
    version = 1;