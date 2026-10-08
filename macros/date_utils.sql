{% macro get_season(X) %}

CASE WHEN Month(to_timestamp({{X}})) in (12,1,2)
THEN 'WINTER'
WHEN Month(to_timestamp({{X}})) in (3,4,5)
THEN 'SPRING'
WHEN Month(to_timestamp({{X}})) in (6,7,8)
THEN 'SUMMER'
ELSE 'AUTUMN'
END 

{% endmacro %}