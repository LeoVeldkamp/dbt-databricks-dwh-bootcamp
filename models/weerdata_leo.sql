WITH weerdata_gilze_rijen AS (
  SELECT
    *
  FROM {{ source('weerdata', 'weerdata_gilze_rijen') }}
), rename_1 AS (
  SELECT
    yyyymmdd AS datum,
    tx AS temperatuur_tiende,
    rh AS regen_mm,
    sq AS sunshine,
    pg AS pressure_hpa
  FROM weerdata_gilze_rijen
), weerdata_leo AS (
  SELECT
    *
  FROM rename_1
)
SELECT
  *
FROM weerdata_leo