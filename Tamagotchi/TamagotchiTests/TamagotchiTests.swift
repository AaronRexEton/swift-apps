//
//  TamagotchiTests.swift
//  TamagotchiTests
//
//  Created by Rex, Aaron (SPH) on 21/11/2019.
//  Copyright © 2019 Rex, Aaron (SPH). All rights reserved.
//

import XCTest

class TamagotchiTests: XCTestCase {

    func testforAge() {
        let myTamagotchi = Tamagotchi()
        let tamAge = 0
        XCTAssertEqual(myTamagotchi.getAge(), tamAge)
        
    }
    
    func testforHungry() {
        let myTamagotchi = Tamagotchi()
        let tamHunger = true
        XCTAssertEqual(myTamagotchi.getHunger(), tamHunger)
        
    }
    
    func testforHappiness() {
           let myTamagotchi = Tamagotchi()
           let tamHappy = "Not very happy"
           XCTAssertEqual(myTamagotchi.getHappy(), tamHappy)
           
       }
    func testForWeight() {
        let myTamagotchi = Tamagotchi()
        let tamWeight = 5.0
        XCTAssertEqual(myTamagotchi.getWeight(), tamWeight)
        
    }

}
