SELECT cityHash64(groupArray(cityHash64(*))) FROM (
  SELECT
    a % 31 AS g,
    minMerge(min_aggreg) AS minagg,
    min(min_simple) AS mins,
    minagg = mins AS M,
    maxMerge(max_aggreg) AS maxagg,
    max(max_simple) AS maxs,
    maxagg = maxs AS MX,
    sumMerge(sum_aggreg) AS sumagg,
    sum(sum_simple) AS sums,
    sumagg = sums AS S,
    sumWithOverflowMerge(sumov_aggreg) AS sumaggov,
    sumWithOverflow(sumov_simple) AS sumsov,
    sumaggov = sumsov AS SO,
    groupBitAndMerge(gbitand_aggreg) AS gbitandaggreg,
    groupBitAnd(gbitand_simple) AS gbitandsimple,
    gbitandaggreg = gbitandsimple AS BIT_AND,
    groupBitOrMerge(gbitor_aggreg) AS gbitoraggreg,
    groupBitOr(gbitor_simple) AS gbitorsimple,
    gbitoraggreg = gbitorsimple AS BIT_OR,
    groupBitXorMerge(gbitxor_aggreg) AS gbitxoraggreg,
    groupBitXor(gbitxor_simple) AS gbitxorsimple,
    gbitxoraggreg = gbitxorsimple AS BITXOR,
    arraySort(groupArrayArrayMerge(gra_aggreg)) AS graa,
    arraySort(groupArrayArray(gra_simple)) AS gras,
    graa = gras AS GAA,
    arraySort(groupUniqArrayArrayMerge(grp_aggreg)) AS gra,
    arraySort(groupUniqArrayArray(grp_simple)) AS grs,
    gra = grs AS T,
    sumMapMerge(aggreg_map) AS smmapagg,
    sumMap(simple_map) AS smmaps,
    smmapagg = smmaps AS SM,
    minMapMerge(aggreg_map_min) AS minmapapagg,
    minMap(simple_map_min) AS minmaps,
    minmapapagg = minmaps AS SMIN,
    maxMapMerge(aggreg_map_max) AS maxmapapagg,
    maxMap(simple_map_max) AS maxmaps,
    maxmapapagg = maxmaps AS SMAX
  FROM simple_agf_aggregating_mt
  GROUP BY g
  ORDER BY g
);
SELECT '---mutation---';
