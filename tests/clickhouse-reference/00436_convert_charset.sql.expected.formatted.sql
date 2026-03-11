SELECT
    'абвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ' AS orig,
    hex(convertCharset(orig, 'utf-8', 'cp1251') AS cp1251) AS cp1251_hex,
    hex(convertCharset(orig, 'utf-8', 'utf-7')) AS utf7_hex,
    hex(convertCharset(orig, 'utf-8', 'bocu-1')) AS bocu1_hex,
    hex(convertCharset(orig, 'utf-8', 'scsu')) AS scsu_hex,
    convertCharset(cp1251, 'cp1251', 'utf-8') AS orig2,
    convertCharset(orig, 'cp1251', 'utf8') AS broken1,
    convertCharset(orig, 'latin1', 'utf8') AS broken2,
    convertCharset(orig, 'koi8-r', 'utf8') AS broken3,
    convertCharset(broken1, 'utf-8', 'cp1251') AS restored1,
    convertCharset(broken2, 'utf-8', 'latin1') AS restored2,
    convertCharset(broken3, 'utf-8', 'koi8-r') AS restored3
FORMAT Vertical;

SELECT
    materialize('абвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ') AS orig,
    hex(convertCharset(orig, 'utf-8', 'cp1251') AS cp1251) AS cp1251_hex,
    hex(convertCharset(orig, 'utf-8', 'utf-7')) AS utf7_hex,
    hex(convertCharset(orig, 'utf-8', 'bocu-1')) AS bocu1_hex,
    hex(convertCharset(orig, 'utf-8', 'scsu')) AS scsu_hex,
    convertCharset(cp1251, 'cp1251', 'utf-8') AS orig2,
    convertCharset(orig, 'cp1251', 'utf8') AS broken1,
    convertCharset(orig, 'latin1', 'utf8') AS broken2,
    convertCharset(orig, 'koi8-r', 'utf8') AS broken3,
    convertCharset(broken1, 'utf-8', 'cp1251') AS restored1,
    convertCharset(broken2, 'utf-8', 'latin1') AS restored2,
    convertCharset(broken3, 'utf-8', 'koi8-r') AS restored3
FORMAT Vertical;