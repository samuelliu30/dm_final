SELECT material_name, material_counts.usageCount
FROM recipe join material_counts 
ON recipe.material_id = material_counts.material_id 
JOIN unpopular_product 
ON unpopular_product.product_id = recipe.product_id


CREATE VIEW unpopular_product AS
SELECT product.product_id, product.product_name, sum(quantity) as totalQauntity 
FROM Product join order_line
ON Product.product_id = order_line.product_id 
JOIN `order`
ON order_line.order_id = `order`.order_id
WHERE order_date >= "2024-01-01"
GROUP BY product.product_id
ORDER BY totalQauntity
LIMIT 10

CREATE VIEW material_counts AS
SELECT raw_materials.material_id, raw_materials.material_name, count(recipe_id) as usageCount
FROM recipe join raw_materials 
ON recipe.material_id = raw_materials.material_id 
JOIN product
ON recipe.product_id = product.product_id
GROUP BY raw_materials.material_id


# Fop sales and commission
CREATE VIEW riceball_order AS
SELECT `order`.`order_id`, `order`.`order_date`, fop.fop_id, fop.name, order_line.product_id, order_line.quantity
FROM `order` join order_line
ON order_line.order_id = `order`.order_id
join fop
ON `order`.fop_id = fop.fop_id
WHERE fop.name = "riceball"

SELECT sum(quantity * product.price) as total_sales
FROM riceball_order join product
ON riceball_order.product_id = product.product_id
WHERE `riceball_order`.`order_date` >= "2024-05-01"

SELECT sum(quantity * product.price) as total_sales, total_sales * 
FROM riceball_order join product
ON riceball_order.product_id = product.product_id
join fop_contract
ON fop.fop_id = fop_contract.fop_id
WHERE `order`.`order_date` >= "2024-05-01"


# Fix cost
SELECT store.store_name, SUM(TIMESTAMPDIFF(HOUR, shift.shift_start, shift.shift_end))*20 AS total_salary
FROM employee JOIN shift
ON employee.employee_id = shift.employee_id
JOIN store
ON shift.store_id = store.store_id
WHERE shift.shift_start >= "2024-11-01" AND shift.shift_start <= "2024-11-30"
GROUP BY shift.store_id
