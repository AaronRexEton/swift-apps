//
//  Division.swift
//  AbsenceRecorder
//
//  Created by Aaron Rex on 02/02/2020.
//  Copyright © 2020 Aaron Rex. All rights reserved.
//

import Foundation

class Division: Codable {
    let code: String
    var students: [Student] = []
    var absences: [Absence] = []
    
    init(code: String) {
        self.code = code
    }

    
    func getAbsence(date: Date) -> Absence?{
        return absences.first {
            let comparison = Calendar.current.compare($0.takenOn, to: date, toGranularity: .day)
            return comparison == .orderedSame
        }
    }
    
    
    
    
}
