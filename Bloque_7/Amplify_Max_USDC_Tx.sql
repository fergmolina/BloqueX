select 
ROUND(MAX(t.value/POWER(10,e.decimals)),2) as max_USDC
from 
    erc20_polygon.evt_Transfer t
left join 
    tokens.erc20 e on e.contract_address = t.contract_address and e.blockchain = 'polygon'
where 
    t.to = 0xfc4fc27c278e9ea16030fc4f7f9d2ac511d1c1f8
and t.contract_address in (0x3c499c542cEF5E3811e1192ce70d8cC03d5c3359)