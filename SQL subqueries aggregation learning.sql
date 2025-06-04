-- Aggregating data using subqueries

SELECT
  warehouse.warehouse_id,
  CONCAT(warehouse.state, ':', warehouse.warehouse_alias) AS warehouse_name,
  COUNT(orders.order_id) AS number_of_orders,
  (SELECT COUNT(*) FROM `coursera-projects-456814.warehouse.orders` AS orders) AS total_orders,
  -- Creating a new column with conditional cases
  CASE
    WHEN COUNT(orders.order_id)/(SELECT COUNT(*) FROM `coursera-projects-456814.warehouse.orders` AS orders) <= 0.20 THEN 'Fulfilled 0-20% of Orders'
    WHEN COUNT(orders.order_id)/(SELECT COUNT(*) FROM `coursera-projects-456814.warehouse.orders` AS orders) > 0.20
    AND COUNT(orders.order_id)/(SELECT COUNT(*) FROM `coursera-projects-456814.warehouse.orders` AS orders) <= 0.60
    THEN 'Fulfilled 21-60% of Orders'
    ELSE 'Fulfillised more than 60% of Orders'
  END AS fullfilment_summary
FROM `coursera-projects-456814.warehouse.warehouse` AS warehouse
LEFT JOIN `coursera-projects-456814.warehouse.orders` AS orders
ON orders.warehouse_id = warehouse.warehouse_id
GROUP BY
  warehouse.warehouse_id,
  warehouse_name
-- Having as the filter function to replace WHERE
HAVING
  count(orders.order_id) > 0;