select a, c + toInt32(1), (c + toInt32(1)) * 2 from prewhere_alias prewhere (c + toInt32(1)) * 2 = 6;
