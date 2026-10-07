with all_values as (

    select
        order_status as value_field,
        count(*) as n_records

    from analytics.analytics_prod.stg_jaffle_shop__orders
    group by order_status

)

select *
from all_values
where value_field not in (
    'placed','shipped','completed','returned'
)