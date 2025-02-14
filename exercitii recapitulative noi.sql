/*Sa se selecteze din tabela angaja?i numai angajatii care au salariul cuprins
intre 8000 si 10000.*/
select * from angajati where salariul between 8000 and 10000;

/*Sa se selecteze din tabela angajati numai angajatii care au functia SA_REP*/
select * from angajati where id_functie like ('%SA_REP%');

/*Sa se selecteze angajatii care sunt in acelasi departament cu angajatul Smith.*/
select * from angajati where id_departament like (select id_departament from angajati where nume
like ('%Smith%') group by id_departament);



/*Modificati conditia de sus astfel incat sa fie selectati
si cei care au in denumirea functiei atributul ACCOUNT*/
select * from angajati where id_departament like (select id_departament from angajati where nume
like ('%Smith%') group by id_departament) And id_functie like ('&AC_&');

/*S? se afi?eze produsele care au pre?ul unitar cel mai mic*/
select * from produse where pret_min=(select min(pret_min)from produse);

/*Sa se selecteze toti angajatii pentru care a doua litera din e-mail este A, B sau C.*/
select * from angajati where substr(email,2,1) in ('A','B','C');

/*Sa se selecteze toti angajatii care au numarul de telefon
format din al doilea grup de cifre din 123 (de exemplu: 515.123.4569)*/
select * from angajati where substr(telefon,5,3) in ('123');


/*Sa se selecteze toti angajatii angajati inainte de 1 ianuarie 2010 (data_angajare).*/
select * from angajati where data_angajare<to_date('01.01.2010','dd.mm.yyyy');

/*Modificati conditia de mai sus astfel incat sa
afisati numai salariatii angajati in ianuarie 2016.*/
select * from salariati where data_angajare<to_date('01.01.2016','dd.mm.yyyy') and
salariul is not null; 

/*Sa se selecteze numele, salariul, denumirea functiei angajatilor ?i denumirea 
departamentului pentru cei care lucreaza în departamentul IT. */
select * from departamente;
select a.nume,a.salariul, a.id_functie, d.denumire_departament from angajati a
join departamente d on a.id_departament=d.id_departament where a.id_functie like '%IT%';

/*Modificati conditia de mai sus astfel incat sa fie selectati toti angajatii din
departamentele care au in denumire specificatia IT, indiferent daca acestea au sau nu angajati.*/
select a.nume,a.salariul, a.id_functie, d.denumire_departament from angajati a
left join departamente d on a.id_departament=d.id_departament where a.id_functie like '%IT%';

/*Sa se afiseze toate comenzile, iar pentru comenzile directe sa se afiseze
numele angajatilor care le-au intermediat.*/
select c.id_comanda,c.data,c.modalitate,c.id_client,c.stare_comanda,
nvl(c.id_angajat,0) idAngajat_sau_0_pentru_comenzile_online, nvl(a.nume,'comanda realizata online') Vanzator
from comenzi c left join angajati a on c.id_angajat=a.id_angajat;

/*Sa se afiseze toate produsele indiferent daca acestea au fost comandate sau nu*/
select * from produse;

/*Afisati numele si in ordine crescatoare salariile si in ordine 
descrescatoare data angajarii pentru salariatii din departamentul vânz?ri (Sales).*/
select a.nume, a.salariul,a.data_angajare from angajati a join 
departamente d on a.id_departament=d.id_departament where denumire_departament like '%Sales%'
order by a.salariul asc ,a.data_angajare desc;


/*Sa se selecteze numele, functia,
comisionul si departamentul angajatilor care nu au comisionul NULL.*/
select a.nume, a.id_functie,a.comision,d.denumire_departament from angajati a join
departamente d on a.id_departament=d.id_departament where a.comision is not null;

/*Sa se afiseze numele, prenumele, functia si salariul angajatilor,
iar pe baza functiei sa se acorde fiecarui salariat un bonus, astfel: 
pentru IT_PROG – 5%, pentru AD_PRES – 10%, pentru celelalte functii – 1%*/
select nume, prenume,id_functie, (case
when id_functie like '%IT_PROG%' then salariul*1.05
when id_functie like '%AD_PRES%' then salariul*1.1
else salariul*1.01
end)as salariul
from angajati;





