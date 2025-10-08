WITH lineitem_bronze AS (
  SELECT
    *
  FROM {{ source('tpch', 'lineitem_bronze') }}
), filter_1 AS (
  SELECT
    *
  FROM lineitem_bronze
  WHERE
    NOT l_orderkey IS NULL AND l_shipdate >= CAST('1990-02-01' AS DATE)
), lineitem_silver AS (
  SELECT
    l_orderkey,
    l_linenumber,
    l_quantity,
    l_extendedprice,
    l_discount,
    l_tax,
    l_returnflag,
    l_linestatus
  FROM filter_1
)
SELECT
  *
FROM lineitem_silver