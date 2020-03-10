//
//  DivisionTests.swift
//  AbsenceRecorderTests
//
//  Created by Aaron Rex on 09/03/2020.
//  Copyright © 2020 Aaron Rex. All rights reserved.
//

import XCTest

class DivisionTests: XCTestCase {

    func testGetAbsenceWithCurrentDateRetrievesExistingAbsenceOnSameDay() {
        //arrange
        let division = Division(code: "TestDiv")
        let absence = Absence(date: Date())
        division.absences.append(absence)
        let dateLatertoday = Date(timeIntervalSinceNow: 100)
        //act
        let actual = division.getAbsence(date: dateLatertoday)
        //assert
        XCTAssertNotNil(actual)
    }

}
