WITH o AS (
  SELECT
    *
  FROM {{ ref('orders_silver') }}
), l AS (
  SELECT
    *
  FROM {{ ref('lineitem_silver') }}
), join_1 AS (
  SELECT
    *
  FROM o
  LEFT JOIN l
    ON o.o_orderkey = l.l_orderkey
), formula_1 AS (
  SELECT
    *,
    CASE WHEN (
      l_discount >= 0.07
    ) THEN 'discounted' ELSE 'not_discounted' END AS discount
  FROM join_1
), discounts AS (
  SELECT
    o_orderkey,
    o_totalprice,
    l_orderkey,
    l_discount,
    discount
  FROM formula_1
)
SELECT
  *
FROM discounts