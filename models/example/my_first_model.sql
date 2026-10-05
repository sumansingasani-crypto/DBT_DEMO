select 
* 
From {{ source('DEMO', 'bike') }}
limit 10