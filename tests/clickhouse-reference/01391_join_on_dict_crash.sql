SELECT click_country_id FROM t AS cc LEFT JOIN d ON toUInt32(d.id) = cc.click_city_id;
SELECT click_country_id FROM t AS cc LEFT JOIN d ON d.country_id < 99 AND d.id = cc.click_city_id;
