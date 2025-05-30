-- Create aliases and JOIN the tables
SELECT
  orders.*,
  warehouse.warehouse_alias,
  warehouse.state
FROM
  `coursera-projects-456814.warehouse.orders` AS orders
JOIN
  `coursera-projects-456814.warehouse.warehouse` AS warehouse
ON
  orders.warehouse_id = warehouse.warehouse_id
LIMIT
  100;

-- Find the number of states with warehouses that shipped orders with COUNT DISTINCT
SELECT
  COUNT(DISTINCT warehouse.state) as num_states
FROM
  `coursera-projects-456814.warehouse.orders` AS orders
JOIN
  `coursera-projects-456814.warehouse.warehouse` AS warehouse
ON orders.warehouse_id = warehouse.warehouse_id;
