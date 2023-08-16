

select *,
    jsonb_extract_path(airport_name, 'en' )as airport_name_eng, 
    jsonb_extract_path(city, 'en' )as city_eng,
    jsonb_extract_path(airport_name, 'ru' )as airport_name_rus,
    jsonb_extract_path(city, 'en' )as city_rus,

'2023-08-16 17:21:51'::timestamp as dbt_time

from stg.airports_data