//
//  Tamagotchi.swift
//  IOS.Tamagotchi
//
//  Created by Rex, Aaron (SPH) on 14/01/2020.
//  Copyright © 2020 Rex, Aaron (SPH). All rights reserved.
//

import Foundation

struct Tamagotchi {
    
    //Attributes
    
    var name:String
    
    var age: Int = 0
    var weight:Double = 5
    var needAttention:Bool = true
    var health:Double = 4
    var happinessRank:Int = 3
    var happinessLevels:[String] = ["Depressed", "Sad", "Not very happy", "ok", "quite happy", "happy", "excuberant"]
    var hungry:Bool = true
    var isMale:Bool
    var sick:Bool = false
    var living:Bool = true
    
    //Methods
    /* <<constructor>> */ init(name: String, isMale:Bool) {
        self.name = name
        self.isMale = isMale
    }
    
    
    /* func feedTamagotchi () {
        if hungry == true {
            hungry = false
        }
        else {
            print("Not hungry")
        }
    }
    
    func playGame() {
        needAttention = false
        happinessRank += 1
    }
    
    func eat() {
        weight += 1
        hungry = false
        happinessRank += 1
    }
    */
    func displayStats() -> String{
        return """
        
        Name: \(name)
        Age: \(age)
        health: \(health)
        Happiness-Level: \(happinessLevels[happinessRank])
        Is Hungry: \(hungry)
        
        
        

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
