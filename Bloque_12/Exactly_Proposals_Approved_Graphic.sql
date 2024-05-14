with exactly_approved as (
    select 
    title,
    case when winner_choice in ('Yes', 'Approve', 'For') then 'Approved'
    else 'Not Approved' end as approved
    from query_3722276
    where scores_state = 'final'
)

select count(approved) as proposals, approved
from exactly_approved
group by approved