--merge
--self-join
MERGE INTO salariati USING angajati 
ON (salariati.id_angajat = angajati.id_angajat)
WHEN MATCHED THEN 
UPDATE SET salariati.salariul=angajati.salariul
WHEN NOT MATCHED THEN
INSERT  (id_angajat, nume, salariul) VALUES (angajati.id_angajat, angajati.nume, angajati.salariul);
select * from salariati;
select count(*) from angajati;
select count(*) from salariati;
commit;
--jonctiune interna
select cl.id_client, nume_client, prenume_client,id_comanda,data from clienti cl,comenzi co where cl.id_client=co.id_client;

--jonctiune externa
select cl.id_client, nume_client, prenume_client,id_comanda,data from clienti cl,comenzi co where cl.id_client=co.id_client(+);
select cl.id_client, nume_client, prenume_client,id_comanda,data from clienti cl,comenzi co where cl.id_client(+)=co.id_client;
select c.id_comanda,data,denumire_produs,p.id_produs,pret,cantitate from comenzi c, produse p, rand_comenzi r where c.id_comanda=r.id_comanda and p.id_produs=r.id_produs order by data asc;


--self-join
SELECT a.nume||' lucreaza pentru: '||m.nume  "coloana mea"
FROM angajati a, angajati m
WHERE a.id_manager=m.id_angajat;
--I functii scalare (single-row)
--mai multe categorii:I.1 pt siruri de caractere,I.2 numerice
--I.3 date calendaristice, I.4 de conversie,I.5 pt gestionarea valorilor lipsa
--II Functii de grup
--I.1
--upper, lower,initcap, concat, length, instr,substr etc.
select * from angajati;
select upper(nume) from angajati;
select nume, prenume, concat(concat (concat(lower(prenume), '.'), lower(nume)),'@ase.ro')
from angajati;
select nume,replace(nume,' ','') from angajati;
select * from angajati where upper(nume)='KING';

--instr,substr
select nume, lower(substr(nume,1,3)) from angajati;
select nume, instr(nume,'a',3) from angajati;
