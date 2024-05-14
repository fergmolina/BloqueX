select *
from query_3727368
where max_vp = (select max(avg_vp) from query_3727368)
order by proposals desc