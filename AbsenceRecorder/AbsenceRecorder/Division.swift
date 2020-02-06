//
//  Division.swift
//  AbsenceRecorder
//
//  Created by Aaron Rex on 02/02/2020.
//  Copyright © 2020 Aaron Rex. All rights reserved.
//

import Foundation

class Division {
    let code: String
    var students: [Student] = []
    var absences: [Absence] = []
    
    init(code: String) {
        self.code = code
    }
    
    func hasAbsence(date: Date) -> Bool{
        for absence in absences {
            if absence.takenOn == date {
                return true
            }
        }
        
        return false
        
    }
    
    func getAbsence(date: Date) -> Absence?{
        for absence in absences {
            if absence.takenOn == date {
                return absence
            }
        }
        
        return nil
    }
}
