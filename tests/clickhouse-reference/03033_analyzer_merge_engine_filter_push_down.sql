select toTypeName(x), x FROM m_table SETTINGS additional_table_filters = {'m_table':'x != 4'}, optimize_move_to_prewhere=1, enable_analyzer=1;
