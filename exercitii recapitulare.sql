create view ;
select * from comenzi;
select * from rand_comenzi;
select * from produse;
select p.categorie, count(c.id_produs) cantitate,sum(c.pret) as valoare
from rand_comenzi c join produse p
on p.id_produs=c.id_produs having sum(c.pret)>10000 
and count(c.id_produs)>50  group by p.categorie order by valoare desc;

select * from angajati;
select * from comenzi;
select c.id_angajat from comenzi c where
c.data between to_date('01.01.2018','dd-mm-yyyy') and to_date('01.01.2019','dd-mm-yyyy')
group by c.id_angajat having count(c.id_angajat)>3;


select id_angajat from comenzi group by id_angajat having count(id_angajat)>5;
update angajati 
set salariul=case
when id_angajat in(
select c.id_angajat from comenzi c where
c.data between to_date('01.01.2018','dd-mm-yyyy') and to_date('01.01.2019','dd-mm-yyyy')
group by c.id_angajat having count(c.id_angajat)>3)
then salariul*1.05
else salariul
end;
rollback;