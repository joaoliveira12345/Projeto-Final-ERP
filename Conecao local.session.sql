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
INSERT INTO Produtos (Nome, Preco, QuantidadeEstoque, CategoriaID) VALUES
('Perfume Floral', 50, 100, 1),
('Perfume Amadeirado', 30, 200, 1),
('Perfume Cítrico', 40, 150, 1),
('Perfume Oriental', 20, 120, 1),
('Perfume Frutado', 35, 180, 1),
('Perfume Gourmet', 15, 90, 1),
('Perfume Aquático', 60, 110, 1),
('Perfume Especiado', 25, 130, 1),
('Perfume Verde', 45, 140, 1),
('Perfume Musk', 20, 160, 1);

INSERT INTO Produtos (ProdutoID, Nome, Preco, QuantidadeEstoque, CategoriaID) VALUES
(10, 'Perfume Floral', 50, 100, 1);

UPDATE Categorias
SET Nome = 'Perfumes'
WHERE CategoriaID = 2;

UPDATE Produtos
SET Nome = 'Perfume Musk', Preco = 20, QuantidadeEstoque = 160, CategoriaID = 1
WHERE ProdutoID = 10;

DELETE FROM Produtos WHERE ProdutoID = 10;

DESCRIBE Produtos;

SELECT * FROM Categorias;

SELECT * FROM Produtos;
