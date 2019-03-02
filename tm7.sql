select s.nomsp, count(*) as nbmedailles
from Sport s, RangIndividuel r , Epreuve e
where s.sid = e.sid and e.epid = r.epid and r.rang <= 3
group by s.sid,s.nomsp
order by nbmedailles desc;

select p.nomp, s.nomsp, count(*) as nbmedailles
from Sport s, RangIndividuel r, Pays p, Epreuve e , Athlete a
where s.sid = e.sid and e.epid = r.epid and r.rang <= 3
and a.codepays = p.codepays and a.aid=r.aid
group by s.sid,s.nomsp,p.nomp,p.codepays
order by nbmedailles desc;

select s.nsp, count(distinct e.neq) as nbequipe
from Sponsorise s, Joueur j,Equipef e
where j.eq = e.neq and j.njo = s.njo
group by s.nsp
having count(distinct e.neq) = (select count(*) from equipef);

select distinct s.nsp
from Sponsorise s, Joueur j,EquipeF e
where s.njo=j.njo and e.neq=j.eq
group by s.nsp
having count(s.njo)=count(distinct j.eq);

select e.neq, sum(d.nbkm)
from Equipef e, match m,match m2, dist d
where e.neq=m.eq1 and e.neq=m2.eq1
and not exists (select * from match m3
where m3.datem > m.datem
and m3.datem < m2.datem
and e.neq=m3.eq1)
and m.datem < m2.datem
and d.st1=m.st and d.st2=m2.st
group by e.neq;
