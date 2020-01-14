//
//  Tamagotchi.swift
//  Tamagotchi.IOS
//
//  Created by Rex, Aaron (SPH) on 14/01/2020.
//  Copyright © 2020 Rex, Aaron (SPH). All rights reserved.
//

import Foundation

class Tamagotchi {
    
    //Attributes
    
    private var name:String
    
    private var age: Int = 0
    private var weight:Double = 5
    private var needAttention:Bool = true
    private var health:Double = 4
    private var happinessRank:Int = 3
    private var happinessLevels:[String] = ["Depressed", "Sad", "Not very happy", "neutral", "quite happy", "happy", "excuberant"]
    private var hungry:Bool = true
    private var isMale:Bool
    private var sick:Bool = false
    private var living:Bool = true
    
    //Methods
    /* <<constructor>> */ init(name: String, isMale:Bool) {
        self.name = name
        self.isMale = isMale
    }
    
    
    func feedTamagotchi () {
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
