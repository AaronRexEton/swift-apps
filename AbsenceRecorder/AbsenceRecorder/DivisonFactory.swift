//
//  DivisonFactory.swift
//  AbsenceRecorder
//
//  Created by Aaron Rex on 02/02/2020.
//  Copyright © 2020 Aaron Rex. All rights reserved.
//

import Foundation

class DivisionFactory {
    static func createDivision(code: String, size: Int) -> Division {
        
        let division = Division(code: code)
        
        for i in 1...size {
            let student = Student(forename: "FirstName\(i)", surname: "Surname\(i)", birthday: Date.init())
            division.students.append(student)
        }
        
        return division
        
    }
    
    static func addStudent(forename: String, surname: String, birthday: Date, division: Division) {
        
        division.students.append(Student(forename: forename, surname: surname, birthday: birthday))
        
        
    }
}
