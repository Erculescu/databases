select * from comenzi;
select id_comanda,modalitate, stare_comanda from comenzi where 
extract (month from data)=3;
select * from angajati;
update angajati
set salariul= case
when id_departament = 50 then salariul+1000
when id_departament = 60 then salariul+1000
when id_departament = 100 then salariul+1000
when id_departament = 10 then salariul+1500
when id_departament = 20 then salariul+1500
when id_departament = 40 then salariul+1500
else salariul+500
end;
rollback;


//Sa se calculeze pe fiecare departament (department_name) suma totala corespunzatoare 
//salariilor angajatilor, denuminind coloana respectiva total_salarii.
select id_departament, sum(salariul) as total_salarii from
angajati group by id_departament;

//Sa se calculeze urmatoarele statistici pe fiecare tip de functie (job_title)
//: salariul minim, salariul mediu si salariul maxim corespunzator fiecarei functii.  

select id_functie, avg(salariul) as salariul_mediu, min(salariul) as salariul_minim, max(salariul) as salariul_maxim
from angajati group by id_functie;

//Modificati conditia de sus astfel incat sa se afiseze 
//si numarul total de angajati care detin o anumit functie.
select id_functie, avg(salariul) as salariul_mediu, min(salariul) as salariul_minim, max(salariul) as salariul_maxim, count(id_functie) as total_angajati
from angajati group by id_functie;

//Sa se calculeze numarul de angajati pe fiecare departament.
select id_departament, count(id_departament) as nr_angajati from angajati
group by id_departament;

select* from angajati;
//Sa se calculeze numarul de angajati din departamentele: Purchasing, Shipping, IT.
select id_functie, count (id_functie) as nr_angajati from angajati where
id_functie in ('SH CLERK','IT PROG','PU CLERK')
group by id_functie;

//Sa se calculeze numarul de salariati angajati inainte de 15 august 2015 (hire_date). 
select count(*) as nr_angajati from angajati
where data_angajare<'15-AUG-2015';

//Sa se afiseze doar departamentele care au un numar de angajati >5. 
//Sa se calculeze pentru aceste departamente suma total de plata referitoare la salarii.
select id_departament, sum(salariul)as total_salarii, count(id_departament) as total_angajati from angajati 
group by id_departament
having count(id_departament)>5;

//Sa se afiseze numai departamentele care platesc salarii totale cu valoarea mai mare de 20000. 
//Sa se calculeze pentru acestea salariul mediu pe department.
select id_departament, avg(salariul) as salariul_mediu,sum(salariul) as salariul_total from angajati
group by id_departament
having sum(salariul)>20000;

//Sa se calculeze pe fiecare functie in parte suma totala incasata formata din salariu * 
//(1+comisionul) aferent.Sa  se afiseze doar functiile cu valori peste 25000.
select * from angajati;
select id_functie, sum(salariul*(1+comision)) as salariu_si_comision from angajati
group by id_functie
having sum(salariul*(1+comision))>25000;

//Realizati o statistica pe fiecare department (department_id) si pe fiecare functie din
//departamente (job_id) referitoare la salariul minim, salariul mediu, salariul maxim 
//si numarul total de angajati.
select id_departament, id_functie, min(salariul) as salariul_minim, avg(salariul) as salariul_mediu, max(salariul) as salariul_maxim,
count(id_departament) as total_angajati from angajati group by id_departament, id_functie;

