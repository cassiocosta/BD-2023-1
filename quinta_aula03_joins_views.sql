-- mostrar todos as editoras que nao tem livros cadastrados

select livros.id, livros.titulo, editoras.nome as editora
from livros 
        RIGHT JOIN editoras
           on livros.id_editora = editoras.id
where id_editora IS NULL


-- EU tenho uma modelagem assim:
/*
um cleinte tem muitas vendas 
uma venda tem muitos produtos
um produto pode estar em muitas vendas

Vendas pode ter muitas formas formas de pagamento
Forma de pgto pode estar em muitas vendas.

1- quantas tabelas eu tenho aqui?
cliente(id, nome)
produtos(id, nome)
vendas (id, data, id_cliente)
vendas_produtos(id_venda, id_produto, quant, valor_unit)
formas_pgto(id, nome)
vendas_formas_pgtos(id_venda, id_forma_pgto,valor, quantas_vezes)
*/

-- Listar todos os produtos vendidos no mes de fev. de 2023

select  p.nome as produto, sum(vp.qtd) as qtd_vendida, 
        sum(vp.qtd * vp.val_unit)as valor_total
from    vendas v
            join vendas_produtos vp
                on v.id = pv.venda_id
            join produtos p
                on vp.produto_id = p.id
where v.data>='2023-02-01' and v.data<='2023-02-28'
group by p.nome
order by valor_total desc
limit 1

id      produto     qtd_vendida     valor_total
100     coca cola   1000            2500
101     mouse       20              450
102     pasta       100             200

-- listar o valor total de vendas por forma de pagamento no mes de fev. 23
deve retornar
forma_pgto  total
dinheiro    10000
cartao      40000
crediario   0
cheque      0

select f.nome as forma_pgto, coalesce(sum(vfp.valor),0) as total
from formas_pgto f
        left join vendas_formas_pgtos vfp
            on f.id = vfp.id_forma_pgto
        left join vendas v
            on v.id = vfp.id_venda
where v.data>='2023-02-01' and v.data<='2023-02-28' -- (usou o between)
group by f.nome

