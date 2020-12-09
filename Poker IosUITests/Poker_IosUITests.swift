//
//  Poker_IosUITests.swift
//  Poker IosUITests
//
//  Created by Chu Hoang Hai on 2020/12/09.
//

import XCTest

var app: XCUIApplication!

class Poker_IosUITests: XCTestCase {
    

    override class func setUp() {
        super.setUp()
        app = XCUIApplication()
        app.launch()
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDisplayingAPIResult() throws {
        // UI tests must launch the application that they test.
//        let app = XCUIApplication()
//        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
   
        let field1 = app!.textFields["field1"]
        field1.tap()
        field1.typeText("H1")
        
        let field2 = app!.textFields["field2"]
        field2.tap()
        field2.typeText("H2")
        
        let field3 = app!.textFields["field3"]
        field3.tap()
        field3.typeText("H3")
        
        let field4 = app!.textFields["field4"]
        field4.tap()
        field4.typeText("H4")
        
        let field5 = app!.textFields["field5"]
        field5.tap()
        field5.typeText("H5")
        
//        app.otherElements["field1"].typeText("abc")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
