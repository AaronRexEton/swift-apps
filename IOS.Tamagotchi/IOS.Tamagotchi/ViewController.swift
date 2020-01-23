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
    
    @IBOutlet var excerciseButton: UIButton!
    @IBOutlet var tamagotchiStats: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tamagotchiStats.text = tamagotchi.displayStats()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(lifeTime), userInfo: nil, repeats: true)
        GifView.loadGif(name: "TamPreEvolution")

    }

    
    @IBAction func feedTamagotchi(_ sender: Any) {
        if tamagotchi.hungry == true {
            tamagotchi.eat()
            tamagotchiStats.text = tamagotchi.displayStats()
            tamagotchiSpeech.text = "YumYum"
        } else if tamagotchi.hungry == false {
            tamagotchiSpeech.text = "I'm not hungry"
            tamagotchi.happinessRank -= 1
            tamagotchiStats.text = tamagotchi.displayStats()
        }
                
    }
    
    @IBAction func playGameTamagotchi(_ sender: Any) {
        if tamagotchi.needAttention == true {
            tamagotchi.playGame()
            tamagotchiStats.text = tamagotchi.displayStats()
            tamagotchiSpeech.text = "That was so much fun"
            tamagotchi.needAttention = false
        }
        else if tamagotchi.needAttention == false {
            tamagotchiSpeech.text = "I don't want to play"
            tamagotchi.happinessRank -= 1
            tamagotchiStats.text = tamagotchi.displayStats()
            
        }
    }
    @IBAction func exerciseTamagotchi(_ sender: Any) {
        tamagotchi.excercise()
        tamagotchiSpeech.text = "I'm exhausted"
        tamagotchi.happinessRank -= 1
        tamagotchiStats.text = tamagotchi.displayStats()

        
    }
    @IBAction func medicineTamagotchi(_ sender: Any) {
        if tamagotchi.sick == true {
            tamagotchi.medicate()
            tamagotchiStats.text = tamagotchi.displayStats()
            tamagotchiSpeech.text = "Thanks I feel better"
        }
        else {
            tamagotchiSpeech.text = "I don't want to eat the medicine!"
            tamagotchi.happinessRank -= 1
            tamagotchiStats.text = tamagotchi.displayStats()
        }
    
    }
    
    @IBAction func cleanTamagotchi(_ sender: Any) {
        if tamagotchi.clean == true {
            tamagotchi.cleanTama()
            tamagotchiStats.text = tamagotchi.displayStats()
            tamagotchiSpeech.text = "I feel refreshed"
        } else if tamagotchi.clean == false {
            tamagotchiSpeech.text = "I don't want to have a bath!"
            tamagotchi.happinessRank -= 1
            tamagotchiStats.text = tamagotchi.displayStats()
            
        }
    
    }
    
    @objc func lifeTime() {
        lifeCount += 1
        TimerDisplay.text = "\(lifeCount)"
        if lifeCount % 3 == 0 {
            tamagotchi.sick = true
            tamagotchiStats.text = tamagotchi.displayStats()
            
            tamagotchi.randomEvent = Int.random(in: 0...100)
            if tamagotchi.randomEvent > 90 {
                tamagotchiSpeech.text = "I feel sick"
                tamagotchi.sick = true
                tamagotchi.needAttention = false
                tamagotchiStats.text = tamagotchi.displayStats()
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

        
    }
}


