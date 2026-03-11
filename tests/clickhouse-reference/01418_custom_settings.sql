SELECT getSetting('custom_a') as v, toTypeName(v);
SELECT name, value FROM system.settings WHERE name LIKE 'custom_%' ORDER BY name;
SELECT getSetting('custom_e') as v, toTypeName(v); -- { serverError UNKNOWN_SETTING } -- Setting not found.
SELECT name, value FROM system.settings WHERE name = 'custom_e';
SELECT getSetting('custom_f') as v, toTypeName(v); -- { serverError UNKNOWN_SETTING } -- Setting not found.
SELECT COUNT() FROM system.settings WHERE name = 'custom_f';
SELECT getSetting('custom_compound.identifier.v1') as v, toTypeName(v);
SELECT name, value FROM system.settings WHERE name = 'custom_compound.identifier.v1';
SELECT getSetting('custom_null') as v, toTypeName(v);
SELECT name, value FROM system.settings WHERE name = 'custom_null';
