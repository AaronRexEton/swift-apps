//
//  Student.swift
//  AbsenceRecorder
//
//  Created by Aaron Rex on 02/02/2020.
//  Copyright © 2020 Aaron Rex. All rights reserved.
//

import Foundation

class Student {
    let forename: String
    let surname: String
    let birthday: Date
    
    init(forename: String, surname: String, birthday: Date) {
        self.forename = forename
        self.surname = surname
        self.birthday = birthday
    }
    
}
