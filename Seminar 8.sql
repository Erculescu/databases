--functii ierarhice
--select cd(s),level,SYS_CONNECT_BY_PATH(), CONNECT_BY_ISLEAF(poate returna fie 1 fie 0),
--CONNECT_BY_ISCYCLE, CONNECT_BY_ROOT,ETC
--FROM (sursa datelor) tabela(s)
--{WHERE   }  + CONNECT BY (daca folosim connect_by_iscycle){nocycle} {prior}nod_copil={prior}nod_parinte;
--[START WITH NOD_RADACINA]
--acum deseneaza profa un arbore
select id_angajat,lpad(' ',level)|| nume,level,level-1 nr_manageri,
connect_by_root(id_angajat)
from angajati
connect by prior id_angajat=id_manager
start with id_angajat=100
order siblings by nume;


select id_angajat, nume,connect_by_isleaf, connect_by_iscycle
from angajati 
where connect_by_isleaf=1--connect_by_isleaf=0 inseamna ca are subordonati
connect by nocycle prior id_angajat=id_manager
start with id_angajat=100;



select id_angajat, nume,connect_by_isleaf, connect_by_iscycle
from angajati 
--where id_departament=(select id_departament from angajati where id_angajat=109)
connect by nocycle id_angajat=prior id_manager
start with id_angajat=100;

select id_angajat, nume,connect_by_isleaf, connect_by_iscycle,level,
sys_connect_by_path(nume,'/')
from angajati 
--where level not in (2,4)
--level=(select max(level) from angajati connect by nocycle prior id_angajat=id_manager)
--3 and connect_by_isleaf=0
connect by nocycle prior id_angajat=id_manager
start with id_angajat=100;

/*update angajati
set id_manager=109
where id_angajat=100;*/
rollback;

select id_angajat, nume,id_functie,id_departament
from angajati
where (id_functie,id_departament) in (select id_functie,id_departament from angajati where nume='Abel');
--Best practice: folositi "in" in where!!!!!

select * from angajati;

select (select count(*)from comenzi) numar_total_comenzi,
(select count(*) from clienti) nr_tot_clienti,
(select sum(salariul) from angajati) suma_salarii
from dual;

--select poate fi folosit in acelasi timp cu:create, insert si chiar si update, select where, select, select from;

update angajati
set salariul = 10000
where id_departament not in (select id_departament from angajati where nume='Kochhar');