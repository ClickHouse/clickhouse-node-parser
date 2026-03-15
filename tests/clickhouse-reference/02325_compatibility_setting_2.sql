select value from system.settings where name='allow_settings_after_format_in_insert';
select value from system.settings where name='allow_settings_after_format_in_insert' settings compatibility='22.3';
set compatibility = '22.3';
set compatibility = '22.4';
set allow_settings_after_format_in_insert=1;
