select count(distinct voter_id) as proposals, voter, max(vp) as max_vp, min(vp) as min_vp, avg(vp) as avg_vp
from query_3726787
group by voter
order by 1 desc

