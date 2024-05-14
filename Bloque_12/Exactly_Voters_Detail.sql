with latest_ens as(
    select address, name, 
    ROW_NUMBER() OVER(PARTITION BY address ORDER BY block_time ASC) as ens_rank
    from ens.resolver_latest
)

select v.id as voter_id, v.ipfs as voter_ipfs, v.reason, v.vp, 
case when ens.name is not null then ens.name
     else cast(v.voter as varchar) end as voter, 
v.choice, q.*
from query_3722276 q
left join dune.shot.dataset_votes_view v on v.proposal = q.id
left join latest_ens ens on ens.address = v.voter and ens.ens_rank = 1
where q.scores_state = 'final'
