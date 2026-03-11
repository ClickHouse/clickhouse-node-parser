SELECT replaceRegexpAll(message, '\(\d+\)', '_'), message_format_string FROM system.warnings WHERE message LIKE 'The number of%' ORDER BY message;
