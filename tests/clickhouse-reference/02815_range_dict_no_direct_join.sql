SELECT id, amount FROM ids INNER JOIN discounts_dict ON id = advertiser_id ORDER BY id, amount SETTINGS join_algorithm = 'direct,hash';
SELECT id, amount FROM ids INNER JOIN discounts_dict ON id = advertiser_id ORDER BY id, amount SETTINGS join_algorithm = 'default';
SELECT id, amount FROM ids INNER JOIN discounts_dict ON id = advertiser_id ORDER BY id, amount SETTINGS join_algorithm = 'direct'; -- { serverError NOT_IMPLEMENTED }
