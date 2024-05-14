select voter, vp, 
case 
    when choice = '1' then choice_1
    when choice = '2' then choice_2
    when choice = '3' then choice_3
    when choice = '4' then choice_4
    when choice = '5' then choice_5 
    end as vote,
title, get_href('https://snapshot.org/#/gov.exa.eth/proposal/' || CAST(id AS varchar), '🔗') AS detail,
get_href('https://signator.io/view?ipfs=' || CAST(voter_ipfs AS varchar), '🔗') AS signature, winner_choice
from query_3726787
order by voter, title