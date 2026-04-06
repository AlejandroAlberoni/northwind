with
    source as (
        select
            Id,	
            EmployeeId,	
            TerritoryId	
        from {{ ref('stg_employeeTerritory') }}
    ),
    employee as (
        select
            employee_sk,
            Id
        from {{ ref('dim_employee') }}
    ),
    territory as (
        select
            territory_sk,
            Id
        from {{ ref('dim_territory') }}
    ),
    base as (
        select distinct
            e.employee_sk,
            t.territory_sk
        from source s
            join employee e 
            on e.Id = s.EmployeeId
            join territory t
            on t.Id = s.TerritoryId
    ),
    counts as (
        select
            employee_sk,
            count(*) as total_territories
        from base
        group by employee_sk
    )
select
    b.employee_sk,
    b.territory_sk,
    1.0 / c.total_territories as allocation_pct
from base b
join counts c
    on b.employee_sk = c.employee_sk