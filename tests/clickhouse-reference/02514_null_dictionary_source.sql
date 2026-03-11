SELECT
    dictGet('null_dict', 'val', 1337),
    dictGetOrNull('null_dict', 'val', 1337),
    dictGetOrDefault('null_dict', 'val', 1337, 111),
    dictGetUInt8('null_dict', 'val', 1337),
    dictGetUInt8OrDefault('null_dict', 'val', 1337, 111);
SELECT
    dictGet('null_dict', 'default_val', 1337),
    dictGetOrNull('null_dict', 'default_val', 1337),
    dictGetOrDefault('null_dict', 'default_val', 1337, 111),
    dictGetUInt8('null_dict', 'default_val', 1337),
    dictGetUInt8OrDefault('null_dict', 'default_val', 1337, 111);
SELECT
    dictGet('null_dict', 'nullable_val', 1337),
    dictGetOrNull('null_dict', 'nullable_val', 1337),
    dictGetOrDefault('null_dict', 'nullable_val', 1337, 111);
SELECT val, nullable_val FROM null_dict;
SELECT dictGet('null_ip_dict', 'val', toIPv4('127.0.0.1'));
SELECT network, val FROM null_ip_dict;
