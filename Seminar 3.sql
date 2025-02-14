--user_tables=tabs
--user_constraints
--gestionate de SGBD
select * from tabs;
select * from user_constraints where table_name= 'AGENTI_PAZA';
/*STRUCTURA = ATRIBUTE(COLOANE)+RESTRICTII DE INTEGRITATE
*/
describe agenti_paza;
alter table agenti_paza add locatie varchar2(10);
alter table agenti_paza add (atribut1 varchar2(10), atribut2 number(2));
alter table agenti_paza rename column atribut1 to atribut_nou;
alter table agenti_paza modify locatie varchar2(20);
alter table agenti_paza drop column atribut2;
alter table agenti_paza rename constraint SYS_C00303214 to NN_PRENUME;

alter table agenti_paza modify constraint nn_prenume DISABLE;
alter table agenti_paza modify constraint nn_prenume ENABLE;
alter table agenti_paza add constraint uq_locatie unique(locatie);
describe firme;
select* from user_constraints where table_name='FIRME';
alter table firme add constraint nn_denumire_firma check (den_firma is not null);
alter table firme drop constraint nn_denumire_firma;
alter table agenti_paza rename to agenti;
select* from agenti;
rename agenti to agenti_paza;
drop table firme cascade constraints;
select * from tabs;
flashback table firme to before drop;
select* from agenti;
select* from user_constraints where table_name='CONTRACTE';
alter table contracte add constraint fk_ID_FIRMA foreign key (ID_FIRMA) references firme(ID_FIRMA);