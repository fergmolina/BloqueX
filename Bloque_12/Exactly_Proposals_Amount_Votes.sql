with exa_votes_1 as (
    select title, voter, choice, vp, votes, choice_1 as voter_choice,
    case when choice_1 in ('Yes', 'Approve', 'For') then 'Positive'
        when choice_1 in ('No', 'Against', 'Deny') then 'Negative'
        when choice_1 in ('Abstain') then 'Neutral'
        else 'Undefined' end as type
    from query_3726787
    where choice = '1'
),
exa_votes_2 as (
    select title, voter, choice, vp, votes, choice_2 as voter_choice,
    case when choice_2 in ('Yes', 'Approve', 'For') then 'Positive'
        when choice_2 in ('No', 'Against', 'Deny') then 'Negative'
        when choice_2 in ('Abstain') then 'Neutral'
        else 'Undefined' end as type
    from query_3726787
    where choice = '2'
),
exa_votes_3 as (
    select title, voter, choice, vp, votes, choice_3 as voter_choice,
    case when choice_3 in ('Yes', 'Approve', 'For') then 'Positive'
        when choice_3 in ('No', 'Against', 'Deny') then 'Negative'
        when choice_3 in ('Abstain') then 'Neutral'
        else 'Undefined' end as type
    from query_3726787
    where choice = '3'
),
exa_votes_4 as (
    select title, voter, choice, vp, votes, choice_4 as voter_choice,
    case when choice_4 in ('Yes', 'Approve', 'For') then 'Positive'
        when choice_4 in ('No', 'Against', 'Deny') then 'Negative'
        when choice_4 in ('Abstain') then 'Neutral'
        else 'Undefined' end as type
    from query_3726787
    where choice = '4'
),
exa_votes_5 as (
    select title, voter, choice, vp, votes, choice_5 as voter_choice,
    case when choice_5 in ('Yes', 'Approve', 'For') then 'Positive'
        when choice_5 in ('No', 'Against', 'Deny') then 'Negative'
        when choice_5 in ('Abstain') then 'Neutral'
        else 'Undefined' end as type
    from query_3726787
    where choice = '5'
),
exa_votes_total as (
select title, voter, vp, voter_choice, type from exa_votes_1
union all
select title, voter, vp, voter_choice, type from exa_votes_2
union all 
select title, voter, vp, voter_choice, type from exa_votes_3
union all 
select title, voter, vp, voter_choice, type from exa_votes_4
union all 
select title, voter, vp, voter_choice, type from exa_votes_5
)

select title, count(distinct voter) as count_votes, type
from exa_votes_total
group by title,type
