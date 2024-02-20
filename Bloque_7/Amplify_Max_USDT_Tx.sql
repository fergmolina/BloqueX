select 
ROUND(MAX(t.value/POWER(10,e.decimals)),2) as max_USDT
from 
    erc20_polygon.evt_Transfer t
left join 
    tokens.erc20 e on e.contract_address = t.contract_address and e.blockchain = 'polygon'
where 
    t.to = 0xfc4fc27c278e9ea16030fc4f7f9d2ac511d1c1f8
and t.contract_address in (0xc2132d05d31c914a87c6611c10748aeb04b58e8f)