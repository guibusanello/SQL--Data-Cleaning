USE data_clean_sql

-- Criação da tabela
CREATE TABLE sales_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_id VARCHAR(50),
    sales_amount DECIMAL(10, 2),
    transaction_date DATE,
    customer_name VARCHAR(100),
    product_name VARCHAR(100),
    region VARCHAR(50),
    status VARCHAR(20)
);

-- Inserindo dados
INSERT INTO sales_data (transaction_id, sales_amount, transaction_date, customer_name, product_name, region, status) VALUES
('TRN001', 150.50, '2023-01-15', 'John Doe', 'Product A', 'North', 'Completed'),
('TRN002', 200.75, '2023-01-16', 'Jane Smith', 'Product B', 'South', 'Completed'),
('TRN003', NULL, '2023-01-17', 'Bob Johnson', 'Product C', 'East', 'Pending'),
('TRN004', 350.25, '2023-01-18', NULL, 'Product A', 'West', 'Completed'),
('TRN005', 180.00, '2023-01-19', 'Alice Brown', 'Product B', 'North', NULL),
('TRN006', 220.50, '2023-01-20', 'John Doe', 'Product C', 'South', 'Completed'),
('TRN001', 150.50, '2023-01-15', 'John Doe', 'Product A', 'North', 'Completed');  -- Duplicado

-- Verificando dados
SELECT *
FROM sales_data

-- Remover dados duplicados
DELETE s1 FROM sales_data s1
JOIN sales_data s2 ON s1.id > s2.id
  AND s1.transaction_id = s2.transaction_id
  AND s1.sales_amount = s2.sales_amount
  AND s1.transaction_date = s2.transaction_date
  AND s1.customer_name = s2.customer_name
  AND s1.product_name = s2.product_name
  AND s1.region = s2.region
  AND s1.status = s2.status;

  SELECT *
  FROM sales_data

-- Atualizar valores nulos
UPDATE sales_data
SET sales_amount = 0
WHERE sales_amount IS NULL;

UPDATE sales_data
SET customer_name = 'Unknown'
WHERE customer_name IS NULL;

UPDATE sales_data
SET status = 'Unknown'
WHERE status IS NULL;

SELECT *
FROM sales_data

-- Converter sales_amount para outro formato (por exemplo, para inteiro)
ALTER TABLE sales_data
MODIFY COLUMN sales_amount INT;

SELECT *
from sales_data