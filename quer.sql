select
	
	
	SUM(money) / (select count(distinct c2.st_id) from checks c2) as ARPU,

	cast((select count(distinct c3.st_id) from checks c3 where coalesce(c3.money, 0) > 0) as float) / 
	cast((select count(distinct c4.st_id) from checks c4) as float) * 100 as CR_Total_Percents,

	cast((select count(distinct c5.st_id) from checks c5 where coalesce(c5.money, 0) > 0 and c5.subject Like 'math') as float) / 
	cast((select count(distinct c6.st_id) from checks c6 where c6.subject Like 'math') as float) * 100 as CR_Math_Percents
from studs s
join checks c on c.st_id = s.st_id