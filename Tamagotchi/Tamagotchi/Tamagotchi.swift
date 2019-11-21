//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by Rex, Aaron (SPH) on 21/11/2019.
//  Copyright © 2019 Rex, Aaron (SPH). All rights reserved.
//

import Foundation

class Tamagotchi {
    
    //Attributes
    
    private var name:String
    
    private var age: Int = 0
    private var weight:Double = 5
    private var needAttention:Bool = true
    private var health:Double = 4
    private var happiness:String = "Not very happy"
    private var hungry:Bool = true
    private var isMale:Bool
    
    
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

    func getEverything() -> 
    func getAge () -> Int{
        return age
    }
    func getHappy() ->String{
        return happiness
    }
    func getWeight() ->Double{
        return weight
    }
    func getHunger() ->Bool{
        return hungry
    }
    
    
    
}


