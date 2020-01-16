//
//  ViewController.swift
//  IOS.Tamagotchi
//
//  Created by Rex, Aaron (SPH) on 14/01/2020.
//  Copyright © 2020 Rex, Aaron (SPH). All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    
    
    let tamagotchi = Tamagotchi(name: "Bill", isMale: true)
    var timer: Timer?
    var lifeCount = 0
    
    
    
    @IBOutlet var TimerDisplay: UILabel!
    @IBOutlet var playGameButton: UIButton!
    @IBOutlet var feedButton: UIButton!
    
    @IBOutlet var excerciseButton: UIButton!
    @IBOutlet var tamagotchiStats: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tamagotchiStats.text = tamagotchi.displayStats()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(lifeTime), userInfo: nil, repeats: true)
        

    }

    
    @IBAction func feedTamagotchi(_ sender: Any) {
        tamagotchi.eat()
        tamagotchiStats.text = tamagotchi.displayStats()
                
    }
    
    @IBAction func playGameTamagotchi(_ sender: Any) {
        tamagotchi.playGame()
        tamagotchiStats.text = tamagotchi.displayStats()
        
    }
    @IBAction func exerciseTamagotchi(_ sender: Any) {
        tamagotchi.excercise()
        tamagotchiStats.text = tamagotchi.displayStats()

        
    }
    @IBAction func medicineTamagotchi(_ sender: Any) {
    
    }
    
    @IBAction func cleanTamagotchi(_ sender: Any) {
    
    }
    
    @objc func lifeTime() {
        lifeCount += 1
        TimerDisplay.text = "\(lifeCount)"
        
        
    }
}


