//
//  ViewController.swift
//  IOS.Tamagotchi
//
//  Created by Rex, Aaron (SPH) on 14/01/2020.
//  Copyright © 2020 Rex, Aaron (SPH). All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    
    
    let tamagotchi = Tamagotchi(name: "Lukas", isMale: true)
    var timer: Timer?
    var lifeCount = 0
    
    
    @IBOutlet var GifView: UIImageView!
    
    @IBOutlet var tamagotchiSpeech: UILabel!
    @IBOutlet var TimerDisplay: UILabel!
    @IBOutlet var playGameButton: UIButton!
    @IBOutlet var feedButton: UIButton!
    var youDied = #imageLiteral(resourceName: "You_died.png")
    
    @IBOutlet var cleanButton: UIButton!
    @IBOutlet var medicineButton: UIButton!
    @IBOutlet var excerciseButton: UIButton!
    
    @IBOutlet var tamagotchiStats: UILabel!
    
    @IBOutlet var tamagotchiStats2: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tamagotchiStats.text = tamagotchi.displayStatsTop()
        tamagotchiStats2.text = tamagotchi.displayStatsBot()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(lifeTime), userInfo: nil, repeats: true)
        GifView.loadGif(name: "TamPreEvolution")
        
     
    
        

    }
    
    func isDead() {
         
         if tamagotchi.happinessLevels[tamagotchi.happinessRank] == "depression" {
         }
     
    }
    
    func death() {
        timer?.invalidate()
        TimerDisplay.text = " "
        tamagotchiStats.text = " "
        tamagotchiStats2.text = " "
        GifView.image = youDied
        feedButton.isEnabled = false
        playGameButton.isEnabled = false
        excerciseButton.isEnabled = false
        medicineButton.isEnabled = false
        cleanButton.isEnabled = false
       
        
        
        
        
        
    }

    
    @IBAction func feedTamagotchi(_ sender: Any) {
        if tamagotchi.hungry == true {
            tamagotchi.eat()
            tamagotchiStats.text = tamagotchi.displayStatsTop()
            tamagotchiStats2.text = tamagotchi.displayStatsBot()
            tamagotchiSpeech.text = "YumYum"
            if tamagotchi.weight >= 9 {
                tamagotchiSpeech.text = "Your tamagotchi died of obesity"
                death()
            }
        } else if tamagotchi.hungry == false {
            tamagotchiSpeech.text = "I'm not hungry"
            if tamagotchi.happinessRank != 0 {
                tamagotchi.happinessRank -= 1
                tamagotchiStats.text = tamagotchi.displayStatsTop()
                tamagotchiStats2.text = tamagotchi.displayStatsBot()
            }
            else {
                death()
            }
            
        }
                
    }
    
    @IBAction func playGameTamagotchi(_ sender: Any) {
        if tamagotchi.needAttention == true {
            tamagotchi.playGame()
            tamagotchiStats.text = tamagotchi.displayStatsTop()
            tamagotchiStats2.text = tamagotchi.displayStatsBot()
            tamagotchiSpeech.text = "That was so much fun"
            tamagotchi.needAttention = false
        }
        else if tamagotchi.needAttention == false {
            tamagotchiSpeech.text = "I don't want to play"
            if tamagotchi.happinessRank != 0 {
                tamagotchi.happinessRank -= 1
                tamagotchiStats.text = tamagotchi.displayStatsTop()
                tamagotchiStats2.text = tamagotchi.displayStatsBot()
            }
            else {
                tamagotchiSpeech.text = "Your tamagotchi died of sadness"
                death()
            }
            
        }
    }
    @IBAction func exerciseTamagotchi(_ sender: Any) {
        tamagotchi.excercise()
        tamagotchiSpeech.text = "I'm exhausted"
        if tamagotchi.happinessRank != 0 {
            tamagotchi.happinessRank -= 1
            tamagotchiStats.text = tamagotchi.displayStatsTop()
            tamagotchiStats2.text = tamagotchi.displayStatsBot()
        }
        else {
            tamagotchiSpeech.text = "Your tamagotchi died of sadness"
            death()
        }
    

        
    }
    @IBAction func medicineTamagotchi(_ sender: Any) {
        if tamagotchi.sick == true {
            tamagotchi.medicate()
            tamagotchiStats.text = tamagotchi.displayStatsTop()
            tamagotchiStats2.text = tamagotchi.displayStatsBot()
            tamagotchiSpeech.text = "Thanks I feel better"
        }
        else {
            tamagotchiSpeech.text = "I don't want to eat the medicine!"
            if tamagotchi.happinessRank != 0 {
                tamagotchi.happinessRank -= 1
                tamagotchiStats.text = tamagotchi.displayStatsTop()
                tamagotchiStats2.text = tamagotchi.displayStatsBot()
            }
            else {
                tamagotchiSpeech.text = "Your tamagotchi died of sadness"
                death()
            }
            
        }
    
    }
    
    @IBAction func cleanTamagotchi(_ sender: Any) {
        if tamagotchi.clean == true {
            tamagotchi.cleanTama()
            tamagotchiStats.text = tamagotchi.displayStatsTop()
            tamagotchiStats2.text = tamagotchi.displayStatsBot()
            tamagotchiSpeech.text = "I feel refreshed"
        } else if tamagotchi.clean == false {
            tamagotchiSpeech.text = "I don't want to have a bath!"
            if tamagotchi.happinessRank != 0 {
                tamagotchi.happinessRank -= 1
                tamagotchiStats.text = tamagotchi.displayStatsTop()
                tamagotchiStats2.text = tamagotchi.displayStatsBot()
            }
            else {
                tamagotchiSpeech.text = "Your tamagotchi died of sadness"
                death()
            }
            
            
        }
    
    }
    
    @objc func lifeTime() {
        lifeCount += 1
        TimerDisplay.text = "\(lifeCount)"
    
        if lifeCount % 3 == 0 {
            tamagotchiStats.text = tamagotchi.displayStatsTop()
            tamagotchiStats2.text = tamagotchi.displayStatsBot()
            
            tamagotchi.randomEvent = Int.random(in: 0...100)
            
            if tamagotchi.randomEvent > 95 && tamagotchi.happinessRank == 6{
                tamagotchiSpeech.text = "evolution!"
                GifView.loadGif(name: "TamAnimation")
            }
            
            else if tamagotchi.randomEvent > 90 {
                tamagotchiSpeech.text = "I feel sick"
                tamagotchi.sick = true
                tamagotchi.needAttention = false
                tamagotchiStats.text = tamagotchi.displayStatsTop()
                tamagotchiStats2.text = tamagotchi.displayStatsBot()
            }
            else if tamagotchi.randomEvent > 60 {
                tamagotchiSpeech.text = "Play with me!"
                tamagotchi.needAttention = true
                
            }
            else if tamagotchi.randomEvent > 20 {
                tamagotchiSpeech.text = "I'm hungry"
                tamagotchi.hungry = true
                
            }
            else if tamagotchi.randomEvent > 0 {
                tamagotchiSpeech.text = "I'm dirty"
                tamagotchi.clean = true
                
            }
            
           
        }

        else if lifeCount % 11 == 0 && tamagotchi.sick == true {
            tamagotchiSpeech.text = "Your tamagotchi died of disease"
            death()
        }
        else if lifeCount % 11 == 0 && tamagotchi.needAttention == true {
            tamagotchiSpeech.text = "Your tamagotchi died of neglect"
            death()
        }
        else if lifeCount % 11 == 0 && tamagotchi.hungry == true {
            tamagotchiSpeech.text = "Your tamagotchi died of starvation"
            death()
        }

        
    }
}


