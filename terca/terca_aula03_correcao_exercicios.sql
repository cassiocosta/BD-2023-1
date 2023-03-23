-- qual a diferença do date para o timestamp (datetime)

-- date
yyyy-MM-dd 

-- timestamp
yyyy-MM-dd hh:mm:ss

-- quais as vendas feitas no dia 01/03/2023

from    vendas
where   data_venda>='2023-03-01 00:00:00' and data_venda<='2023-03-01 23:59:59'

data_venda
2023-03-01 11:00:00
2023-03-01 11:59:00
2023-03-01 14:30:00

-- - --
SELECT p.nome as produto, AVG(v.valor_venda) as media_venda, 
        sum(v.valor_venda) vendas_categoria
FROM produtos p
		LEFT JOIN vendas v
        on p.id = v.id_produto
GROUP by p.categoria


-- exercício 3
---- 
SELECT  f.nome AS nome_fornecedor,
	    p.nome AS nome_produto,
	    SUM(cp.quantidade) AS total_itens_comprados
FROM fornecedores f
    INNER JOIN compras c
        ON f.id = c.id_fornecedor
    INNER JOIN compras_produtos cp
        ON cp.id_compra = c.id
    INNER JOIN produtos p
        ON p.id = cp.id_produto
GROUP BY f.nome, p.nome
HAVING SUM(cp.quantidade) > 100


-- exerc. 4
create view media_salarial_funcionarios_por_depto
as
SELECT f.nome as funcionário, d.nome as departamento, AVG(f.salario) as media_salario
from funcionarios f
		RIGHT join departamentos d
            on f.id_departamento = d.id
GROUP by f.nome,d.nome
limit 11,10

select * 
from media_salarial_funcionarios_por_depto


