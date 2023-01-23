//
//  CarCustomiserUITests.swift
//  CarCustomiserUITests
//
//  Created by Leo Hammond on 12/01/2023.
//

import XCTest

class CarCustomiserUITests: XCTestCase {

//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//
//        // In UI tests it is usually best to stop immediately when a failure occurs.
//        continueAfterFailure = false
//
//        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }

    func testWhenBoughtTyresAndExhaustPackageTwoOtherUpgradesAreDisabled() throws {
        // arrange
        let app = XCUIApplication()
        app.launch()
        
        
        // act
        XCUIApplication().tables.cells["Make: Volkswagen\nModel: Golf\nTop Speed: 110mph\nAcceleration (0-60): 6.2\nHandling: 7, Next Car"].children(matching: .other).element(boundBy: 0).children(matching: .other).element.tap()
        
        // assert
        
//        let tablesQuery = app.tables
//        tablesQuery.switches["Exhaust Package: 500"].tap()
//        tablesQuery.switches["Tyres Package: 500"].tap()
//        XCTAssertEqual(app.toggles["Fuel Injection Package: 500"].isEnabled, false)
//        XCTAssertEqual(app.toggles["Body Kit: 1000"].isEnabled, false)
        
        
       
    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
