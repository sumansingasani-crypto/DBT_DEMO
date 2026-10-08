WITH bike AS (

    select 
    start_statio_id AS station_id,
    start_station_name AS station_name,
    start_lat as station_lat,
    start_lng as start_station_lng
    FROM {{ source('DEMO', 'bike') }}
    where ride_id !='RIDE_ID'
    
)
select * from bike