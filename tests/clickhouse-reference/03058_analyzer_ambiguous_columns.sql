select  id, animal_name, a.animal_key, color_name, color_key
from fact a
        left join (select toInt64(animal_key) animal_key, animal_name from animals) b on (a.animal_key = b.animal_key)
        left join (select toInt64(color_key) color_key, color_name from colors) c on (a.color_key = c.color_key);  -- { serverError AMBIGUOUS_IDENTIFIER }
select  id, animal_name, animal_key, color_name, color_key
from fact a
        left join (select toInt64(animal_key) animal_key, animal_name from animals) b on (a.animal_key = b.animal_key)
        left join (select toInt64(color_key) color_key, color_name from colors) c on (a.color_key = c.color_key);  -- { serverError AMBIGUOUS_IDENTIFIER }
