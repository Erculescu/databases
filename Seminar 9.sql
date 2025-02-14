--union,intersect,minus
--union all, union
select prenume prenume_ang_sau_client,id_departament from angajati
where prenume='Kevin'
union all
select prenume_client,null from clienti
where prenume_client = 'Kevin';
select* from clienti;
--intersect sau minus
select nume,id_departament,salariul,comision,12*salariul*(1+nvl(comision,0)) venit_anual
from angajati
minus
select nume,id_departament,salariul,comision,12*salariul venit_anual
from angajati;
select* from angajati;
--sa se afiseze doar acele departamente (id_departament, denumire_departament)
--in care toti angajatii au salariul peste 10000
--Prima medoda de rezolvare:
select a.id_departament,denumire_departament from angajati a, departamente d
where a.id_departament=d.id_departament 
minus
select a.id_departament,denumire_departament from angajati a, departamente d
where a.id_departament=d.id_departament and salariul<10000;
--A doua metoda 
select a.id_departament,denumire_departament from angajati a, departamente d
where a.id_departament=d.id_departament and a.id_departament not in (select distinct id_departament from angajati
where salariul<10000);

--A treia incercare
select d.id_departament,denumire_departament from angajati a, departamente d
where a.id_departament=d.id_departament group by d.id_departament,denumire_departament
having max(salariul)>10000;

select* from produse;

select p.id_produs,id_comanda, denumire_produs,categorie,pret,cantitate
from produse p /*left join*/, rand_comenzi r
where p.id_produs=r.id_produs(+);
--on p.id_produs=r.id_produs;


select categorie, sum(pret* cantitate)
from produse p,rand_comenzi r
where p.id_produs=r.id_produs
group by categorie
order by 1;

select cl.id_client, nume_client, sum(pret*cantitate) val_totala_comenzi,
case when sum(pret*cantitate)<50000 then '3%'
when sum(pret*cantitate) between 50001 and 100000 then '10%'
when sum(pret*cantitate) between 100001 and 200000 then '30%'
when sum(pret*cantitate) between 200001 and 300000 then '40%'
else '50%' end discount
from clienti cl,rand_comenzi r, comenzi co
where cl.id_client=co.id_client and co.id_comanda=r.id_comanda
group by cl.id_client, nume_client
--having sum(pret*cantitate)<1000
order by 3 desc;