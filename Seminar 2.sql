-- comentariu
/*create table nume_tabela(atribut1 tip_data[restrictie],
atribut2 tip_data[restrictie],
...,
[alte restrictii]
);
*/
/*create table agenti_paza(id_agent number(3) primary key,
nume varchar2(10) not null,
prenume varchar2(10)not null,
cnp char(13) unique,
data_nasterii date,
gen char(1),
nivel_echipare varchar(20),
constraint check ck_gen (gen in('M','F')),
constraint check ck_data_nasterii (data_nasterii between to_date('01.01.1970','dd.mm.yyyy') and to_date('01.01.2002','dd.mm.yyyy'))
);*/
-- Create a table for security agents
CREATE TABLE agenti_paza (
    id_agent NUMBER(3) PRIMARY KEY,
    nume VARCHAR2(10) NOT NULL,
    prenume VARCHAR2(10) NOT NULL,
    cnp CHAR(13) UNIQUE,
    data_nasterii DATE,
    gen CHAR(1) CHECK (gen IN ('M', 'F')),
    nivel_echipare VARCHAR(20),
    CONSTRAINT ck_data_nasterii CHECK (data_nasterii BETWEEN TO_DATE('01.01.1970', 'dd.mm.yyyy') AND TO_DATE('01.01.2002', 'dd.mm.yyyy'))
);
drop table agenti_paza;
create table firme(
id_firma number(2), den_firma varchar(20),
zona_geo varchar2(12),
cui char(9),
constraint pk_id_firma primary key (id_firma),
constraint ck_zona_geo check (zona_geo in('Moldova','Transilvania','Muntenia','Banat','Bucovina'))
);
create table contracte(
id_agent number(3),
id_firma number(2),
data_angajarii date,
salariu number(5),
constraint pk_contracte primary key(id_agent,id_firma),
constraint fk_id_agent foreign key(id_agent) references agenti_paza(id_agent),
constraint fk_id_firma foreign key(id_firma) references firme(id_firma)
);