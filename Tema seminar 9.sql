/*Exercitiul 1*/
select * from angajati where salariul between 8000 and 10000;
/*Exercitiul 2*/
select * from angajati;
select * from angajati where id_functie='SA_REP';
/*Exercitiul 3*/
describe angajati;
select * from angajati
where id_departament=(select id_departament from angajati where nume='Smith' and rownum=1);
/*Exercitiul 4*/
select * from produse;       
select * from produse
where pret_min = (select min(pret_min) from produse);
/*Exercitiul 5*/
select * from angajati where id_functie like '%ACCOUNT%' or 
id_departament=(select id_departament from angajati where nume='Smith' and rownum=1);
/*Exercitiul 6*/
select * from angajati where substr(email,2,3) in ('A','B','C');
/*Exercitiul 7*/
select * from angajati;
select * from angajati where substr(telefon,5,3)='123';
/*Exercitiul 8*/
select * from angajati;
select * from angajati where data_angajare < to_date('01.01.2024','dd.mm,yyyy');
/*Exercitiul 9*/
select * from angajati where data_angajare >= to_date('01.01.2000','dd.mm,yyyy') and 
 data_angajare <to_date('01.02.2024','dd.mm,yyyy') ;
/*Exercitiul 10*/
describe departamente;
select * from departamente;
select a.nume, a.salariul, a.id_functie, a.id_departament
from angajati a
join departamente d on a.id_departament=d.id_departament
where denumire_departament = 'IT';
/*Exercitiul 11*/
select a.nume, a.salariul, a.id_functie, a.id_departament
from departamente d
left join angajati a on a.id_departament = d.id_departament
where d.denumire_departament like '%IT%';
/*Exercitiul 12*/
describe comenzi;
select * from comenzi;
select c.id_comanda, c.data, c.modalitate, c.id_client, c.stare_comanda,
       case 
           when c.modalitate = 'direct' then 'F?r? angajat'
           else a.nume
       end as nume_angajat_intermediar
from comenzi c
left join angajati a on c.id_angajat = a.id_angajat;
/*Exercitiul 13*/
describe produse;
select * from produse;
select p.id_produs, p.denumire_produs
from produse p
left join comenzi c on p.id_produs = c.id_produs;
/*Exercitiul 14*/
select a.nume, a.salariul, a.data_angajare
from angajati a
join departamente d on a.id_departament = d.id_departament
where d.denumire_departament = 'Sales'
order by a.salariul , a.data_angajare desc;
/*Exercitiul 15*/
describe angajati;
select * from angajati;
select nume, id_functie, comision,id_departament
from angajati
where comision is not null;