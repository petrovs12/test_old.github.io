---
id: 12m525ja3ogz82ei7j0ul32
title: Example of a coroutine for determinign market price of an asset,
desc: ""
updated: 2024-12-15T22:35
created: 1642098793695
---
based on number of people who bet 'buy'

[[finance.various]]
'''{python}
Created on Aug 23, 2012
@author: Stefan1
import random
def suppDem(bids):
    if(len(bids)==0):
        return 0
    return random.normalvariate(sum(bids),sum(bids))/len(bids)
def priceGenCoroutine(initialPrice=0,priceUpdateMechanism=suppDem):
    currentPrice=initialPrice
    while True:
        currentPrice+=suppDem((yield currentPrice))

def stochasticTrendFollow(prices):
    if(len(prices)&lt;2):
        return random.normalvariate(0,0.5)
    return random.normalvariate((prices[-1]-prices[-2]),0.5)
def AgentCoroutine(strategy=stochasticTrendFollow):
    obsPrices=\[]
    currentBid=0
    while True:
        obsPrices.append((yield currentBid))
        currentBid=strategy(obsPrices)

if **name** == '**main**':
    numAgents=10
    market=priceGenCoroutine()
    agents=[AgentCoroutine() for i in range(numAgents)]
    for ag in agents:
        next(ag)
    numSteps=10
    currPrice=next(market)
    for i in range(numSteps):
        bids=\[]
        print (currPrice)
        for ag in agents:
            bids.append(ag.send(currPrice))
        currPrice=market.send(bids)

```

```

