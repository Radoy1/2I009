
select * from athlete;

select count(*) from Athlete;

select nom,prenom
from Athlete
where pays = 'Inde';

select prenom
from Athlete
where upper(nom)='GOLD';

select pays
from Athlete
where upper(nom) = 'AONO'
and lower(prenom) = 'ryo';

select r.nomAth,r.prenomAth
from RangEpreuve r
where r.rang = 1
order by r.sport,r.epreuve;

select distinct r.sport,r.epreuve,r.categorie,r.datefin
from RangEpreuve r
order by r.datefin;

select a.nom,a.prenom,a.datenaissance
from Athlete a
where a.pays = 'France' 
and extract(year from a.datenaissance)>=1995
and extract(year from a.datenaissance)<=2000;

select a.nom,a.prenom
from Athlete a, rangepreuve r
where a.pays = 'Suisse' and r.nomath=a.nom and a.prenom=r.prenomath
and r.sport='Biathlon' and r.rang is null;

select distinct r.epreuve
from Rangepreuve r,Rangepreuve r1
where r.rang=1 and r1.rang=1 and r.nomath<>r1.nomath and r.epreuve=r1.epreuve
and r.prenomath<>r1.prenomath and r.categorie=r1.categorie
and r.sport = r1.sport;
