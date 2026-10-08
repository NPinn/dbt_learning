select
    customer_id
from {{ ref('dim_jaffle_shop__customers') }}
group by customer_id
having count(*) > 1