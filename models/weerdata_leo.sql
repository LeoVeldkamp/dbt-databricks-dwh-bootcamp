select yyyymmdd as datum, tx as temperatuur_tiende, rh as regen_mm
from {{ source('weerdata', 'weerdata_gilze_rijen') }}