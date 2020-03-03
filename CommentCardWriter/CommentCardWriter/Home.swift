//
//  Home.swift
//  CommentCardWriter
//
//  Created by Rex, Aaron (SPH) on 03/03/2020.
//  Copyright © 2020 Rex, Aaron (SPH). All rights reserved.
//

import UIKit

class Home: UIViewController {
    
    var commentCard: CommentCard
    
    init?(coder: NSCoder, commentCard: CommentCard) {
         self.commentCard = commentCard
         super.init(coder: coder)
     }
     
     required init?(coder: NSCoder) {
         fatalError("You must create this Controller with a Division and Absence")
     }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
