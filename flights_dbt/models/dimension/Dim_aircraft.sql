{{ config(materialized='incremental') }}

select 
    row_number() over() as dim_aircraft_id,

    ad.aircraft_code,
    ad.model,
    ad.range,
    ad.last_update,

    s. seat_no,
    s.fare_conditions,

    case when range > 5600 then 'High'
        when range <= 5600 then 'Low'
        else 'Null'
        end as range_L_H,
    jsonb_extract_path(model, 'en' )as Model_English,
    jsonb_extract_path(model, 'ru' )as Model_Russian,

'{{ run_started_at.strftime ("%Y-%m-%d %H:%M:%S")}}'::timestamp as dbt_time

from flights_demo.stg.aircrafts_data ad 
join flights_demo.stg.seats s 
	on s.aircraft_code = ad.aircraft_code 