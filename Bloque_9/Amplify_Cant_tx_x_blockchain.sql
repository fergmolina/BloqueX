with fees as (
    -- POLYGON
    select 'polygon' as blockchain, ((gas_used * gas_price)/(1e18)) * p.price as tx_fee_usd, block_date
    from polygon.transactions t
    left join prices.usd p on p.symbol = 'MATIC' and p.contract_address is null and date_trunc('minute', t.block_time) = p.minute
    where hash in (
    select distinct evt_tx_hash
    from erc20_polygon.evt_transfer t 
    where t.to in (
        select distinct t."from" as wallet
        from erc20_polygon.evt_transfer t
        where t.to = 0xfc4fc27c278e9ea16030fc4f7f9d2ac511d1c1f8
        and t.contract_address in (0x3c499c542cef5e3811e1192ce70d8cc03d5c3359, 0xc2132d05d31c914a87c6611c10748aeb04b58e8f)
    ))
    and block_time > timestamp '2024-03-01 00:00 UTC'
    
    UNION
    -- OPTIMISM
    select 'optimisim' as blockchain, tx_fee_usd, block_time
    from gas.fees 
    where blockchain = 'optimism'
    and tx_hash in (
    select distinct evt_tx_hash
    from erc20_optimism.evt_transfer t 
    where t.to in (
        select distinct t."from" as wallet
        from erc20_optimism.evt_transfer t
        where t.to = 0x9809cF22c853aB2acb22944850f30cF2dab2581c
        and t.contract_address in (0x0b2C639c533813f4Aa9D7837CAf62653d097Ff85, 0x94b008aA00579c1307B0EF2c499aD98a8ce58e58)
    ))
)

select count(1) as cant_tx, date_trunc('day', block_date) as block_date, blockchain
from fees
group by date_trunc('day', block_date), blockchain