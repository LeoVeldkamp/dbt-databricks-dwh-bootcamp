with stap_1 as (
    select 
        datum, 
        temperatuur_tiende / 10 as temperatuur_hele_graden, 
        regen_mm,
        sunshine / pressure_hpa as sunshine_per_hpa
    from {{ ref('weerdata_leo') }}
),
stap_2 as (
    select 
        datum,
        case when regen_mm != 0 then sunshine_per_hpa / regen_mm else null end as sunshine_per_mm,
        sunshine_per_hpa / 10 as sunshine_per_hpa_10
    from stap_1
)

select 
    a.datum, 
    a.temperatuur_hele_graden, 
    a.regen_mm, 
    a.sunshine_per_hpa, 
    b.sunshine_per_mm, 
    b.sunshine_per_hpa_10
from stap_1 a
inner join stap_2 b on a.datum = b.datum