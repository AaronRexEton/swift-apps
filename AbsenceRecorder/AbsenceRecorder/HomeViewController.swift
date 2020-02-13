//
//  HomeViewController.swift
//  AbsenceRecorder
//
//  Created by Aaron Rex on 29/01/2020.
//  Copyright © 2020 Aaron Rex. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    
    var divisions: [Division] = []
    var currentDate: Date = Date()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadDummyData()
        //for division in divisions {
            //print("Code: \(division.code), No.: \(division.students.count)")
            //for student in division.students {
                //print("\(student.forename)")
            //}
        //}
        
        updateDateDisplay()
        tableView.reloadData()

    }
    
    
    @IBAction func previousDay(_ sender: Any) {
        
        currentDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate) ?? Date()
        updateDateDisplay()
    }
    
    
    @IBAction func nextDay(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate) ?? Date()
        updateDateDisplay()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return divisions.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedDivision = divisions[indexPath.row]
        var absence = Absence(date: currentDate )
       
        if let existingAbsence = selectedDivision.getAbsence(date: currentDate) {
            absence = existingAbsence

        } else {
            
            selectedDivision.absences.append(absence)
        }
        
        guard let vc = storyboard?.instantiateViewController(identifier: "DivisionAbsenceViewController", creator: { coder in
                   return DivisionAbsenceViewController(coder: coder, division: selectedDivision, absence: absence)
               }) else {
                   fatalError("Failed to load Division Absence View Controller from Storyboard")
               }
        
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let allPresent = UIContextualAction(style: .normal, title: "All Present") { action, view, completionHandler in
            let division = self.divisions[indexPath.row]
            
            let absence = Absence(date: self.currentDate, present: division.students)
            division.absences.append(absence)
            tableView.reloadData()
            completionHandler(true)
        }
            
            
        allPresent.backgroundColor = UIColor.blue
        return UISwipeActionsConfiguration(actions: [allPresent])
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Division", for: indexPath)
        cell.textLabel?.text = divisions[indexPath.row].code
        
        return cell
    }
     /* iterate over every division
     output name and number of students in it
     output the student names*/
    
    func loadDummyData() {
        divisions.append(DivisionFactory.createDivision(code: "vBY-1", size: 8))
        divisions.append(DivisionFactory.createDivision(code: "vCZ-1", size: 5))
        divisions.append(DivisionFactory.createDivision(code: "vCW-1", size: 10))
        
    }
    
    func updateDateDisplay() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        navigationItem.title = formatter.string(from: currentDate)
    }
    
    


}

