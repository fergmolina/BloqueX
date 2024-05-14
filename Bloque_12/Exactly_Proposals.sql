 select count(distinct id) as proposals from dune.shot.dataset_proposals_view 
 where space = 'gov.exa.eth'
 and scores_state =  'final'