CREATE SCHEMA ATIVIDADE;
USE ATIVIDADE;

CREATE TABLE CLIENTES (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(80) UNIQUE NOT NULL,
    idade_cliente INT NOT NULL,
    localidade VARCHAR(50) NOT NULL
);

CREATE TABLE COMPRAS (
    compra_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    valor_compra DECIMAL(10,2) NOT NULL,
    data_compra DATE NOT NULL,
    status_pedido ENUM('aguardando', 'processado', 'finalizado') NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES CLIENTES(cliente_id)
);

INSERT INTO CLIENTES (nome, email, idade_cliente, localidade) VALUES
('Lucas Pereira', 'lucas.pereira@email.com', 34, 'Fortaleza'),
('Mariana Lima', 'mariana.lima@email.com', 29, 'Salvador'),
('Ricardo Barbosa', 'ricardo.barbosa@email.com', 41, 'Rio de Janeiro'),
('Tatiana Fernandes', 'tatiana.fernandes@email.com', 23, 'São Paulo'),
('Gustavo Almeida', 'gustavo.almeida@email.com', 36, 'Belo Horizonte'),
('Larissa Silva', 'larissa.silva@email.com', 27, 'Curitiba'),
('Roberto Costa', 'roberto.costa@email.com', 32, 'Porto Alegre'),
('Julia Martins', 'julia.martins@email.com', 25, 'Brasília'),
('Henrique Santos', 'henrique.santos@email.com', 40, 'Recife'),
('Patrícia Gonçalves', 'patricia.goncalves@email.com', 33, 'Manaus');

-- Inserir 10 registros na tabela COMPRAS
INSERT INTO COMPRAS (cliente_id, valor_compra, data_compra, status_pedido) VALUES
(1, 245.30, '2025-03-01', 'finalizado'),
(2, 180.50, '2025-03-04', 'aguardando'),
(3, 399.99, '2025-03-06', 'finalizado'),
(4, 157.85, '2025-03-08', 'processado'),
(5, 289.90, '2025-03-10', 'aguardando'),
(6, 210.00, '2025-03-12', 'finalizado'),
(7, 324.75, '2025-03-15', 'processado'),
(8, 99.95, '2025-03-18', 'finalizado'),
(9, 150.00, '2025-03-20', 'aguardando'),
(10, 410.25, '2025-03-22', 'processado');

-- Ações de agregação e agrupamento

-- Soma dos valores das compras
SELECT SUM(valor_compra) AS total_compras FROM COMPRAS;

-- Valor médio das compras
SELECT AVG(valor_compra) AS valor_medio FROM COMPRAS;

-- Maior e menor valor das compras
SELECT MAX(valor_compra) AS maior_compra, MIN(valor_compra) AS menor_compra FROM COMPRAS;

-- Contagem de compras por status
SELECT status_pedido, COUNT(*) AS quantidade FROM COMPRAS GROUP BY status_pedido;

-- Total de compras por localidade
SELECT C.localidade, SUM(CO.valor_compra) AS total_compras
FROM COMPRAS CO
JOIN CLIENTES C ON CO.cliente_id = C.cliente_id
GROUP BY C.localidade;