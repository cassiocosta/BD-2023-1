
-- Listar os produtos que nunca foram orçados.. sem usar a view da sheila.

-- eduardo (é idem ao inner join.. )
select *
from produtos p, orcamento_produtos op
where op.cod_produto = p.cod_produto and op.cod_produto is null


select  nome_produto
from produtos
where id not in(  select id_produto from itens_orc 
                where id_produto=produtos.id)


select  nome_produto
from produtos
where not exists(  select id_produto from itens_orc 
                where id_produto=produtos.id)