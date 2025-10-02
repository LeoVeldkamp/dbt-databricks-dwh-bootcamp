WITH customer_bronze AS (
  SELECT
    *
  FROM {{ source('tpch', 'customer_bronze') }}
), filter_1 AS (
  SELECT
    *
  FROM customer_bronze
  WHERE
    NOT c_custkey IS NULL AND c_nationkey <> 21
), formula_1 AS (
  SELECT
    *,
    CASE WHEN c_acctbal < 0 THEN TRUE ELSE FALSE END AS has_negative_acctbal
  FROM filter_1
), customer_silver_sql AS (
  SELECT
    c_custkey,
    c_name,
    c_nationkey,
    c_acctbal,
    has_negative_acctbal
  FROM formula_1
)
SELECT
  *
FROM customer_silver_sql