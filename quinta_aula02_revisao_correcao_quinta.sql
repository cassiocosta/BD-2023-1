-- quantas aguas foram vendidas  no mes de fev
PRODUTOS
PRODUTOS_VENDAS
VENDAS
clientes

select p.nome, sum(vp.quant) as total 
from produtos p     
        inner join vendas_produtos vp
            ON p.id = vp.produto_id
        inner join vendas v
            ON v.id = vp.venda_id
group by p.nome

-- where v.data => '2023-02-01' and v.data <= '2023-02-28'
where v.data between '2023-02-01' and '2023-02-28'
    and p.nome ='água mineral'
-- where month(v.data) = 2 and year(v.data)=2023

felipe
melani
caso da venessa timestamps

10 ... 
/*
Listar o valor do produto mais caro.
Obter a média dos preços dos produtos.
Listar o nome dos produtos vendidos pela filial “f3”. (joins)
Listar os nomes e números de RG dos funcionários que moram no Rio Grande do Sul e tem salário superior a R$ 500,00. (joins)

MAX
Min
sum
avg
*/

select nome as produto, max(valor) as mais_alto
from produtos 
group by nome
order by mais_alto desc
limit 1

select nome as categoria, max(valor) as mais_alto
from categorias c inner join produtos 
    on c.id = p.produto_id
group by c.nome
order by valor_mais desc
limit 1

select nome as produto,
from produtos 
where valor = 
            (   select max(valor) 
                from produtos p
                where p.id = produtos.id)



from 


qual os 5 clientes que mais compraram em fev. de 23

select c.nome as cliente, sum(vp.qtd * vp.valor_unit) as valor_total_compra
from cleintes c    
        inner join vendas v
            ON v.cliente_id = c.id
        inner join vendas_produtos vp
            ON v.id = vp.venda_id
        inner join produtos p 
            on p.id = vp.produto_id
where v.data between '2023-02-01' and '2023-02-28' and  
        vp.valor_unit < p.valor
group by c.nome
having valor_total_compra > 5000

