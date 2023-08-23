{{ config(materialized='incremental', unique_key='airport_code') }}

select *,
    jsonb_extract_path(airport_name, 'en' )as airport_name_eng, 
    jsonb_extract_path(city, 'en' )as city_eng,
    jsonb_extract_path(airport_name, 'ru' )as airport_name_rus,
    jsonb_extract_path(city, 'en' )as city_rus,

'{{ run_started_at.strftime ("%Y-%m-%d %H:%M:%S")}}'::timestamp as dbt_time

from stg.airports_data