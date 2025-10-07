select datum, temperatuur_tiende/10 as temperatuur_hele_graden, regen_mm 
from {{ref('weerdata_leo')}}