---
id: 2k80gb4ock68s36n6c2m2re
title: Stock Price Tracker
desc: ""
updated: 1733569497034
created: 1733569383465
---

Description
We would like to implement a stock price tracker that can track the open & close price of stocks on the Stock Market over time (think Yahoo Finance or Robinhood)

Question Statement
The stock tracker should support the following basic functionality:

Add & Remove prices for a given stock ticker and date.
Look up the price based on a stock ticker and date.
Return all prices for a given stock ticker sorted in ascending order by date
(think of a historical price chart in any stock trading application. We want the data to display that).


Provide the candidate with the following struct and interface. Ask the candidate to implement all methods of the StockPriceTracker interface.

/**
 * Problem Constraints:
 * 1. Assume Date's are in "dd/MM/y" format only. Time is not linear, Dates & Prices can be added in any order. 
 * 2. Stock market opened in 1700 (~300 years). We have ~250,000 stock tickers in the market.
 * 3. We want to optimize time & space complexity, but assumption can be made all data can fit on one machine. This is not a distributed systems problem.
 */
public struct OpenClosePrice {
  var openPrice: NSNumber = NSNumber()
  var closePrice: NSNumber = NSNumber()
}
  
public class StockPriceTracker {
  
  public func add(openClosePrice: OpenClosePrice, for ticker: String, on date: Date) {}
  
  public func getOpenClosePrice(for ticker: String, on date: Date) -> OpenClosePrice? {}
  
  public func getAllOpenClosePrices(ticker: String) -> [OpenClosePrice] {}
  
}

/**
 * Example Input & Output
 */
let stockTracker = StockPriceTracker()
stockTracker.add(openClosePrice: OpenClosePrice(openPrice: 10.25, closePrice: 10.50), for: "FB", on: "11/22/2001")
stockTracker.add(openClosePrice: OpenClosePrice(openPrice: 2.23, closePrice: 2.90), for: "FB", on: "8/18/1990")
stockTracker.add(openClosePrice: OpenClosePrice(openPrice: 348.67, closePrice: 345.00), for: "FB", on: "11/26/2021")

stockTracker.getOpenClosePrice(for: "FB", on: "11/26/2021") -> "(348.67, 345.00)"
stockTracker.getOpenClosePrice(for: "FB", on: "8/18/1995") -> "()"
stockTracker.getAllOpenClosePrices(ticker: "FB") -> "[(2.23, 2.90), (10.25, 10.50), (348.67, 345.00)]"
A Java version of the above:

/**
 * Problem Constraints:
 * 1. Assume Date's are in "dd/MM/y" format only. Time is not linear, Dates & Prices can be added in any order. 
 * 2. Stock market opened in 1700 (~300 years). We have ~250,000 stock tickers in the market.
 * 3. We want to optimize time & space complexity, but assumption can be made all data can fit on one machine. This is not a distributed systems problem.
 */
public class OpenClosePrice {
  float openPrice;
  float closePrice;
}
  
public interface StockPriceTracker {
  
  public void add(OpenClosePrice price, String ticker, String date);
  
  public OpenClosePrice getOpenClosePrice(String ticker, String date);
  
  public OpenClosePrice[] getAllOpenClosePrices(String ticker);
}

/**
 * Example Input & Output
 */
StockPriceTracker stockTracker = new StockPriceTracker();
stockTracker.add(new OpenClosePrice(10.25, 10.50), "FB", "11/22/2001");
stockTracker.add(new OpenClosePrice(2.23, 2.90), "FB", "8/18/1990");
stockTracker.add(new OpenClosePrice(348.67, 345.00), "FB", "11/26/2021");

stockTracker.getOpenClosePrice("FB", "11/26/2021") -> "(348.67, 345.00)"
stockTracker.getOpenClosePrice("FB", "8/18/1995") -> null
stockTracker.getAllOpenClosePrices("FB") -> "[(2.23, 2.90), (10.25, 10.50), (348.67, 345.00)]"
Problem Constraints
In the code example, please read the code comments, the code comments contain the problem constraints.

NOTE: Very experienced senior candidates may start thinking about threading & concurrency. Steer them away from this, we don’t need to handle threading, queuing, locking, etc. Just what data structures & algorithms do you use to solve the problem.


Time & Difficulty
This question is similar to Binary Tree Playground. This is a hard multi-part question that can take up the entire interview (greater than 30+ minutes). It is best to ask this question after a very easy warm up question like CGRect Fun.


How to Ask Question
For the warm up/easy question:
Have the candidate implement the add() method.
This should take ~10-15 minutes because depending on the approach, the candidate may also need to stub a interface for a Binary Search Tree, or create another “structure” to wrap the OpenClose stock price with the Date value.
For the harder follow up question:
Have the candidate implement the lookup methods that are higher degree of difficulty and require more thought. This should take around ~20-25 minutes.
Leave some time at the end to ask follow up questions if there is time.

Solutions
A candidate we want to hire should quickly assess the “scale” of the problem based on the initial constraints and devise an appropriate algorithmic solution. If the stock market started in 1700, and there are 365 days in a year, simple math tells us any given stock will have in the worst case ~120,000 OpenClose price entries we need to track. If we perform look-ups often, searching & sorting this many entries for a given stock can become a bottleneck in the lookup & insertion methods (depending on the implementation)

There are a few general approaches to the problem: (from least to most efficient)

Simple dictionary - A dictionary mapping from the stock ticker to an unsorted array of prices (a struct containing both the date and the prices for the date).{ticker: [StockPrice]} Insertions are constant-time, but lookups expensive. We should nudge candidates away from this approach.
least balanced/efficient time complexity, No-Hire
Nested dictionary - A dictionary mapping from the stock ticker to another dictionary mapping the date to a price:
{ticker: {date: price}} Insertions are still constant-time. But this also offers constant-time lookups of a single date. It still requires sorting upon returning all dates.
Slightly better, but too expensive on full-list lookups. Borderline No-Hire
Array Sort & Binary Search - A dictionary mapping the stock ticker to a sorted array of all the stock’s prices (a struct containing both the date and the prices for the date). {ticker: [StockPrice]} Insertions need to resort (n log n). A single day lookup requires a binary search (log n). But returning all dates now is constant-time.
Optimal for lookups, but expensive insertions. Borderline Hire
Binary Insertion & Search - This approach builds on top of solution 3 and leverages a binary insertion algorithm instead of resorting the array every time we add a new stock price. Binary insertion is just a slightly modified version of binary search.
 Optimal for lookups and insertions. Hire.

**Binary Search Tree** - Utilizes a BST to keep a sorted list of dates with cheaper addition (log n), but linear lookup for all date-sorted prices. Lookup of a single day stays at log n, as we need to search for it in the tree. Since Foundation does not contain a BST data structure, the candidate needs to stub an interface for one and explain it.
Most balanced performance across writes & reads. Strong Hire.

| Solution                  | Time Complexity (add, getPrice, getAllPrices) | Grading            |
|---------------------------|-----------------------------------------------|--------------------|
| BST                       | O(LogN),  O(LogN), O(N)                       | Strong Hire        |
| Binary insertion & search | O(N+LogN), O(LogN), O(1)                      | Hire               |
| Array Sort, binary search | O(NLogN), O(LogN), O(1)                       | Borderline Hire    |
| Nested Dict               | O(1),     O(1),    O(NLogN)                   | Borderline No-Hire |
| Simple Dict               | O(1),     O(N),    O(NLogN)                   | No-Hire            |
Example Solution: Sorted array & binary search
/**
 Candidate needs to wrap OpenClosePrice in another structure to associate 
 the OpenClosePrice with its Date to correctly locate it and sort it. 
 They should figure this out themselves.
*/
public struct StockPrice {
  public var date: Date
  public var openClosePrice: OpenClosePrice
  
  public init(date: Date, openClosePrice: OpenClosePrice) {
    self.date = date
    self.openClosePrice = openClosePrice
  }
}

public class StockPriceTracker {
  
  private var stockPrices = [String: [StockPrice]]()
  
  public func add(openClosePrice: OpenClosePrice, for ticker: String, on date: Date) {
    if let prices = stockPrices[ticker] {
      var mutablePrices = prices
      mutablePrices.append(StockPrice(date: date, openClosePrice: openClosePrice))
      stockPrices[ticker] = sortPrices(&mutablePrices)
    } else {
      stockPrices[ticker] = [StockPrice(date: date, openClosePrice: openClosePrice)]
    }
  }
  
  public func getOpenClosePrice(for ticker: String, on date: Date) -> OpenClosePrice? {
    if let prices = stockPrices[ticker] {
      return binarySearchForOpenClosePrice(date, prices, 0, prices.count - 1)
    }
    return nil
  }
  
  public func getAllStockPrices(stockTicker: String) -> [StockPrice] {
    if let prices = stockPrices[stockTicker] {
      return prices
    }
    return [StockPrice]()
  }
  
  private func sortPrices(_ stockPrices: inout [StockPrice]) -> [StockPrice]
  {
    stockPrices.sorted(by: { $0.date < $1.date })
    return stockPrices
  }
  
  private func binarySearchForOpenClosePrice(_ date: Date, _ stockPrices: [StockPrice],
                                             _ startIndex: Int, _ endIndex: Int) -> OpenClosePrice?
  {
    if startIndex <= endIndex {
      let midIndex = startIndex + ((endIndex - startIndex) / 2)
      let currentStock = stockPrices[midIndex]
      if currentStock.date == date {
        return currentStock.openClosePrice
      } else if currentStock.date > date {
        return binarySearchForOpenClosePrice(date, stockPrices, startIndex, midIndex - 1)
      } else {
        return binarySearchForOpenClosePrice(date, stockPrices, midIndex + 1, endIndex)
      }
    } else {
      return nil
    }
  }
}


Example Solution: Binary Search Tree
public class BSTMap<K: Comparable, V: Any> {
  public func insertValue(value: V?, for key: K) {}
  public func getValue(for key: K) -> V? { return nil }
  public func allKeys() -> [K] { return [] }
  public func allValues() -> [V] { return [] }
}

public class StockPriceTracker {
  
  private var stockPricesMap = BSTMap<Date, [String : OpenClosePrice]>()
  
  public func add(openClosePrice: OpenClosePrice, for ticker: String, on date: Date) {
    if let stockPrices = stockPricesMap.getValue(for: date) {
      var mutableStockPrices = stockPrices
      mutableStockPrices[ticker] = openClosePrice
      stockPricesMap.insertValue(value: mutableStockPrices, for: date)
    } else {
      stockPricesMap.insertValue(value: [ticker : openClosePrice], for: date)
    }
  }
  
  public func getOpenClosePrice(for ticker: String, on date: Date) -> OpenClosePrice? {
    if let stockPrices = stockPricesMap.getValue(for: date) {
      return stockPrices[ticker]
    }
    return nil
  }
  
  public func getAllOpenClosePrices(ticker: String) -> [OpenClosePrice] {
    var stockPrices = [OpenClosePrice]()
    let stockPriceMaps = stockPricesMap.allValues()
    for stockPriceMap in stockPriceMaps {
      if let stockPrice = stockPriceMap[ticker] {
        stockPrices.append(stockPrice)
      }
    }
    return stockPrices.reversed() // cost??
  }
  
}

Edge Cases, Things to Consider

BST Solution
Pay attention to how they “stub” the BST. This is not a pirate interview, so we are not evaluating their designing, that being said the interface should demonstrate they understand how the data structure would work.
API should look real close to a Dictionary. Should be some basic support for lookups, insertions, removal. Should be a way to get allValues/Keys in sorted order, or some basic “ordered” enumeration support.
Should be generically typed.
Keys should conform to Comparable, and there should be an associated value. If the key is not comparable, we can’t maintain the BST ordering property.
Candidate should demonstrate they can properly “update” the BST. Dictionaries are a value type and NOT a reference. Once the dictionary is mutated, we must reassign the mutated dictionary to the BST. This is a quirk of Swift but not ObjC.

Binary Search & Sort Solution
Pay close attention to how the candidate performs the sorting, sorting should be correct. The candidate can simply compare the “Date” since Date conforms to Comparable.
Binary Search implementation should be correct, along with the base cases. Pay close attention to how they pass in start, end indices into the algorithm. Common problem is to have the base case to be “if startIndex == endIndex”, what happens if startIndex becomes greater than endIndex (which can happen in the recursion)?
Candidate should demonstrate they can properly update the Dictionary with newly sorted array of StockPrices. Arrays are value types and not references, so reassignment is necessary. Once again, this is a quirk more of Swift.

Follow Up Questions
If there is time, these are some good “follow up questions” to ask:

If the candidate employed the Sorting & Binary Search approach. Push the candidate to see if they can optimize the add method and improve the Time Complexity, the hope is to get signals they can employ a BST.
Have the candidate implement a “remove(openClosePrice: OpenClosePrice)” method.
If the candidate follows the BST approach, have the candidate implement the look up method in their Binary Search Tree Definition. This will require them to think about how to represent a Binary Search Tree Node, and implement a simple tree search algorithm.
