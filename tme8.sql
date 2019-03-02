create table Employe(
numss number(5),
nomE varchar2(20),
prenomE varchar2(20),
villeE varchar2(20),
datnaiss date,
datecour date default sysdate,
constraint pk_emp primary key(numss),
constraint format_uss check(length(numss)=5),
constraint ville_emp check (lower(villeE) in ('paris', 'lyon', 'marseille')),
constraint limite_age check (((datecour-datnaiss)/365) <70)
);

create table Projet(
numProj number,
nomProj varchar2(20),
respProj number(5),
villep varchar2(20),
budget number(6),
constraint pk_proj primary key(numProj),
constraint uniq_nomProj unique(nomProj),
constraint format_num check(numProj between 10000 and 99999999),
constraint villep check(lower(villep) in ('paris','lyon','marseille')),
constraint fk_resp foreign key( respProj) references Employe(numss)
);

create table grille_sal(
profil varchar2(20) primary key,
sal number(7,2),
constraint sal_max check (sal<=90000));

create table embauche(
numss number(5),
numproj number,
dateemb date default sysdate,
profil varchar2(20),
constraint fk_profil foreign key(profil) references grille_sal(profil),
constraint fk_numss foreign key(numss) references Employe(numss),
constraint fk_numproj foreign key(numproj) references Projet(numProj),
constraint pk_emb primary key(numss,numProj)
);
/*
insert into employe values('21456','LORENZO','Gianluigi','lyon', to_date('25-03-1997'), sysdate);
insert into Projet values(246454, 'Revonsgrand' ,'21456','lyon', 100000);
insert into employe values('21521','KOLAROV','Dimitri','marseille', to_date('25-03-1977'), sysdate);
insert into Projet values(26454, 'blue moon' ,'21521','marseille', 100000);
insert into grille_sal values('Ingenieur parfait',89999.99);
insert into grille_sal values('Ingenieur vite fait',00199.99);
insert into embauche values(21456,246454,sysdate,'Ingenieur parfait');
insert into embauche values(21521,26454,sysdate,'Ingenieur vite fait'); 
*/

