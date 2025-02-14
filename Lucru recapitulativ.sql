select * from departamente;
select d.denumire_departament, avg(a.salariul) Salariu from departamente d 
join angajati a on
a.id_departament=d.id_departament where a.id_departament
not in (select a.id_departament from angajati a where id_departament like '%30%')
group by d.denumire_departament order by salariu desc;

select * from angajati;
select * from comenzi;
update angajati a set
a.salariul= case when a.id_angajat not in (select id_angajat from comenzi group by id_angajat) 
and a.salariul>(select avg(salariul) from angajati) then salariul*0.95
else salariul
end;
rollback;

SELECT LEAST(COUNT(comision) + 100)
FROM angajati;


select * from locatii;
select * from departamente;
select l.id_tara,count(*) from departamente d join locatii l
on d.id_locatie=l.id_locatie group by  l.id_tara;

select id_tara, count(*) nr_dep from locatii l join departamente d on
l.id_locatie=d.id_locatie group by id_tara;


select *from tari;
select tari.denumire_tara, locatii.oras from tari join locatii on locatii.id_tara=tari.id_tara;

select * from istoric_functii;

SELECT 
    a.ID_ANGAJAT,
    a.PRENUME,
    a.NUME,
    LISTAGG(f.DENUMIRE_FUNCTIE, ', ') WITHIN GROUP (ORDER BY i.DATA_INCEPUT) AS JOBS
FROM 
    ANGAJATI a
JOIN 
    ISTORIC_FUNCTII i ON a.ID_ANGAJAT = i.ID_ANGAJAT
JOIN 
    FUNCTII f ON i.ID_FUNCTIE = f.ID_FUNCTIE
GROUP BY 
    a.ID_ANGAJAT, a.PRENUME, a.NUME;

select a.id_angajat,a.nume,a.prenume, listagg(f.denumire_functie, '->') within group
(order by i.data_inceput) as Functii from angajati a join istoric_functii i on
a.id_angajat=i.id_angajat join functii f on i.id_functie=f.id_functie group by
a.id_angajat, a.nume,a.prenume;

