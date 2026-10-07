with customers as (
    select * from {{ ref('stg_jaffle_shop__customers') }}
),

orders as (
    select * from {{ ref('fct_jaffle_shop__orders') }}
),

customer_orders as (
    select
        customer_id,
        min(order_placed_at) as first_order_date,
        max(order_placed_at) as most_recent_order_date,
        count(order_id) as number_of_orders,
        sum(amount) as lifetime_value
    from orders
    group by 1
),

final as (
    select
        c.customer_id,
        c.customer_first_name,
        c.customer_last_name,
        co.first_order_date,
        co.most_recent_order_date,
        coalesce (co.number_of_orders, 0) as number_of_orders,
        lifetime_value
    from customers as c
        left join customer_orders as co
            using(customer_id)
)

select * from final