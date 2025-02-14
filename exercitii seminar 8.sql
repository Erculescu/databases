select * from departamente;
select * from angajati;
/*--1. Sa se afiseze pentru fiecare departament: id-ul departamentului, denumirea 
departamentului si salariul mediu al angajatilor din cadrul acestora*/
select avg(a.salariul) as salariul_mediu, b.id_departament, b.denumire_departament from
angajati a join departamente b on a.id_departament=b.id_departament group by b.id_departament,b.denumire_departament;
/*. Sa se afiseze denumirile, salariile minime, maxime si medii pentru departamentele 
60, 70 si 80. Afisati doar departamentele care au mai mult de 5 angajati.*/
select b.denumire_departament, min(a.salariul),max(a.salariul), avg(a.salariul) from angajati a
join departamente b on a.id_departament=b.id_departament where a.id_departament in(60,70,80)
group by b.denumire_departament having count(a.salariul)>5;

/* Sa se afiseze numarul de produse existente din fiecare categorie*/
select * from produse;
select categorie, count(categorie) from produse group by categorie;

/*Sa se afiseze numarul de produse vandute din fiecare categorie*/
select * from comenzi;
select * from clienti;
select * from produse;

/*Sa se afiseze numarul de produse existente din fiecare grupa de produse (se vor analiza 
datele din tabela!!! categoriile sunt software1, software2...,
hardware1, hardware2... vrem grupare dupa software, hardware etc)*/
select case 
when categorie like 'software%' then 'software'
when categorie like 'hardware%' then 'hardware'
when categorie like 'office%' then 'office'
end as categorie_produse,
count (*) as numar_produse
from produse group by case
when categorie like 'software%' then 'software'
when categorie like 'hardware%' then 'hardware'
when categorie like 'office%' then 'office'
end;
/*Sa se afiseze valoarea fiecarei comenzi*/
select * from rand_comenzi;
select id_comanda, sum(pret) from rand_comenzi group by id_comanda;

/*Sa se afiseze valoarea fiecarei comenzi incheiate in anul 2020*/
select a.id_comanda,b.data,sum(a.pret) from rand_comenzi a join
comenzi b on a.id_comanda=b.id_comanda where data between to_date('01-JAN-2020','dd-mm-yyyy')
and to_date('01-JAN-2021','dd-mm-yyyy')
group by a.id_comanda, b.data;

/*Sa se afiseze valoarea fiecarei comenzi care contine mai mult de 10 produse*/
select id_comanda, sum(pret) as valoare_comanda,count(cantitate) from 
rand_comenzi group by id_comanda having count(cantitate)>10;

/*Sa se afiseze identificatorul si
data de incheiere pentru comenzile alcatuite din zece produse.*/
select a.id_comanda, a.data, count(b.id_comanda) from comenzi a join 
rand_comenzi b on a.id_comanda=b.id_comanda group by a.id_comanda,a.data
having count(b.cantitate)=10;
/*Sa se afiseze id_comanda si SUM(pret * cantitate) pentru cea mai valoroasa comanda.*/
select max(sum(pret*cantitate)) from rand_comenzi group by id_comanda;
select max(valoare_totala) from
(select sum(pret*cantitate) as valoare_totala from rand_comenzi
group by id_comanda)subquery;
/*Sa se creeze tabela ProduseSoftware cu aceeasi structura ca tabela 
Produse si care sa contina numai produsele din categoria software*/
create table Produse_software as select * from produse where 1=0;
insert into Produse_software select * from produse where categorie like 'software%';
select * from produse_software;
rollback;
drop table produse_software;
/*Sa se afiseze pentru fiecare angajat care a intermediat comenzi: identificatorul si numele, 
precum si numarul de comenzi si valoarea acestora*/
select * from angajati;
select * from rand_comenzi;
select a.id_angajat, a.nume,a.prenume, count(c.id_comanda)as numar_comenzi,
sum(rc.pret)as valoare_comenzi from angajati a
join comenzi c on a.id_angajat=c.id_angajat
join rand_comenzi rc on c.id_comanda=rc.id_comanda
group by a.id_angajat, a.nume, a.prenume;
