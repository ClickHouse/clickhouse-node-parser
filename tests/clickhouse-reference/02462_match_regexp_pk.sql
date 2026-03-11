SELECT count() FROM mt_match_pk WHERE match(v, '^a');
SELECT count() FROM mt_match_pk WHERE match(v, '^ab');
SELECT count() FROM mt_match_pk WHERE match(v, '^a.');
SELECT count() FROM mt_match_pk WHERE match(v, '^ab*');
SELECT count() FROM mt_match_pk WHERE match(v, '^ac?');
SELECT count() FROM mt_match_pk WHERE match(v, '^a$|^b'); -- {serverError INDEX_NOT_USED}
