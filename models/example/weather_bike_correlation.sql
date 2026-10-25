

WITH CTE AS (

    
SELECT
    t.*,
    w.WEATHER,
    w.AVG_TEMP,
    w.AVG_PRESSURE,
    w.AVG_HUMIDITY,
    w.AVG_CLOUDS
FROM {{ ref('trip_fact') }} AS t
INNER JOIN {{ ref('daily_weather') }} AS w
    ON t.TRIP_DATE = w.DAILY_WEATHER


)

SELECT *
FROM CTE
ORDER BY TRIP_DATE DESC
