with 
    source as (
    select
            *
    from {{ ref('stg_employee') }}
    ),
    transformed as (
    select
        {{ dbt_utils.generate_surrogate_key(['s.Id']) }} as employee_sk,
        s.*
    from source s
    )
select * from transformed