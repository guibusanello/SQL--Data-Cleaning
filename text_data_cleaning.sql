CREATE DATABASE data_clean_sql

USE data_clean_sql

/* Criação da tabela */

CREATE TABLE sample_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    address VARCHAR(255),
    phone VARCHAR(20),
    description TEXT
);

/* Inserção de dados */

INSERT INTO sample_data (name, email, address, phone, description) VALUES
('  John Doe  ', 'JOHN.DOE@EXAMPLE.COM', '  123 Main St.  ', ' (123) 456-7890', '  This is a test description.  '),
('Jane Smith', 'jane.smith@example.com ', '456 Elm St.   ', '(234) 567-8901', ' Another test description with spaces. '),
('Bob Johnson', 'bob.johnson@example.com', '   789 Oak St.', '(345) 678-9012', 'More descriptions here.'),
('Alice Brown', 'alice.brown@EXAMPLE.COM ', ' 101 Pine St.  ', '(456) 789-0123', 'Final test description with EXCESSIVE spaces.   ');

/* Consultando dados */
SELECT *
FROM sample_data

/* Removendo espaços em branco */

UPDATE sample_data
SET name = TRIM(name),
    email = TRIM(email),
    address = TRIM(address),
    phone = TRIM(phone),
    description = TRIM(description);

SELECT *
FROM sample_data

/* Convertendo textos da coluna email e description para minúsculas */

UPDATE sample_data
SET email = LOWER(email),
    description = LOWER(description);

SELECT *
FROM sample_data

-- Substituir caracteres específicos no telefone
UPDATE sample_data
SET phone = REPLACE(phone, '(', ''),
    phone = REPLACE(phone, ')', ''),
    phone = REPLACE(phone, '-', ''),
    phone = REPLACE(phone, ' ', '');

SELECT *
FROM sample_data

-- Concatenar nome e email
SELECT CONCAT(name, ' <', email, '>') AS contact_info
FROM sample_data;

-- Adicionar a nova coluna
ALTER TABLE sample_data
ADD COLUMN contact_info VARCHAR(255);

-- Atualizar a nova coluna com a concatenação
UPDATE sample_data
SET contact_info = CONCAT(name, ' <', email, '>');

SELECT *
FROM sample_data

-- Extrair substring dos primeiros 10 caracteres da descrição
SELECT SUBSTRING(description, 1, 10) AS short_description
FROM sample_data;