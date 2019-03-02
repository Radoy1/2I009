select distinct s.nomsp
from sport s, epreuve e
where e.sid=s.sid
and 0=all(Select e1.datefin-e1.datedebut from Epreuve e1 where e1.sid = s.sid);

select s.nomsp
from sport s
where not exists( select * from epreuve where sid=s.sid
and lower(categorie)='mixte');

select distinct  e.eqid
from equipe e, athletesequipe ae
where ae.eqid=e.eqid
and not exists(select * from rangindividuel where rang <=3
and aid=ae.aid);

select p.nomp, a.datenaissance
from athlete a, pays p
where p.codepays=a.codepays
and a.datenaissance is not null
and not exists(select *from athlete where datenaissance > a.datenaissance
and datenaissance is not null);

select a.nomath, a.prenomath, p.nomp
from pays p, athlete a
where p.codepays=a.codepays
and a.datenaissance is not null
and not exists(select * from athlete where codepays=a.codepays
and datenaissance >a.datenaissance
and datenaissance is not null);

select e.neq
from equipef e, equipef p, match m
where lower(p.neq)='piepla'
and p.stp=m.st
and m.eq1= e.neq;

select m.st
from match m, equipef e, joueur j
where lower(j.njo)='manon messi'
and j.eq=e.neq
and m.eq1=e.neq;

select distinct m.Datem
from match m, equipef e,equipef e1, sponsorise s, sponsorise s1, joueur j,
joueur j1
where m.eq1 = e.neq
and m.eq2=e1.neq
and j.eq=e.neq
and j1.eq=e1.neq
and s.nsp=s1.nsp
and s.njo=j.njo
and s1.njo=j1.njo;

select distinct s.nsp
from sponsorise s, sponsorise s1, joueur j, joueur j1, match m, match m1,
dist d, equipef e, equipef e1
where m.eq1 = e.neq
and m1.eq1=e1.neq
and j.eq=e.neq
and m.datem=m1.datem
and j1.eq=e1.neq
and s.nsp=s1.nsp
and s.njo=j.njo
and s1.njo=j1.njo
and d.st1=m.st
and d.st2=m1.st
and d.nbkm<=50;
