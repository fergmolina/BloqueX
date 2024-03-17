with USDT_max as (
    -- POLYGON
    select 
    ROUND(MAX(t.value/POWER(10,e.decimals)),2) as max_USDT
    from 
        erc20_polygon.evt_Transfer t
    left join 
        tokens.erc20 e on e.contract_address = t.contract_address and e.blockchain = 'polygon'
    where 
        t.to = 0xfc4fc27c278e9ea16030fc4f7f9d2ac511d1c1f8
    and t.contract_address in (0xc2132d05d31c914a87c6611c10748aeb04b58e8f)
    
    UNION
    
    -- OPTIMISM
    select 
    ROUND(MAX(t.value/POWER(10,e.decimals)),2) as max_USDT
    from 
        erc20_optimism.evt_transfer t
    left join 
        tokens.erc20 e on e.contract_address = t.contract_address and e.blockchain = 'optimism'
    where 
        t.to = 0x9809cF22c853aB2acb22944850f30cF2dab2581c
    and t.contract_address in (0x94b008aA00579c1307B0EF2c499aD98a8ce58e58) 
)

select max(max_USDT) as max_USDT
from USDT_max