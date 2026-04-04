with 
    source as (
    select
            *
    from {{ ref('stg_customer') }}
    ),
    transformed as (
    select
        {{ dbt_utils.generate_surrogate_key(['s.Id']) }} as customer_sk,
        s.*
    from source s
    )
select * from transformed