with

locations as (

    select * from {{ ref('legacy_stg_locations') }}

)

select * from locations
