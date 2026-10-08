with CTE as (

select 

to_timestamp(started_at) AS Started_At,
DATE(to_timestamp(started_at)) as date_started_at,
HOUR(to_timestamp(started_at)) as hour_started_at,
{{ get_season('STARTED_AT') }}
AS Station_of_year,
CASE WHEN DAYNAME(to_timestamp(started_at)) in ('Sat', 'Sun')
THEN 'WEEKEND'
ELSE 'WEEKDAY' END AS DAY_TYPE
From {{ source('DEMO', 'bike') }}
where started_at not in ('stoptime','started_at')

)
select * from CTE