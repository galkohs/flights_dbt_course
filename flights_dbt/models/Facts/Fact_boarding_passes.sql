{{ config(materialized='incremental', unique_key='ticket_no') }}

select 
    bp.ticket_no,
    bp.flight_id,
    bp.boarding_no,
    bp.seat_no,
    bp.last_update,

    tf.fare_conditions,
    tf.amount,

'{{ run_started_at.strftime ("%Y-%m-%d %H:%M:%S")}}'::timestamp as dbt_time

from flights_demo.stg.ticket_flights tf 
join flights_demo.stg.boarding_passes bp 
	on tf.ticket_no = bp.ticket_no 
	and tf.flight_id =bp.flight_id 