--numele unei coloane, sau pozitia coloanei in afisare
--ce rol are select? Afisam rezultatele unei baze de date
select id_angajat id,nume nume, salariul sal from angajati order by sal DESC, nume asc;
select* from angajati where salariul>10000 and id_departament in (90,80) and comision is not null;
select * from angajati where nume like 'B%';
--distinct ne permite sa implementam proiectia
select distinct id_functie, salariul from angajati ;
--Jonctiune-- Jonctiunea simpla returneaza inregistrarile comune din ambele departamente
select nume, prenume,dep.id_departament, denumire_departament from angajati ang,departamente dep where ang.id_departament=dep.id_departament;
--jonctiune externa in care afisez toti angajatii
select nume, prenume,dep.id_departament, denumire_departament from angajati ang,departamente dep where ang.id_departament=dep.id_departament(+);
select nume, prenume,dep.id_departament, denumire_departament from angajati ang,departamente dep where ang.id_departament(+)=dep.id_departament;

