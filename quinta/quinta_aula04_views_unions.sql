
-- Listar os produtos que nunca foram orçados.. sem usar a view da sheila.

-- eduardo (é idem ao inner join.. )
select *
from produtos p, orcamento_produtos op
where op.cod_produto = p.cod_produto and op.cod_produto is null


select  nome_produto
from produtos
where id not in(  select id_produto from itens_orc 
                where id_produto=produtos.id)

-- Delete todos os produtos que não foram orçados.
delete from produtos
where id not in(  select id_produto from itens_orc 
                where id_produto=produtos.id)

-- de um desconto de 20% no val_unit de todos os produtos que nunca foram orçados
update produtos set valor_unit = valor_unit * .80
where id not in(  select id_produto from itens_orc 
                where id_produto=produtos.id)         

select  nome_produto
from produtos
where not exists(  select id_produto from itens_orc 
                where id_produto=produtos.id)


Receitas
id      id_cli      data_rec        valor
100     1000        2023-03-10      10000
101     1000        2023-03-11      100
102     1002        2023-03-12      1000
103     1003        2023-03-13      909


Despesas
id      id_for      data_pgto        valor
100     1000        2023-03-10      10
101     1000        2023-03-11      70
102     1002        2023-03-12      1000
103     1003        2023-03-13      350


create view fluxo_caixa
as
select 'R' as tipo, id, id_cli as cod_pessoa, data_rec as data, valor
from Receitas

union all

select 'D' as tipo,id, cod_pessoa, data_pgto as data, valor *(-1)
from despesas 


tipo    id      cod_pessoa      data        valor
R        100     1000        2023-03-10      10000
R        101     1000        2023-03-11      100
R        102     1002        2023-03-12      1000
R        103     1003        2023-03-13      909
D        100     1000        2023-03-10      -10
D        101     1000        2023-03-11      -70
D        102     1002        2023-03-12      -1000
D        103     1003        2023-03-13      -350

select *
from    fluxo_caixa
where   valor < -350 and tipo = 'D'

select  *
from    fluxo_caixa
where   tipo = 'D'
        and data between '2023-02-01' and '2023-02-28'


-- qual o saldo da minha conta agora?
select  sum(valor) as saldo
from    fluxo_caixa

select      tipo, sum(valor) as saldo
from        fluxo_caixa
group by    tipo 
