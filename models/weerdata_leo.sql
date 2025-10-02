select * 
from {{ source('weerdata', 'weerdata_gilze_rijen') }}