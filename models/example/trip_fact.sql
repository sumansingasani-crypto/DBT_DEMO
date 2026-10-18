WITH bike AS (

    select 
    
    Ride_id,
    RIDEABLE_TYPE,
    Date(to_timestamp(Started_at)) as Trip_date,
    start_statio_id as start_station_id,
    end_station_id,
    MEMBER_CSUAL As MEMBER_CASUAL,
    TIMESTAMPDIFF(SECOND, to_timestamp(Ended_at), to_timestamp(Started_at)) AS Trip_duration_seconds
    FROM {{ source('DEMO', 'bike') }}
    where ride_id !='RIDE_ID'
    and TRY_TO_TIMESTAMP(STARTED_AT) IS NOT NULL
)
select * from bike