with exactly_proposals as(
    select id, ipfs, title, type, scores_state, quorum, symbol, 
    replace(replace(replace(split_part(choices, ', ', 1) ,'"',''),'[',''),']','') as choice_1,
    replace(replace(replace(split_part(choices, ', ', 2) ,'"',''),'[',''),']','') as choice_2,
    replace(replace(replace(split_part(choices, ', ', 3) ,'"',''),'[',''),']','') as choice_3,
    replace(replace(replace(split_part(choices, ', ', 4) ,'"',''),'[',''),']','') as choice_4,
    replace(replace(replace(split_part(choices, ', ', 5) ,'"',''),'[',''),']','') as choice_5,
    cast(replace(replace(replace(replace(split_part(scores_by_strategy, ', ', 1),'[[',''),'[',''),']',''),']]','') as DOUBLE) as votes_1,
    cast(replace(replace(replace(replace(split_part(scores_by_strategy, ', ', 2),'[[',''),'[',''),']',''),']]','') as DOUBLE)  as votes_2,
    cast(replace(replace(replace(replace(split_part(scores_by_strategy, ', ', 3),'[[',''),'[',''),']',''),']]','') as DOUBLE)  as votes_3,
    cast(replace(replace(replace(replace(split_part(scores_by_strategy, ', ', 4),'[[',''),'[',''),']',''),']]','') as DOUBLE)  as votes_4,
    cast(replace(replace(replace(replace(split_part(scores_by_strategy, ', ', 5),'[[',''),'[',''),']',''),']]','') as DOUBLE) as votes_5,
    votes, body
    from dune.shot.dataset_proposals_view 
    where space = 'gov.exa.eth'
), 
winner_votes_proposal as (
    select *,
    case when choice_1 = 'Abstain' then GREATEST(COALESCE(votes_2, 0),COALESCE(votes_3, 0),COALESCE(votes_4, 0),COALESCE(votes_5, 0))
         when choice_2 = 'Abstain' then GREATEST(COALESCE(votes_1, 0),COALESCE(votes_3, 0),COALESCE(votes_4, 0),COALESCE(votes_5, 0))
         when choice_3 = 'Abstain' then GREATEST(COALESCE(votes_1, 0),COALESCE(votes_2, 0),COALESCE(votes_4, 0),COALESCE(votes_5, 0))
         when choice_4 = 'Abstain' then GREATEST(COALESCE(votes_1, 0),COALESCE(votes_2, 0),COALESCE(votes_3, 0),COALESCE(votes_5, 0))
         when choice_5 = 'Abstain' then GREATEST(COALESCE(votes_1, 0),COALESCE(votes_2, 0),COALESCE(votes_3, 0),COALESCE(votes_4, 0))
         else GREATEST(COALESCE(votes_1, 0),COALESCE(votes_2, 0),COALESCE(votes_3, 0),COALESCE(votes_4, 0),COALESCE(votes_5, 0))
    end as winner_votes
    from exactly_proposals
),
winner_choice_proposal as (
    select *,
    case when winner_votes = votes_1 then choice_1
         when winner_votes = votes_2 then choice_2
         when winner_votes = votes_3 then choice_3
         when winner_votes = votes_4 then choice_4
         when winner_votes = votes_5 then choice_5
    end as winner_choice
    from winner_votes_proposal
)

select * 
from winner_choice_proposal
