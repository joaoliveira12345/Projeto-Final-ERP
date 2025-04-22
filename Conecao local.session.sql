CREATE DATABASE IF NOT EXISTS Categorias;

-- Selecionar o banco de dados
USE Categorias;

-- Tabela para Categorias (deve ser criada antes de Produtos)
CREATE TABLE IF NOT EXISTS Categorias (
    CategoriaID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Descricao TEXT
);

-- Tabela para Produtos
CREATE TABLE IF NOT EXISTS Produtos (
    ProdutoID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL,
    QuantidadeStock INT NOT NULL,
    CategoriaID INT,
    FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID)
);

-- Tabela para Fornecedores
CREATE TABLE IF NOT EXISTS Fornecedores (
    FornecedorID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Contato VARCHAR(255),
    Telefone VARCHAR(20),
    Email VARCHAR(255)
);

-- Tabela para Movimentações de Estoque
CREATE TABLE IF NOT EXISTS MovimentacoesStock (
    MovimentacaoID INT AUTO_INCREMENT PRIMARY KEY,
    ProdutoID INT NOT NULL,
    Quantidade INT NOT NULL,
    TipoMovimentacao ENUM('Entrada', 'Saida') NOT NULL,
    DataMovimentacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID)
);

-- Inserir uma categoria na tabela Categorias
INSERT INTO Categorias (Nome) VALUES
('Perfumes');

-- Inserir 10 produtos relacionados a perfumes na tabela Produtos
INSERT INTO Produtos (ProdutoID, Nome, Preco, QuantidadeEstoque, CategoriaID) VALUES
(10, 'Perfume Floral', 50, 100, 1),
(2, 'Perfume Amadeirado', 30, 200, 1),
(3, 'Perfume Cítrico', 40, 150, 1),
(4, 'Perfume Oriental', 20, 120, 1),
(5, 'Perfume Frutado', 35, 180, 1),
(6, 'Perfume Gourmet', 15, 90, 1),
(7, 'Perfume Aquático', 60, 110, 1),
(8, 'Perfume Especiado', 25, 130, 1),
(9, 'Perfume Verde', 45, 140, 1),
(10, 'Perfume Musk', 20, 160, 1);

UPDATE Categorias
SET Nome = 'Perfumes'
WHERE CategoriaID = 2;

DESCRIBE Produtos;

SELECT * FROM Categorias;
