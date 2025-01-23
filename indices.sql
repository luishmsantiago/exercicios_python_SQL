'''Os índices são estruturas de dados criadas em colunas de tabelas para acelerar as consultas. 
Eles funcionam como índices em livros, ajudando a localizar dados rapidamente.

Tipos:
'''
--Clusterizado: Os dados na tabela são fisicamente organizados na ordem do índice. Apenas um índice clusterizado por tabela.
CREATE CLUSTERED INDEX idx_pedidos_id ON Pedidos (PedidoID);

--Efeito: Os dados serão armazenados fisicamente na ordem de PedidoID.

--Não-clusterizado: Contém uma referência (ponteiro) para os dados reais. Pode haver vários índices não-clusterizados em uma tabela.
CREATE NONCLUSTERED INDEX idx_produtos_nome ON Produtos (Produto);

--Efeito: A consulta por Produto será mais rápida, mas os dados não são fisicamente ordenados.

--Único: Garante que valores em uma coluna sejam únicos.
CREATE UNIQUE INDEX idx_cliente_email ON Clientes (Email);

--Efeito: Cada cliente terá um e-mail único.

--Composto: Garante que valores em uma coluna sejam únicos.
CREATE INDEX idx_pedidos_cliente_produto ON Pedidos (ClienteID, Produto);

--Efeito: Otimiza consultas como:
SELECT * FROM Pedidos WHERE ClienteID = 101 AND Produto = 'Teclado';



CREATE INDEX idx_nome ON clientes (nome);
-- Cria um índice na coluna 'nome' da tabela 'clientes