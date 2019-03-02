create table employe(

numss numeric(15),
nomE varchar(20),
prenomE varchar(20),
villeE varchar(20),
DateNaiss date NOT NULL,

constraint pk_emp primary key(numss),
constraint ville_in check(lower(villeE) in ('lyon','marseille','paris')
);

create table projet(

numproj numeric(7),
nomproj varchar(20),
respproj numeric(15),
villep varchar(20),
budget numeric,

primary key(numproj),
foreign key(respproj) references employe(numss)
);

create table embauche(

numss numeric(15),
numproj numeric,
dateemb date default sysdate,
profil varchar(20),

primary key(numss,numproj),
foreign key(numss) references employe(numss),
foreign key(numproj) references projet(numproj),
foreign key(profil) references grille_sal(profil)
);

create table grille_sal(

Profil varchar(20),
salaire numeric,

primary key(profil)
);
