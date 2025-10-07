select datum, temperatuur_tiende/10 as temperatuur_hele_graden, regen_mm,
sunshine/pressure_hpa as sunshine_per_hpa
from {{ref('weerdata_leo')}}