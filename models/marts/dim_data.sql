with spine as (

    {{ dbt_utils.date_spine(
        datepart   = "day",
        start_date = "date('2012-01-01')",
        end_date   = "date('2014-12-31')"
    ) }}

),

base as (

    select
        date(date_day) as date_id,

        -- chaves úteis
        format_date('%Y%m%d', date_day) as date_key,

        -- componentes básicos
        extract(year from date_day) as year,
        extract(quarter from date_day) as quarter,
        extract(month from date_day) as month,
        extract(day from date_day) as day,

        -- nomes formatados
        format_date('%A', date_day) as day_name,
        format_date('%B', date_day) as month_name,

        -- semana
        extract(isoweek from date_day) as iso_week,
        extract(dayofweek from date_day) as day_of_week,

        -- flags úteis
        case 
            when extract(dayofweek from date_day) in (1,7) then true 
            else false 
        end as is_weekend,

        case 
            when date_day = current_date() then true 
            else false 
        end as is_today,

        case 
            when date_day = current_date() - 1 then true 
            else false 
        end as is_yesterday

    from spine

),

enhanced as (

    select
        *,

        -- início/fim de períodos
        date_trunc(date_id, month) as month_start,
        last_day(date_id, month) as month_end,

        date_trunc(date_id, year) as year_start,
        last_day(date_id, year)  as year_end,
        -- ano-mês para joins
        format_date('%Y-%m', date_id) as year_month,

        -- ranking dentro do mês
        row_number() over (
            partition by year, month 
            order by date_id
        ) as day_of_month_rank

    from base

)

select * from enhanced