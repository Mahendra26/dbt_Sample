with orders as (

    select * from {{ ref('02_stg_orders') }}

),

customers as (

	select * from {{ ref('01_stg_customers') }}


),

renamed as (

    select
        customer_id,

        min(order_date) as first_order,
        max(order_date) as most_recent_order,
        count(order_id) as number_of_orders
    from orders

    group by 1

),

final as (

    select *
    from customers

    join orders using (customer_id)

)

select * from final