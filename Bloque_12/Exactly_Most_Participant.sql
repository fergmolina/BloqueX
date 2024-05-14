select *
from query_3727368
where proposals = (select max(proposals) from query_3727368 )
order by max_vp desc