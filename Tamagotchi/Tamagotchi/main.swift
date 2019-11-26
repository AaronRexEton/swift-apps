//
//  main.swift
//  Tamagotchi
//
//  Created by Rex, Aaron (SPH) on 21/11/2019.
//  Copyright © 2019 Rex, Aaron (SPH). All rights reserved.
//

import Foundation

var isMale = true
print("What would you like to name your Tamagotchi: ")
if let name = readLine() {
    print("Would you like your Tamagotchi to be Male or Female (M/F): ")
    if let gender = readLine() {
        if gender == "M" {
            isMale = true
        }
        else if gender == "F" {
            isMale = false
        }
        
        let Mytamagotchi = Tamagotchi(name: name, isMale: isMale)
        print("your Tamagotchi's name is \(Mytamagotchi.getName()) \n")
        
        
    }
}



