SELECT if((
        SELECT count(*)
        FROM `system`.time_zones
    ) > 500, 'ok', 'fail');