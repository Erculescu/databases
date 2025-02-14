//Sa se afiseze numele angajatilor si sa se mareasca salariile in functie de departament astfel:
//Daca department_id= 20 atunci cresterea sa fie de 10%
//Daca department_id= 40 atunci cresterea sa fie de 15%
//Daca department_id= 60 atunci cresterea sa fie de 20%
//In rest sa nu se aplice cresteri salariale.
select * from angajati;
select nume, prenume, id_departament, salariul, case
when id_departament=20 then salariul*1.10
when id_departament=40 then salariul*1.15
when id_departament=60 then salariul*1.20
else salariul
end as salariul_nou
from angajati;


rollback;


/*Sa se afiseze numele, salariul si functia angajatiilor, precum si suma de incasat astfel: 
daca job_id este SA_REP sau SA_MAN atunci suma_incasat = salary* (1+commission_pct)
daca job_id este IT atunci  suma_incasat = salary*1.2
pentru celelalte functii  suma_incasat = salary
*/
select nume, prenume, id_functie, case
when id_functie like'SA%' then salariul*(1+comision)
when id_functie like'IT%' then salariul*1.2
else salariul
end as salariul_si_comision
from angajati;
/*Sa se acorde prime fiecarui angajat in functie de vechime astfel:
Pentru cei angajati inainte de 1 ianuarie 2010 prima=30%*salary
Pentru cei angajati inainte de 1 ianuarie 2013 prima=20%*salary
Pentru cei angajati inainte de 1 ianuarie 2015 prima=10%*salary
Pentru ceilalti angajati prima = 5%*salary
*/
Update angajati
set salariul = case
when data_angajare<'01-JAN-2010'then salariul*1.30
when data_angajare<'01-JAN-2013'then salariul*1.20
when data_angajare<'01-JAN-2015'then salariul*1.10
else salariul*1.06
end;
select * from angajati;
rollback;


//Sa se rezolve punctul de mai sus cu ajutorul operatorului UNION.
select nume,prenume,salariul, salariul*0.3 as prima
from angajati where data_angajare<'01-JAN-2010'
union 
select nume,prenume,salariul, salariul*0.2 as prima
from angajati where data_angajare>'01-JAN-2010' and data_angajare<'01-JAN-2013'
union
select nume,prenume,salariul, salariul*0.1 as prima
from angajati where data_angajare>'01-JAN-2013' and data_angajare<'01-JAN-2015'
union
select nume,prenume,salariul, salariul*0.05 as prima
from angajati where data_angajare>'01-JAN-2015';


//Sa se calculeze valoarea comisionului pentru fiecare angajat si folosind
//operatorul MINUS sa se elimine angajatii care nu au comision (este null).
select nume,prenume,salariul,comision,comision*salariul as valoare_comision from angajati
minus select nume,prenume,salariul,comision, comision*salariul as valoare_comison from angajati
where comision is null;

select * from angajati;
select id_manager as Superior_direct, count (id_manager) as nr_subalterni, sum(salariul) as salariu_per_subalterni from angajati
group  by id_manager;

select * from clienti;
update clienti
set limita_credit=limita_credit*1.10 where
nivel_venituri like 'H%';
rollback;

select * from produse;
update produse
set pret_lista=pret_lista*1.08
where categorie like 'hardware%';
rollback;

select categorie, sum(pret_lista) as valoare_stoc,avg(pret_lista) as pret_per_prod,count(pret_lista)
from produse group by categorie;

select* from departamente;
select * from locatii;
select a.denumire_departament, a.id_locatie, b.adresa from 
departamente a
join locatii b on a.id_locatie=b.id_locatie;



