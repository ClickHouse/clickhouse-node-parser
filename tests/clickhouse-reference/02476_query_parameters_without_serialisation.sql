SELECT {num:UInt64}, {str:String}, {date:DateTime}, {map:Map(UUID, Array(Float32))};
SELECT toTypeName({num:UInt64}), toTypeName({str:String}), toTypeName({date:DateTime}), toTypeName({map:Map(UUID, Array(Float32))});
SELECT {id: Int64}, {arr: Array(UInt8)}, {map_2: Map(String, UInt8)}, {mul_arr: Array(Array(UInt8))}, {map_arr: Map(UInt8, Array(UInt8))}, {map_map_arr: Map(String, Map(String, Array(UInt8)))};
SELECT toTypeName({id: Int64}), toTypeName({arr: Array(UInt8)}), toTypeName({map_2: Map(String, UInt8)}), toTypeName({mul_arr: Array(Array(UInt8))}), toTypeName({map_arr: Map(UInt8, Array(UInt8))}), toTypeName({map_map_arr: Map(String, Map(String, Array(UInt8)))});
SELECT {col:Identifier} FROM {db:Identifier}.{tbl:Identifier} LIMIT 1 OFFSET 5;
SELECT {arr_arr_arr: Array(Array(Array(String)))}, toTypeName({arr_arr_arr: Array(Array(Array(String)))});
SELECT {tuple_tuple_tuple: Tuple(Tuple(Tuple(Int32, String, UUID, Float32)))}, toTypeName({tuple_tuple_tuple: Tuple(Tuple(Tuple(Int32, String, UUID, Float32)))});
SELECT {arr_map_tuple: Array(Map(UInt64, Tuple(Int16, DateTime, String)))}, toTypeName({arr_map_tuple: Array(Map(UInt64, Tuple(Int16, DateTime, String)))});
SELECT {map_arr_tuple_map: Map(String, Array(Tuple(UInt8, Map(UInt32, Int64))))}, toTypeName({map_arr_tuple_map: Map(String, Array(Tuple(UInt8, Map(UInt32, Int64))))});
