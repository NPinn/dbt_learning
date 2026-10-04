with payments as (
    select * from {{ ref('stg_payments') }}
),

total_revenue as (
    select
        {% for payment_status in ['success', 'fail'] %}
            sum(case when payment_status = '{{ payment_status }}' then payment_amount else 0 end) as revenue_{{payment_status}} {{ ',' if not loop.last}}
        {% endfor %}
    from payments
    --group by 1
)

select * from total_revenue