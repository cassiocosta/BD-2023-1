
-- qual cliente comprou no mes de fevereiro na filial de Torres?
-- mostrar o nome da filial, o código da venda, a data e o nome do cliente.
select 	f.nome as filial, v.id, v.data, c.nome as cliente
from filial f
		inner join  vendas v
			ON	f.id = v.filial_id
		inner join clientes c
			ON c.id = vendas.cliente_id
where v.data>='2023-02-01' and v.data <='2023-02-28' and
		f.id =100 -- 100 é a filial de Torres
            
filial			id		data			cliente
torres			100		2023-01-02		Silva


-- quantas vendas no mes de fevereiro? 
select count(id) as quantas_vendas
from vendas
where v.data>='2023-02-01' and v.data <='2023-02-28'

quantas_vendas
1000
-- quantas vendas no mes de fev por filial? Mostre o nome da filial
select f.nome as filal, count(v.id) as quantas_vendas
from filial f
		inner join  vendas v
			ON	f.id = v.filial_id
where v.data>='2023-02-01' and v.data <='2023-02-28'            
group by f.nome    
order by quantas_vendas ASC
limit 1


filial		quantas_vendas
torres		1022
Imbé		650
AS			500
sombrio		240


-- altera o sql para mostrar somente a filial que mais tem vendas.?



-- quais produtos foram vendidos no mes de fevereiro de 23... Deve apresentar 

o código, o nome do produto

codigo		produto
100			alface  
200			garrafa água
300			alcool gel

select distinct  p.id as codigo, p.nome as produto
from vendas v 
        inner join vendas_produtos vp
            ON v.id = vp.venda_id
        inner join produto p
            ON p.id = vp.produto_id
where v.data>='2023-02-01' and v.data <='2023-02-28'  

-- me mostra também da consulta anterior, qual foi o total de vendas de cada produto.
codigo		produto             total_vendas
100			alface              450.0
200			garrafa água        1200.99
300			alcool gel          3400.0

total.. quant. * valor unit

select  p.id as codigo, p.nome as produto, sum(vp.qtd * vp.val_unit) as total
from vendas v 
        inner join vendas_produtos vp
            ON v.id = vp.venda_id
        inner join produto p
            ON p.id = vp.produto_id
where v.data>='2023-02-01' and v.data <='2023-02-28'  
group by p.id, p.nome

codigo		produto             total_vendas
100			alface              450.0
200			garrafa água        1200.99
300			alcool gel          3400.0

-- da consulta anterior pega somente os produtos onde o total da venda é maior que 1000
select  p.id as codigo, p.nome as produto, sum(vp.qtd * vp.val_unit) as total
from vendas v 
        inner join vendas_produtos vp
            ON v.id = vp.venda_id
        inner join produto p
            ON p.id = vp.produto_id
where v.data>='2023-02-01' and v.data <='2023-02-28'  
group by p.id, p.nome
having total > 1000

codigo		produto             total_vendas
200			garrafa água        1200.99
300			alcool gel          3400.0

-- blza mostra somente os 5 que mais venderam?
select  p.id as codigo, p.nome as produto, sum(vp.qtd * vp.val_unit) as total
from vendas v 
        inner join vendas_produtos vp
            ON v.id = vp.venda_id
        inner join produto p
            ON p.id = vp.produto_id
where v.data>='2023-02-01' and v.data <='2023-02-28'  
group by p.id, p.nome
having total > 1000
order by total desc
limit 5

-- blza.. agora me lista o segiunte:
    -- desse 5 maiores mas considera somente onde o produto custou mais que  100... 

select  p.id as codigo, p.nome as produto, sum(vp.qtd * vp.val_unit) as total
from vendas v 
        inner join vendas_produtos vp
            ON v.id = vp.venda_id
        inner join produto p
            ON p.id = vp.produto_id
where v.data>='2023-02-01' and v.data <='2023-02-28'  and 
        vp.valor_unit > 100
group by p.id, p.nome
having total > 1000
order by total desc
limit 5


-- agora blza.. eu quero uma projeção de vendas .. somente as vendas de fev 23
-- mas considere o valor atual do produto.
codigo		produto             total_vendas
200			garrafa água        1200.99
300			alcool gel          3400.0


select  p.id as codigo, p.nome as produto, 
            sum(vp.qtd * vp.val_unit) as total_historico,
            sum(vp.qtd * p.val_unit) as total_se_venda_hoje
from vendas v 
        inner join vendas_produtos vp
            ON v.id = vp.venda_id
        inner join produto p
            ON p.id = vp.produto_id
where v.data>='2023-02-01' and v.data <='2023-02-28'
group by p.id, p.nome
having total > 1000
order by total desc
limit 5





