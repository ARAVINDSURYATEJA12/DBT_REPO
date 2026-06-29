with bike as (

    select 
    distinct 
    start_statio_id,
    start_station_name,
    start_lat,
    start_lng

    from {{ ref('stg_bike') }}
    where RIDE_ID !='"bikeid"'
    limit 10

)

select * from bike