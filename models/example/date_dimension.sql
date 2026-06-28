with cte as (

    select to_timestamp(STARTED_AT) as started_at,
    date(to_timestamp(STARTED_AT)) as date_started_at,
    hour(to_timestamp(STARTED_AT)) as hour_started_at,
    case when dayname(to_timestamp(STARTED_AT)) in ('Sat','Sun')
    then 'Weekend'
    else 'Business Days'
    end as day_type,
    case when month(to_timestamp(STARTED_AT)) in (12,1,2)
    then 'Winter'
    when month(to_timestamp(STARTED_AT)) in (3,4,5)
    then 'Spring'
    when month(to_timestamp(STARTED_AT)) in (6,7,8)
    then 'Summer'
    else 'Autumn'
    end station_of_the_year
    from 
    {{ source('demo', 'bike') }}
    where STARTED_AT !='started_at'
)


select * from cte