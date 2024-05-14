with exa_votes_1 as (
    select title, choice_1 as choice,
    votes_1 as votes,
    case when choice_1 in ('Yes', 'Approve', 'For') then 'Positive'
        when choice_1 in ('No', 'Against', 'Deny') then 'Negative'
        when choice_1 in ('Abstain') then 'Neutral'
        else 'Undefined' end as type
    from query_3722276
    where scores_state = 'final'
), 
exa_votes_2 as (
    select title, choice_2 as choice,
    votes_2 as votes,
    case when choice_2 in ('Yes', 'Approve', 'For') then 'Positive'
        when choice_2 in ('No', 'Against', 'Deny') then 'Negative'
        when choice_2 in ('Abstain') then 'Neutral'
        else 'Undefined' end as type
    from query_3722276
    where scores_state = 'final'
), 
exa_votes_3 as (
    select title, choice_3 as choice,
    votes_3 as votes,
    case when choice_3 in ('Yes', 'Approve', 'For') then 'Positive'
        when choice_3 in ('No', 'Against', 'Deny') then 'Negative'
        when choice_3 in ('Abstain') then 'Neutral'
        else 'Undefined' end as type
    from query_3722276
    where scores_state = 'final'
), 
exa_votes_4 as (
    select title, choice_4 as choice,
    votes_4 as votes,
    case when choice_4 in ('Yes', 'Approve', 'For') then 'Positive'
        when choice_4 in ('No', 'Against', 'Deny') then 'Negative'
        when choice_4 in ('Abstain') then 'Neutral'
        else 'Undefined' end as type
    from query_3722276
    where scores_state = 'final'
), 
exa_votes_5 as (
    select title, choice_5 as choice,
    votes_5 as votes,
    case when choice_5 in ('Yes', 'Approve', 'For') then 'Positive'
        when choice_5 in ('No', 'Against', 'Deny') then 'Negative'
        when choice_5 in ('Abstain') then 'Neutral'
        else 'Undefined' end as type
    from query_3722276
    where scores_state = 'final'
)

select ev1.title, ev1.choice, ev1.votes, ev1.type from exa_votes_1 ev1 
UNION ALL
select ev2.title, ev2.choice, ev2.votes, ev2.type from exa_votes_2 ev2 
UNION ALL
select ev3.title, ev3.choice, ev3.votes, ev3.type from exa_votes_3 ev3
UNION ALL
select ev4.title, ev4.choice, ev4.votes, ev4.type from exa_votes_4 ev4
UNION ALL
select ev5.title, ev5.choice, ev5.votes, ev5.type from exa_votes_5 ev5

