//
//  Tamagotchi.swift
//  IOS.Tamagotchi
//
//  Created by Rex, Aaron (SPH) on 14/01/2020.
//  Copyright © 2020 Rex, Aaron (SPH). All rights reserved.
//

import Foundation

class Tamagotchi {
    
    //Attributes
    
    var name:String
    
    var age: Int = 1
    var weight:Double = 5
    var needAttention:Bool = true
    var health:Double = 4
    var clean:Bool = true
    var happinessRank:Int = 3
    var happinessLevels:[String] = ["Depressed", "Sad", "Not very happy", "ok", "quite happy", "happy", "excuberant"]
    var hungry:Bool = true
    var isMale:Bool
    var sick:Bool = true
    var living:Bool = true
    var randomEvent: Int = -1
    
    //Methods
    /* <<constructor>> */ init(name: String, isMale:Bool) {
        self.name = name
        self.isMale = isMale
    }
    
    
    
    
    func playGame() {
        self.needAttention = false
        
        if happinessRank != 6 {
            self.happinessRank += 1
        }
    }
    
    func eat() {
        self.weight += 0.5
        self.hungry = false
        if happinessRank != 6 {
            self.happinessRank += 1
        }
        
    }
    
    func excercise() {
        self.weight -= 0.5
        self.hungry = false
        if happinessRank != 6 {
            self.happinessRank += 1
        }
    }
    
    func medicate() {
    
        self.sick = false
        if happinessRank != 6 {
            self.happinessRank += 1
        }

    }
    
    func cleanTama() {
        self.clean = false
               if happinessRank != 6 {
                   self.happinessRank += 1
               }
        
  
    }
    
    func displayStats() -> String{
        return """
        
        Name: \(name)
        Age: \(age)
        health: \(health)
        Needs Attention: \(needAttention)
        Happiness-Level: \(happinessLevels[happinessRank])
        Is Hungry: \(hungry)
        Needs cleaning: \(clean)
        Is sick: \(sick)
        Weight: \(weight)
        
        
        

        """
        
    }
    
    
    func getAge () -> Int{
        return age
    }
    func getHappy() ->Int{
        return happinessRank
    }
    func getWeight() ->Double{
        return weight
    }
    func getHunger() ->Bool{
        return hungry
    }
    func getAttention() ->Bool{
        return needAttention
    }
    func getName() ->String{
        return name
    }
    
    
    
    
}
