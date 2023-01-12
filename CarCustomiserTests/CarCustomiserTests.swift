//
//  CarCustomiserTests.swift
//  CarCustomiserTests
//
//  Created by Leo Hammond on 12/01/2023.
//

import XCTest

class CarCustomiserTests: XCTestCase {

    func testNewCarGivesMeCarWithAllAttributesSet() {
        //arrange
        //act
        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
        //assert
        XCTAssertEqual(car.make, "Mazda")
        XCTAssertEqual(car.model, "MX-5")
        XCTAssertEqual(car.topSpeed, 125)
        XCTAssertEqual(car.acceleration, 7.7)
        XCTAssertEqual(car.handling, 5)
    }
    
    func testThatTheCreateTextMethodCreatesCorrectTest() {
        //arrange
        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
        //act
        let text = car.createText()
        //assert
        XCTAssertEqual(text, """
            Make: Mazda
            Model: MX-5
            Top Speed: 125mph
            Acceleration (0-60): 7.7
            Handling: 5
    """)
    }

}
