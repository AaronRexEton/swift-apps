//
//  AbsenceRecorderUITests.swift
//  AbsenceRecorderUITests
//
//  Created by Aaron Rex on 29/01/2020.
//  Copyright © 2020 Aaron Rex. All rights reserved.
//

import XCTest

class AbsenceRecorderUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhenRecordingAnAbsenceStudentsRemaingSelected() {
        let app = XCUIApplication()
        
        app.launch()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["vBY-1"]/*[[".cells.staticTexts[\"vBY-1\"]",".staticTexts[\"vBY-1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Surname1"]/*[[".cells.staticTexts[\"Surname1\"]",".staticTexts[\"Surname1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Surname2"]/*[[".cells.staticTexts[\"Surname2\"]",".staticTexts[\"Surname2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Surname3"]/*[[".cells.staticTexts[\"Surname3\"]",".staticTexts[\"Surname3\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Surname4"]/*[[".cells.staticTexts[\"Surname4\"]",".staticTexts[\"Surname4\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Surname5"]/*[[".cells.staticTexts[\"Surname5\"]",".staticTexts[\"Surname5\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["vBY-1"].buttons["Mar 9, 2020"].tap()
        
        let divisionCell = tablesQuery
        let divisionCellNoAbsence = tablesQuery.cells.element(boundBy: 1)
        XCTAssertEqual(divisionCellNoAbsence.isSelected, false)
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
