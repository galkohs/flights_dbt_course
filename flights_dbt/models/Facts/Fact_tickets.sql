{{ config(materialized='incremental', unique_key='ticket_no') }}

select 
    b.book_ref,
    b.book_date,
    b.total_amount,

    t.ticket_no,
    t.passenger_id,
    t.passenger_name,
    t.contact_data,
    t.last_update,

    jsonb_extract_path(contact_data, 'email' )as Email,
    jsonb_extract_path(contact_data, 'phone' )as Phone,

'{{ run_started_at.strftime ("%Y-%m-%d %H:%M:%S")}}'::timestamp as dbt_time

from flights_demo.stg.bookings b 
join flights_demo.stg.tickets t
	on b.book_ref =t.book_ref 