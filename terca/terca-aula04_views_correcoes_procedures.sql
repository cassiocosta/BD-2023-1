


CREATE view produtos_orcados
AS
SELECT  p.nome,p.valor,p.saldo,o.id as id_orc,o.data,
        oi.valor_total_item,oi.quantidade
FROM produtos p
		inner join orcamentos_itens oi
        on p.id = oi.id_produto
        join orcamentos o
        on oi.id_orc = o.id
order by o.data desc

CREATE view produtos_nunca_orcados
AS
SELECT  p.nome,p.valor,p.saldo,oi.id_orc
FROM produtos p
		left join orcamentos_itens oi
where oi.id_orc is null

drop view orcamentos_produtos;


--lista os produtos que nunca foram orçados
select * 
from produtos
where id  in(select   id_produto 
                from orcamentos_itens
                where    id_produto= produtos.id);

select nome, id 
from orcamentos_produtos 
where id_orc is null

-- utilizando a view, liste todos os produtos que foram orçados no mes de março/2023
select nome, data
from orcamentos_produtos
where data between '2023-03-01' and '23-03-31'
order by nome ASC 

select * from produtos_nunca_orcados


-- union

SELECT id_autor FROM autores
UNION all
SELECT id_autor FROM livros

autores
id      nome
1       jose
2       elisa   
3       CAstro

livros
id      id_autor    titulo
100     1           BDOO
101     2           LPOO


id_autor
1
2
3

fornecedores
id  nome    cidade

clientes
id  nome    cidade

select id, nome
from fornecedores
union
select id, nome
from clientes

create view fluxo_caixa_2022
as
select  'R' as tipo, id,  id_empresa, id_cli as id_pessoa, data_emissao, data_venc, valor, 
        clientes.nome as pessoa
from receitas join clientes on cliente.id = receitas.id_cliente
WHERE data_emissao between '2022-01-01' and '2022-12-31'
UNION
select  'D' as tipo, id,  id_empresa, id_for as id_pessoa, data_emissao, data_venc, valor *(-1) as valor,
        fornecedores.nome as pessoa
from despesas join fornecedores on fornecedores.id = despesas.id_fornecedor
WHERE data_emissao between '2022-01-01' and '2022-12-31'

tipo    id  id_empresa  id_pessoa      data_emissao    data_venc   valor   pessoa
D    1   1           200         2023-01-01      2023-02-02  -1000      xyz
R    1   1           300         2023-01-01      2023-02-02  1000       fulano
D    1   1           200         2023-01-01      2023-02-02  -1000      ciclo
R    1   1           200         2023-01-01      2023-02-02  1000
D    1   1           200         2023-01-01      2023-02-02  -1000
D    1   1           200         2023-01-01      2023-02-02  - 1000
R    1   1           200         2023-01-01      2023-02-02  1000

-- mostrar o saldo (receitas - despesas) do mes de jan 2023

select sum(valor)
from fluxo_caixa
where data_emissao between '2023-03-01' and '2023-03-31'

-- quanto deu no mes de receita e quanto deu no mes de despesa

tipo            Total
Despesas        -10000
receitas        9900

select tipo, sum(valor) as total
from fluxo_caixa
group by tipo