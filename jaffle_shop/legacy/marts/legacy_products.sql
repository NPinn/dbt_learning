with

products as (

    select * from {{ ref('legacy_stg_products') }}

)

select * from products
