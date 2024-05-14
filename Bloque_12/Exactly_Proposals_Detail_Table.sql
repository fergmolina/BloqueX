select title, get_href('https://snapshot.org/#/gov.exa.eth/proposal/' || CAST(id AS varchar), '🔗') AS details,
get_href('https://snapshot.4everland.link/ipfs/' || CAST(ipfs AS varchar), '🔗') AS ipfs, type, scores_state as state,
symbol, votes, winner_votes, winner_choice, body
from query_3722276
order by title asc