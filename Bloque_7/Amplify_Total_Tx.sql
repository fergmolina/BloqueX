select 
COUNT(1) as total_tx
from 
    erc20_polygon.evt_Transfer t
left join 
    tokens.erc20 e on e.contract_address = t.contract_address and e.blockchain = 'polygon'
where 
    t.to = 0xfc4fc27c278e9ea16030fc4f7f9d2ac511d1c1f8
and 
    t.contract_address in (0xc2132d05d31c914a87c6611c10748aeb04b58e8f,0x3c499c542cef5e3811e1192ce70d8cc03d5c3359)