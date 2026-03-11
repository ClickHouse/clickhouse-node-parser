SELECT compression_codec FROM system.columns WHERE database = currentDatabase() AND table = 'delta_codec_for_alter' AND name = 'x';
