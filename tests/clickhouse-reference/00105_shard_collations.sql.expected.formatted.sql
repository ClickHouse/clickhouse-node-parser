SELECT arrayJoin(['а', 'я', 'ё', 'А', 'Я', 'Ё']) AS x
ORDER BY x ASC;

SELECT arrayJoin(['а', 'я', 'ё', 'А', 'Я', 'Ё']) AS x
ORDER BY x ASC COLLATE 'ru';

SELECT arrayJoin(['а', 'я', 'ё', 'А', 'Я', 'Ё']) AS x
FROM remote('127.0.0.{2,3}', `system`, one)
ORDER BY x ASC COLLATE 'ru';

SELECT arrayJoin(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'ç', 'd', 'e', 'f', 'g', 'ğ', 'h', 'ı', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'ö', 'p', 'r', 's', 'ş', 't', 'u', 'ü', 'v', 'y', 'z', 'A', 'B', 'C', 'Ç', 'D', 'E', 'F', 'G', 'Ğ', 'H', 'I', 'İ', 'J', 'K', 'L', 'M', 'N', 'O', 'Ö', 'P', 'R', 'S', 'Ş', 'T', 'U', 'Ü', 'V', 'Y', 'Z']) AS x
ORDER BY x ASC;

SELECT arrayJoin(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'ç', 'd', 'e', 'f', 'g', 'ğ', 'h', 'ı', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'ö', 'p', 'r', 's', 'ş', 't', 'u', 'ü', 'v', 'y', 'z', 'A', 'B', 'C', 'Ç', 'D', 'E', 'F', 'G', 'Ğ', 'H', 'I', 'İ', 'J', 'K', 'L', 'M', 'N', 'O', 'Ö', 'P', 'R', 'S', 'Ş', 'T', 'U', 'Ü', 'V', 'Y', 'Z']) AS x
ORDER BY x ASC COLLATE 'tr';

SELECT arrayJoin(['A', 'c', 'Z', 'Q', 'e']) AS x
ORDER BY x ASC;

SELECT arrayJoin(['A', 'c', 'Z', 'Q', 'e']) AS x
ORDER BY x ASC COLLATE 'en_US';

SELECT arrayJoin(['A', 'c', 'Z', 'Q', 'e']) AS x
ORDER BY x ASC COLLATE 'en';

SELECT arrayJoin(['F', 'z', 'J', 'Ñ']) AS x
ORDER BY x ASC;

SELECT arrayJoin(['F', 'z', 'J', 'Ñ']) AS x
ORDER BY x ASC COLLATE 'es';

SELECT arrayJoin(['ґ', 'ї', 'І', 'Б']) AS x
ORDER BY x ASC;

SELECT arrayJoin(['ґ', 'ї', 'І', 'Б']) AS x
ORDER BY x ASC COLLATE 'uk';

SELECT
    x,
    n
FROM
    (
        SELECT ['а', 'я', 'ё', 'А', 'Я', 'Ё'] AS arr
    )
ARRAY JOIN arr AS x, arrayEnumerate(arr) AS n
ORDER BY
    x ASC COLLATE 'ru',
    n ASC;

--- Const expression
SELECT 'ζ' AS x
ORDER BY x ASC COLLATE 'el';

-- check order by const with collation
SELECT number
FROM numbers(2)
ORDER BY 'x' ASC COLLATE 'el';

-- check const and non const columns in order
SELECT number
FROM numbers(11)
ORDER BY
    'x' ASC,
    toString(number) ASC,
    'y' ASC COLLATE 'el';

--- Trash locales
SELECT '' AS x
ORDER BY x ASC COLLATE 'qq'; --{serverError UNSUPPORTED_COLLATION_LOCALE}

SELECT '' AS x
ORDER BY x ASC COLLATE 'qwe'; --{serverError UNSUPPORTED_COLLATION_LOCALE}

SELECT '' AS x
ORDER BY x ASC COLLATE 'some_non_existing_locale'; --{serverError UNSUPPORTED_COLLATION_LOCALE}

SELECT '' AS x
ORDER BY x ASC COLLATE 'ру'; --{serverError UNSUPPORTED_COLLATION_LOCALE}