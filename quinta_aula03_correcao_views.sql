SELECT c.id, c.nome, SUM(p.valor_total) as valor_total_compras, COUNT(p.id) as total_pedidos
FROM clientes c
INNER JOIN pedidos p ON c.id = p.id_cliente
GROUP BY c.id, c.nome
HAVING COUNT(p.id) >= 3;



-- uma sala tem muitos alunos.. um aluno pertence a uma sala

alunos

id      nome        id_sala

select id_sala, count(id)
from    alunos
GROUP BY id_sala
ORDER BY COUNT(ID) DESC
LIMIT 3

SELECT
FROM
    JOIN
where
GROUP BY
HAVING
ORDER BY
LIMIT

-- Escreva uma consulta que retorne o nome do fornecedor, o nome do produto e
-- o número total de unidades compradas por fornecedor e por produto,
-- apenas para aqueles com mais de 100 unidades compradas. 
-- Use um inner join entre as tabelas "fornecedores", 
-- "produtos" e "compras" e agrupe os resultados pelo nome do fornecedor 
-- e pelo nome do produto.

select f.nome as fornecedor, p.nome as produto, sum(cp.quantidade) as quantidade
from compras c
    inner join fornecedores f on c.id_fornecedor = f.id
    inner join compras_produtos cp on cp.id_compra = c.id
    inner join produtos p on c.id_produto = p.id
group by f.nome, p.nome
having sum(cp.quantidade) >= 100

select * 
from quantidade_pedidos_por_fornecedor

from fornecedores f
        inner join compras c
            on f.id = c.id_fornecedor
        inner join compras_produtos cp
            on cp.id_compra = c.id
        inner join produtos p 
            on p.id = cp.id_produto



-- retorno desta consulta
fornecedor  produto         quantidade        