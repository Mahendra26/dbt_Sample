with payments as (

    select * from {{ ref('03_stg_payments') }}

),

orders as (

    select * from {{ ref('02_stg_orders') }}

),

final as (

    select
        orders.customer_id,
        sum(amount) as total_amount

    from payments

    left join orders using (order_id)

    group by 1

)

select * from final