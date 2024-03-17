with tx_per_day as (
    -- POLYGON
    select 
        date_trunc('day', evt_block_time) as date,
        COUNT(1) as total_txs
    from
        erc20_polygon.evt_Transfer t
    left join 
        tokens.erc20 e on e.contract_address = t.contract_address and e.blockchain = 'polygon'
    where 
        t.to = 0xfc4fc27c278e9ea16030fc4f7f9d2ac511d1c1f8
    and 
        t.contract_address in (0xc2132d05d31c914a87c6611c10748aeb04b58e8f, 0x3c499c542cef5e3811e1192ce70d8cc03d5c3359)
    group by 
        date_trunc('day', evt_block_time)
        
    UNION
    -- OPTIMISM
    select 
        date_trunc('day', evt_block_time) as date,
        COUNT(1) as total_txs
    from
        erc20_optimism.evt_transfer t
    left join 
        tokens.erc20 e on e.contract_address = t.contract_address and e.blockchain = 'optimism'
    where 
        t.to = 0x9809cF22c853aB2acb22944850f30cF2dab2581c
    and 
        t.contract_address in (0x0b2C639c533813f4Aa9D7837CAf62653d097Ff85, 0x94b008aA00579c1307B0EF2c499aD98a8ce58e58)
    group by 
        date_trunc('day', evt_block_time) 
)

select date, sum(total_txs) as total_txs
from tx_per_day
group by date