-- exemplo procedures

drop procedure getDateTime;

DELIMITER $$
CREATE  PROCEDURE getDatetime()
BEGIN
	
	select concat('A data atual é: ',current_timestamp) as retorno;
    
END $$
DELIMITER ;

call getDateTime();

drop procedure getDateTime;
DELIMITER $$
CREATE  PROCEDURE getPersonByName(name varchar(50))
BEGIN
	
	select * from pessoas where nome like concat('%',name,'%');
    
END $$
DELIMITER ;

call getPersonByName('la');
-- ---------------------------------------------
------------------------------------------------

drop procedure crudPerson;
DELIMITER $$
CREATE  PROCEDURE crudPerson(p_id int, p_name varchar(50), p_oper char(1))
BEGIN
	declare v_nome varchar(50);
	if(p_oper = 'I') then
		insert into pessoas(nome) values(p_name);
    elseif(p_oper='U') then
		update pessoas set nome = p_name where id=p_id;
        select * from pessoas where id=p_id;
    elseif(p_oper='D') then
		set v_nome = (select nome from pessoas where id=p_id);
        delete from pessoas where id = p_id;
        
        select concat('A pessoa ',v_nome,' foi excluida com sucesso.') as mensagem;
	else 
		select 'Informe I para inserir, U para atualizar. ou D para deletar. Obri.' as error;
    end if;
    
END $$
DELIMITER ;


call crudPerson(8,'Francisco xypz teste','U');
call crudPerson(8,'','D');


call taboadaDo(5);

numero, resultado
5		5x1=5
5		5x2=10
5		5x3=15

while(condicao)do


end while


select * from pessoas


---------------------------------------------
---------------------------------------------


-- exercício da tabuada... feita pelo carlos.. ops marcus hehe
DELIMITER $$
CREATE PROCEDURE tabuada (IN p_numero INT)
BEGIN

    DECLARE contador INT DEFAULT 1;
    DECLARE resultado INT;
    DECLARE jaExiste INT;
    
    CREATE TABLE IF NOT EXISTS procedures.tabuada 
    (
		numero INT NOT NULL,
		multiplicador INT NOT NULL,
		resultado INT NOT NULL,
		PRIMARY KEY (numero, multiplicador)
	);

    SET jaExiste = (SELECT COUNT(numero) FROM procedures.tabuada WHERE numero = p_numero);
    IF (jaExiste = 0) THEN
		WHILE (contador <= 10) DO
			INSERT INTO tabuada (numero, multiplicador, resultado)
			VALUES (p_numero, contador, p_numero * contador);
			SET contador = contador + 1;
		END WHILE;
    END IF;
    SELECT * FROM procedures.tabuada WHERE numero = p_numero;
END $$
DELIMITER ;