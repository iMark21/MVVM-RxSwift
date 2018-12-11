//
//  CryptoListViewModelTest.swift
//  CryptoCompareTests
//
//  Created by Juan Miguel Marques Morilla on 11/12/2018.
//  Copyright © 2018 Juan Miguel Marques Morilla. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
import RxTest
import ObjectMapper

@testable import CryptoCompare


class CryptoListViewModelTest: XCTestCase {
    
    private var viewModel = CryptoListViewModel()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = CryptoListViewModel()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCryptoCurrencyData() {
        
        let jsonDictionary: [String: Any] = [
            "id": "bitcoin",
            "name": "Bitcoin",
            "symbol": "BTC",
            "rank": "1",
            "price_usd": "3411.97069615",
            "price_btc": "1.0",
            "24h_volume_usd": "4782716869.32",
            "market_cap_usd": "59427955245.0",
            "available_supply": "17417487.0",
            "total_supply": "17417487.0",
            "max_supply": "21000000.0",
            "percent_change_1h": "-0.16",
            "percent_change_24h": "-4.25",
            "percent_change_7d": "-14.76",
            "last_updated": "1544532322"]
        
        let cryptoCurrency = Mapper<CryptoCurrency>().map(JSON: jsonDictionary)
        
        XCTAssertEqual(cryptoCurrency?.id, "bitcoin")
        XCTAssertEqual(cryptoCurrency?.name, "Bitcoin")
        XCTAssertEqual(cryptoCurrency?.percentChange1h, "-0.16")
        
    }
    
    func testInitialization() {
        // Initialize View Model
        XCTAssertNotNil(viewModel , "The profile view model should not be nil.")
    }

}
