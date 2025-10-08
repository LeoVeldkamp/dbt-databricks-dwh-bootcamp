WITH weerdata_leo AS (
  SELECT
    *
  FROM {{ ref('weerdata_leo') }}
), formula_1 AS (
  SELECT
    *,
    temperatuur_tiende / 10 AS temperatuur_hele_graden,
    sunshine / pressure_hpa AS sunshine_per_hpa
  FROM weerdata_leo
), rename_1 AS (
  SELECT
    datum,
    temperatuur_hele_graden,
    regen_mm,
    sunshine_per_hpa
  FROM formula_1
), rename_3 AS (
  SELECT
    datum as a_datum,
    temperatuur_hele_graden,
    regen_mm,
    sunshine_per_hpa
  FROM rename_1
), formula_2 AS (
  SELECT
    *,
    CASE WHEN regen_mm <> 0 THEN sunshine_per_hpa / regen_mm ELSE NULL END AS sunshine_per_mm,
    sunshine_per_hpa / 20 AS sunshine_per_hpa_10
  FROM rename_1
), rename_2 AS (
  SELECT
    datum AS b_datum,
    sunshine_per_mm,
    sunshine_per_hpa_10
  FROM formula_2
), join_1 AS (
  SELECT
    *
  FROM rename_3
  JOIN rename_2
    ON rename_3.a_datum = rename_2.b_datum
), rename_4 AS (
  SELECT
    a_datum AS datum,
    temperatuur_hele_graden,
    regen_mm,
    sunshine_per_hpa,
    sunshine_per_mm,
    sunshine_per_hpa_10
  FROM join_1
), weerdata_lineage AS (
  SELECT
    *
  FROM rename_4
)
SELECT
  *
FROM weerdata_lineage