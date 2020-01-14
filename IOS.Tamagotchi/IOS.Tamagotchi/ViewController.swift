//
//  ViewController.swift
//  IOS.Tamagotchi
//
//  Created by Rex, Aaron (SPH) on 14/01/2020.
//  Copyright © 2020 Rex, Aaron (SPH). All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    var Mytamagotchi = Tamagotchi(name: "Bill", isMale: true)
    
    @IBOutlet var tamagotchiStats: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tamagotchiStats.text = Mytamagotchi.displayStats()

    }

    
    
    
}


