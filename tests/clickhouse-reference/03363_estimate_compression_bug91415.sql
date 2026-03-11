SELECT estimateCompressionRatio(c0) OVER (ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) FROM t0 SETTINGS use_variant_as_common_type = 1;
