--sa se afiseze toate tabelele din schema utilizatori
select * from user_tables;
select* from tabs;
select * from angajati;
select count(*) nr_angajati from angajati;
--copia tabelei angajati;
create table salariati as select * from angajati where 1=2;
select * from salariati;
-- comanda INSERT -adauga inregistrari in tabele
--1) adaugare de valori pt toate coloanele tabelei
--insert into nume_tabela values (valori pentru toate coloanele tabelei in ordinea in care au fost definite 
--la crearea tabelei);
insert into salariati values (1,'Ion','Popescu','ion.popescu@ase.ro','0730072666',sysdate,'IT_PROG',10000,0.1,10,10);
describe salariati;
insert into salariati values(2,'Carmen','Braticevici','Braticeivicicarmen@ase.ro','070000000',sysdate,'Medic',20000,0.1,20,20);
--2) adaugare de valori pt anumite coloane din tabele;
--insert into nume_tabela (specificarea coloanelor pe care vrem sa le populam)
--values(valorile pentru coloanele specificate in prima lista);
insert into salariati(salariul,id_angajat, prenume,nume,data_angajare) values(9600,4,'Anca','Drumesi',to_date('01/AUG/2024','dd/MON/yyyy'));
commit;
rollback;
--3) adaugare de inregistrari in tabela destinatie prin preluarea acestora
--dintr-o tabela sirsa
--insert into nume_tabela_destinatie select */lista coloane from nume_tabela_sursa[where filtre];
insert into salariati select * from angajati where id_departament =50;
select count(*) from salariati;
--4) adaugare de valori cu ajutorul variabilelor de substitutie;
insert into salariati (id_angajat, nume) values(&id,'&nume');
select * from salariati order by 1;
commit;
-- comanda update;
--update nume_tabela;
--set nume_coloana="valoare"
--optional: [where filtrare]
update salariati
set salariul=7000;
--where id_angajat=6;
update salariati
set salariul=8000, comision=0.3
where id_angajat=6;
commit;
--stergerea inregistrarilor se face cu comanda DELETE
--delete from nume_tabela where filtrare;
delete from salariati where nume='Farcas';
rollback;
--ATENTIE LA TRUNCATE NU EXISTA AUTOCOMMIT!!!!
