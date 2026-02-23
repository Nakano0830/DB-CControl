-- Terminal Aがロックを手放す（10秒経過してCOMMITされる）まで、この処理は待機させられます
UPDATE stocks
SET
    qty = 260
WHERE
    name = 'Cola';