
-- exemplos stored procedure
DELIMITER $$
CREATE PROCEDURE getDatetime()
BEGIN
	
	select current_timestamp();
    
END $$
DELIMITER ;



call getDateTime();

drop procedure getPersonByName;
DELIMITER $$
CREATE PROCEDURE getPersonByName(name VARCHAR(50))
BEGIN

	select * 
	from pessoas
	where nome like concat('%',name,'%');

END $$
DELIMITER ;

call getPersonByName('la');

drop procedure cud_pessoas;
DELIMITER $$
CREATE PROCEDURE cud_pessoas(p_id int, p_nome VARCHAR(100), p_oper char(1))

BEGIN
declare operar char(1);

set operar = 1;


while(operar<>1)

end

	if(p_oper = '1' )then
		-- insert
        insert into pessoas(nome) value(p_nome);
        select concat(p_nome,'inserido com sucesso') as retorno;
    elseif(p_oper='2') then
		-- update
        update pessoas set nome = p_nome where id = p_id;
    elseif(p_oper='3') then
		-- delete
        delete from pessoas where id = p_id;
        select concat('pessoa do id', p_id,'deletado com sucesso') as retorno;
	else
		select 'insira 1 para insert, 2 para update e 3 para delete' as retorno;
    end if;

END $$
DELIMITER ;


call cud_pessoas(0,'Gisa',1);
call cud_pessoas(7,'gisa castro alves',2);

select * from pessoas


--


--exercício tabuada do
DELIMITER $$
    CREATE PROCEDURE tabuada(num int )
    BEGIN
    declare i int;
    declare resultado int;
    declare contem int;
    set contem = ( select count(tabuada) from tabuada where tabuada= num);
        if contem = 0 then
            set i = 0;
            while i<=10 do
                set resultado = 0;
                    select concat(num,' x ',i,'=', i*num);
                set resultado = i*num;
                    insert into tabuada(result,tabuada) value (resultado,num);
set i = i+1;
            end while;
        else 
            select * from tabuada where tabuada = num;
        end if;
    END $$
DELIMITER ;