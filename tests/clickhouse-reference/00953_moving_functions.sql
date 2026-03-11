SELECT * FROM moving_sum_num ORDER BY k,dt FORMAT TabSeparatedWithNames;
SELECT k, groupArrayMovingSum(v) FROM (SELECT * FROM moving_sum_num ORDER BY k, dt) GROUP BY k ORDER BY k FORMAT TabSeparatedWithNamesAndTypes;
SELECT k, groupArrayMovingSum(3)(v) FROM (SELECT * FROM moving_sum_num ORDER BY k, dt) GROUP BY k ORDER BY k FORMAT TabSeparatedWithNamesAndTypes;
SELECT k, groupArrayMovingAvg(v) FROM (SELECT * FROM moving_sum_num ORDER BY k, dt) GROUP BY k ORDER BY k FORMAT TabSeparatedWithNamesAndTypes;
SELECT k, groupArrayMovingAvg(3)(v) FROM (SELECT * FROM moving_sum_num ORDER BY k, dt) GROUP BY k ORDER BY k FORMAT TabSeparatedWithNamesAndTypes;
