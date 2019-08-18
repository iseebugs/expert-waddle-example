//
//  ExampleTests.swift
//  NewsReaderTestAppTests
//
//  Created by Anastasija Sergeeva on 18/08/2019.
//  Copyright © 2019 Anastasija Sergeeva. All rights reserved.
//
import XCTest
@testable import NewsReaderTestApp

class ExampleTests: XCTestCase {

    func testItemSaving() {
        let newsInteractor = NewsInteractor_mock()
        newsInteractor.loadFeed()
        XCTAssert((newsInteractor.rssFeedItems.count == 1), "ok")
    }
    
    func testFail() {
        XCTFail()
    }
}
