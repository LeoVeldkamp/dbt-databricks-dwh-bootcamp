select yyyymmdd as datum, tx as temperatuur_tiende, rh as regen_mm, sq as sunshine, pg as pressure_hpa
from {{ source('weerdata', 'weerdata_gilze_rijen') }}