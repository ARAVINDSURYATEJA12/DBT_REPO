with trips as (

    select 
        ride_id,
        rideable_type,
        
        date(TRY_TO_TIMESTAMP(started_at)) as trip_date,
        start_station_id,
        end_station_id,
        member_casual,
        
        timestampdiff(second, TRY_TO_TIMESTAMP(started_at), TRY_TO_TIMESTAMP(ended_at)) as time_duration_seconds
    from {{ source('demo', 'bike') }}

    where ride_id is not null
    limit 10
)

select * from trips