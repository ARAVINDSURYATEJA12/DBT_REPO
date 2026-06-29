with trips as (

    select 
        ride_id,
        rideable_type,
        
        date(TRY_TO_TIMESTAMP(started_at)) as trip_date,
        start_statio_id,
        end_station_id,
        member_csual,
        
        timestampdiff(second, TRY_TO_TIMESTAMP(started_at), TRY_TO_TIMESTAMP(ended_at)) as time_duration_seconds
    from {{ ref('stg_bike') }}

    where ride_id != '"bikeid"' and ride_id != 'bikeid'
    limit 10
)

select * from trips