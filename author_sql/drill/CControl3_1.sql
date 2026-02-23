DO $$
DECLARE
    max_retries CONSTANT INTEGER := 3; -- 最大リトライ回数
    retries INTEGER := 0;
    success BOOLEAN := false;
BEGIN
    WHILE retries < max_retries AND NOT success LOOP
        BEGIN -- 内部トランザクション（例外を捕捉する範囲）
            
            -- 【修正ポイント】SELECT を PERFORM に変更
            -- ロックを取得するだけで、値自体は変数に格納しないため
            PERFORM name FROM stocks WHERE name = 'Water' FOR UPDATE;
            PERFORM pg_sleep(3);
            PERFORM name FROM stocks WHERE name = 'Cola' FOR UPDATE;

            -- 両方取れたら更新
            UPDATE stocks SET qty = qty - 40 WHERE name = 'Cola';
            UPDATE stocks SET qty = qty - 40 WHERE name = 'Water';

            -- 成功フラグを立ててループを抜ける
            success := true;
            RAISE NOTICE '✅ 処理が成功しました！ (リトライ回数: %)', retries;

        EXCEPTION
            WHEN deadlock_detected THEN
                retries := retries + 1;
                RAISE WARNING '⚠️ デッドロックを検知。1秒待機してリトライします... (%/%)', retries, max_retries;
                -- 競合を避けるため少し待つ
                PERFORM pg_sleep(1);
        END;
    END LOOP;

    IF NOT success THEN
        RAISE EXCEPTION '❌ 最大リトライ回数に達しましたが、処理を完了できませんでした。';
    END IF;
END $$;