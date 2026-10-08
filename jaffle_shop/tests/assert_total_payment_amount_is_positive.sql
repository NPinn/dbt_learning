select
    order_id,
    sum(amount) as total_amount
from {{ ref('fct_jaffle_shop__orders') }}
group by 1
having not(total_amount >= 0)