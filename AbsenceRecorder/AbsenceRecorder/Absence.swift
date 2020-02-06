//
//  Absence.swift
//  AbsenceRecorder
//
//  Created by Aaron Rex on 06/02/2020.
//  Copyright © 2020 Aaron Rex. All rights reserved.
//

import Foundation

class Absence {
    var takenOn: Date
    var present: [Student] = []
    var absent: [Student] = []
    var selectedRows: [IndexPath]?
    
    init(date: Date) {
        takenOn = date
    }
}
