//
//  IOS_TamagotchiTests.swift
//  IOS.TamagotchiTests
//
//  Created by Rex, Aaron (SPH) on 14/01/2020.
//  Copyright © 2020 Rex, Aaron (SPH). All rights reserved.
//

import XCTest
@testable import IOS_Tamagotchi

class IOS_TamagotchiTests: XCTestCase {
    
    func testforAge() {
        let myTamagotchi = Tamagotchi(name: "Bob", isMale: true)
        let tamAge = 0
        XCTAssertEqual(myTamagotchi.getAge(), tamAge)
        
    }
    
    func testforHungry() {
        let myTamagotchi = Tamagotchi(name: "Bob", isMale: true)
        let tamHunger = true
        XCTAssertEqual(myTamagotchi.getHunger(), tamHunger)
        
    }
    
    func testforHappiness() {
           let myTamagotchi = Tamagotchi(name: "Bob", isMale: true)
           let tamHappy = 3
           XCTAssertEqual(myTamagotchi.getHappy(), tamHappy)
           
       }
    func testForWeight() {
        let myTamagotchi = Tamagotchi(name: "Bob", isMale: true)
        let tamWeight = 5.0
        XCTAssertEqual(myTamagotchi.getWeight(), tamWeight)
        
    }
    
    func testForPlayGame() {
        let myTamagotchi = Tamagotchi(name: "Bob", isMale: true)
        let testNeedattention = false
        let testHappinessRank = 4
        myTamagotchi.playGame()
        XCTAssertEqual(myTamagotchi.getAttention(), testNeedattention)
        XCTAssertEqual(myTamagotchi.getHappy(), testHappinessRank)
        
    }
    
    func testForEat() {
        let myTamagotchi = Tamagotchi(name: "Bob", isMale: true)
        let testHungry = false
        let testHappinessRank = 4
        let testWeight = 6.0
        myTamagotchi.eat()
        XCTAssertEqual(myTamagotchi.getHunger(), testHungry)
        XCTAssertEqual(myTamagotchi.getWeight(), testWeight)
        XCTAssertEqual(myTamagotchi.getHappy(), testHappinessRank)
    }

    

}
