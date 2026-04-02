with 
    dim_employee as (
    select
            *
    from {{ ref('stg_employee') }}
    ),
    transformed as (
    select
        row_number() over (order by dim_employee.Id) as employee_sk
        ,*
    from dim_employee
    )
select * from transformed