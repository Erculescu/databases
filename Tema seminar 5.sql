CREATE TABLE DEP(
ID NUMBER(7) PRIMARY KEY,
DENUMIRE VARCHAR2(25));
SELECT * FROM DEP;
SELECT * FROM DEPARTAMENTE;
INSERT INTO DEP(ID,DENUMIRE)
SELECT ID_DEPARTAMENT,DENUMIRE_DEPARTAMENT
FROM DEPARTAMENTE;



CREATE TABLE ANG(
ID NUMBER(7) PRIMARY KEY,
PRENUME VARCHAR2(25),
NUME VARCHAR2(25),
DEP_ID NUMBER(7),
CONSTRAINT FK_ID FOREIGN KEY (DEP_ID) REFERENCES DEP (ID));
SELECT * FROM ANG;
ALTER TABLE ANG
ADD VARSTA NUMBER(2);
ALTER TABLE ANG
ADD CONSTRAINT CK_VARSTA CHECK (VARSTA BETWEEN 18 AND 65);
ALTER TABLE ANG
DROP CONSTRAINT CK_VARSTA;
ALTER TABLE ANG
MODIFY NUME VARCHAR2(30);
RENAME ANG TO ANG2;
SELECT* FROM ANG2;


SELECT* FROM ANGAJATI;
create table salariati as select * from angajati where 1=2;
select * from salariati;
INSERT INTO SALARIATI(ID_ANGAJAT,PRENUME,NUME,EMAIL,TELEFON,DATA_ANGAJARE,ID_FUNCTIE,SALARIUL,COMISION,ID_MANAGER,ID_DEPARTAMENT)
VALUES (1,Steven,Kong,SKONG,5151234567,17-06-1987,AD_PRES,24000, 0.1," ",90),
(2,Neena,Koch,NKOCH,5151234568,21-09-1989,AD_VP,17000,0.1,100,90),
(3,Lex,Haan,LHAAN,5151234569,13-01-1993,AD_VP,17000,0.2,100,90);
UPDATE SALARIATI
SET PRENUME='JOHN'
WHERE ID_ANGAJAT=3;
UPDATE SALARIATI
SET EMAIL='JHAAN'
WHERE ID_ANGAJAT=3;
UPDATE SALARIATI
SET SALARIUL=SALARIUL * 1.10
WHERE SALARIUL<20000;
UPDATE SALARIATI
SET ID_FUNCTIE='AD_PRES'
WHERE ID_ANGAJAT=2;
UPDATE SALARIATI
SET COMISION=(SELECT COMISION FROM SALARIATI WHERE ID_ANGAJAT=3)
WHERE ID_ANGAJAT=2;