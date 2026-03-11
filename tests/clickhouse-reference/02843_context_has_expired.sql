SELECT 1 IN (SELECT dictGet('02843_dict', 'value', materialize('1')));
SELECT 1 IN (SELECT joinGet(02843_join, 'value', materialize(1)));
SELECT 1 IN (SELECT joinGetOrNull(02843_join, 'value', materialize(1)));
SELECT 1 IN (SELECT materialize(connectionId()));
SELECT 1000000 IN (SELECT materialize(getSetting('max_threads')));
SELECT 1 in (SELECT file(materialize('a'))); -- { serverError FILE_DOESNT_EXIST }
