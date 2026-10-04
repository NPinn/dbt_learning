with

supplies as (

    select * from {{ ref('legacy_stg_supplies') }}

)

select * from supplies
