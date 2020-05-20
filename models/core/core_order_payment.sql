with payments as (

    select * from {{ ref('stg_payments') }}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

final as (

    select
        orders.customer_id,order_id,payment_method,
        sum(amount) as total_amount

    from payments

    left join orders using (order_id)

    group by customer_id,order_id,payment_method
)

select * from final