

with dim_flight_mod as (	
			select *,
			extract(day from (scheduled_arrival - scheduled_departure)*24) + extract(hour from (scheduled_arrival - scheduled_departure)) as flight_duration_expected,
			extract(day from (actual_arrival - actual_departure)*24) + extract(hour from (actual_arrival - actual_departure)) as duration_actual_hours
			from flights_demo.stg.flights f 
			)
select *,
    case 	when duration_actual_hours > flight_duration_expected 
                then 'Longer'
            when duration_actual_hours < flight_duration_expected 
                then 'Shorter'
            when duration_actual_hours = flight_duration_expected 
                then 'As Expected'
            else null
            end as flight_duration_case,

'2023-08-16 17:21:51'::timestamp as dbt_time

from dim_flight_mod