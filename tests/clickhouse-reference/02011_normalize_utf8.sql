CREATE TABLE normalize_test (id int, value String) ENGINE = MergeTree ORDER BY value;
SELECT
    'ё' AS norm, 'ё' AS denorm,
    length(norm), length(denorm),
    normalizeUTF8NFC(norm) AS norm_nfc,
    normalizeUTF8NFC(denorm) AS denorm_nfc,
    length(norm_nfc),
    length(denorm_nfc);
INSERT INTO normalize_test (id, value) VALUES (1, 'ё');
INSERT INTO normalize_test (id, value) VALUES (2, 'ё');
INSERT INTO normalize_test (id, value) VALUES (3, 'జ్ఞ‌ా');
INSERT INTO normalize_test (id, value) VALUES (4, '本気ですか');
INSERT INTO normalize_test (id, value) VALUES (5, 'ﷺ');
INSERT INTO normalize_test (id, value) VALUES (6, 'ᾂ');
INSERT INTO normalize_test (id, value) VALUES (7, 'ΐ');
INSERT INTO normalize_test (id, value) VALUES (8, 'שּׁ');
INSERT INTO normalize_test (id, value) VALUES (9, '𝅘𝅥𝅮');
INSERT INTO normalize_test (id, value) VALUES (10, 'Q̹̣̩̭̰̰̹̄ͬ̿͋̃ṷ̬̰ͥe̘͚͈̰̺̍͐s͎̜̖t͔̣̯̲̜̠ͣ̑ͨ̉̈̈o̲͙̺͊ͯͣ̐̋̂̔ ̳͉͍̒̂è̗ͥͯͨ̍ͮ͛ ̦̹̣̰̐̅̑͑̅̂t͙̭̻̖͛̾e̺͙ͣ͒̚ṣ̠͉͓͔̲̦̎t̖͖̝͓̣ͭ͑̈́̂ỏ̥͕͈͛̓ ̀ͦ̽ͅZͯ̑̎a͆l̻ͨ̋ͧͣͨͬg͉̙̟̾̅̾ͬo̠ͮ͒');
SELECT
    id, value, length(value),
    normalizeUTF8NFC(value) AS nfc, length(nfc) AS nfc_len,
    normalizeUTF8NFD(value) AS nfd, length(nfd) AS nfd_len,
    normalizeUTF8NFKC(value) AS nfkc, length(nfkc) AS nfkc_len,
    normalizeUTF8NFKD(value) AS nfkd, length(nfkd) AS nfkd_len
FROM normalize_test
ORDER BY id;
SELECT char(228) AS value, normalizeUTF8NFC(value); -- { serverError CANNOT_NORMALIZE_STRING }
SELECT char(228) AS value, normalizeUTF8NFD(value); -- { serverError CANNOT_NORMALIZE_STRING }
SELECT char(228) AS value, normalizeUTF8NFKC(value); -- { serverError CANNOT_NORMALIZE_STRING }
SELECT char(228) AS value, normalizeUTF8NFKD(value); -- { serverError CANNOT_NORMALIZE_STRING }
