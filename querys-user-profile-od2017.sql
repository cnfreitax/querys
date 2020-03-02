SELECT muni_dom, renda_fa FROM od2017 group by muni_dom;

select * from od2017;

insert into renda(muni_dom, sexo, idade, grau_ins, regiao, vl_ren_i, renda_fa) 
select muni_dom, sexo, idade, grau_ins, case when muni_dom = "São Paulo" then "Centro"
			when muni_dom ="Poá" then "Leste"
			when muni_dom ="Ferraz de Vasconcelos" then "Leste"
			when muni_dom ="Biritiba-Mirim" then "Leste"
            when muni_dom ="Itaquaquecetuba" then "Leste"
            when muni_dom ="Guararema" then "Leste"
            when muni_dom ="Suzano" then "Leste"
			when muni_dom ="Salesópolis" then "Leste"
            when muni_dom ="Mogi das Cruzes" then "Leste"
            when muni_dom ="Guarulhos" then "Nordeste"
            when muni_dom ="Arujá" then "Nordeste"
            when muni_dom ="Santa Isabel" then "Nordeste"
            when muni_dom ="Cajamar" then "Norte"
            when muni_dom ="Francisco Morato" then "Norte"
            when muni_dom ="Caieiras" then "Norte"
            when muni_dom ="Mairiporã" then "Norte"
            when muni_dom ="Franco da Rocha" then "Norte"
            when muni_dom ="Barueri" then "Oeste"
            when muni_dom ="Itapevi" then "Oeste"
            when muni_dom ="Santana de Parnaiba" then "Oeste"
            when muni_dom ="Jandira" then "Oeste"
            when muni_dom ="Cotia" then "Oeste"
			when muni_dom ="Carapicuiba" then "Oeste"
			when muni_dom ="Vargem Grande Paulista" then "Oeste"
            when muni_dom ="Osasco" then "Oeste"
            when muni_dom ="Pirapora do Bom Jesus" then "Oeste"
            when muni_dom ="Maua" then "Sudeste"
            when muni_dom ="Rio Grande da Serra" then "Sudeste"
            when muni_dom ="Diadema" then "Sudeste"
            when muni_dom ="São Bernardo do Campo" then "Sudeste"
            when muni_dom ="Santo André" then "Sudeste"
			when muni_dom ="Ribeirão Pires" then "Sudeste"
			when muni_dom ="São Caetano do Sul" then "Sudeste"
            when muni_dom ="São Lourenço da Serra" then "Sudoeste"
            when muni_dom ="Taboão da Serra" then "Sudoeste"
            when muni_dom ="Embu das Artes" then "Sudoeste"
            when muni_dom ="Itapecerica da Serra" then "Sudoeste"
            when muni_dom ="Embu-Guaçu" then "Sudoeste"
            when muni_dom ="Juquitiba" then "Sudoeste"
		else "nao especificado" end as "regiao", vl_ren_i, renda_fa
		from od2017;
                        

create table renda(muni_dom varchar (50), sexo varchar (15), idade int, grau_ins varchar (150), regiao varchar (20), vl_ren_i int, renda_fa decimal(10,2));
drop table renda;

select * from perfil_user;

select avg(renda_fa) from perfil_user where regiao = 'centro';
select avg(renda_fa) from perfil_user where regiao = 'oeste';
select avg(renda_fa) from pe where regiao = 'norte';
select avg(renda_fa) from renda where regiao = 'nordeste';
select avg(renda_fa) from renda where regiao = 'leste';
select avg(renda_fa) from renda where regiao = 'sudeste';
select avg(renda_fa) from renda where regiao = 'sudoeste';

select regiao, avg(renda_fa) as 'renda familiar media' from perfil_user group by regiao; 

select * from perfil_user order by grau_ins;
select * from perfil_user group by grau_ins;

/*Media da renda salarial de pessoal com o ensino medio completo e media da 
renda familiar de pessoas não alfabetizadas*/
select regiao, avg(renda_fa) as 'media ensino superior' from perfil_user where grau_ins = 'Superior Completo' group by regiao;
select regiao, avg(renda_fa)  as 'não alfabetizados' from perfil_user where grau_ins = 'Não-Alfabetizado/Fundamental I Incompleto' group by regiao;

/*Media da renda salarial de pessoal com o ensino medio completo e media da 
renda familiar de pessoas não alfabetizadas dividido por sexo*/
select regiao, avg(renda_fa) as 'media ensino médio completo - feminino' from perfil_user where grau_ins = 'Superior Completo' and sexo ='feminino' group by regiao;
select regiao, avg(renda_fa) as 'media ensino médio completo - masculino ' from perfil_user where grau_ins = 'Superior Completo' and sexo ='masculino' group by regiao;

select count(sexo) / sum(renda_fa) as porcentagem from perfil_user group by sexo;

select  sexo, count(sexo) quantidade_usuarios from perfil_user group by sexo, regiao;

select count(*) from perfil_user;
select count(*) from perfil_user where sexo ='Masculino';
select count(*) from perfil_user where sexo ='Feminino';

/*percentual quntidade sexo*/
select sexo, count(sexo) / 183093 * 100 as perc from perfil_user where sexo = 'Masculino';
select sexo, count(sexo) / 183093 * 100 as perc from perfil_user where sexo = 'Feminino';

select sexo, count(sexo) / 183093 *100 as percentual from perfil_user group by sexo;


