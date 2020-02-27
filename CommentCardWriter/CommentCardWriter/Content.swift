//
//  Content.swift
//  CommentCardWriter
//
//  Created by Rex, Aaron (SPH) on 11/02/2020.
//  Copyright © 2020 Rex, Aaron (SPH). All rights reserved.
//

import Foundation

class Content {
   
    var questionCycle = 1
    var content: String = ""
    var enjoymentLevel: [String] =  ["I like", "I really enjoy", "I really enjoy"]
    var weaknessLevel: [String] = ["I am struggling with the subject", "I find the subject very difficult", "I find the difficulty of the course manageable", "I don't find the subject to be challenging", "I find the course to be quite easy"]
    var improvments: [String] = ["I need to work on time management to ensure EW is handed in on time", "I must work on my presentation to make sure my working is neatly presented", "I will implement greater concentration and effort to make sure I understand the subject content"]
    var enjoymentRank: Int = 0
    var sentimentRank: Int = 0
    var improvementRank: Int = 0
    var subject: String
    // EFFORT RANK

    
    init(subject: String) {
        self.subject = subject
    }
    
    func AddEnjoyment(rank: Int) -> String {
        var contentTemp = ""
        if rank == 1 {
            contentTemp = "\(self.content) I like \(self.subject)."
        } else if rank == 2 {
            contentTemp = "\(self.content) I really enjoy \(self.subject)."
            
        } else if rank == 3 {
            contentTemp = "\(self.content) I love \(self.subject)."
            
        }
        
        self.content = contentTemp
        self.questionCycle += 1
        
        return contentTemp
        
    }
    
    func AddWeakness(rank: Int) -> String {
        var contentTemp = ""
        if rank == 1 {
            contentTemp = "\(self.content) I need to work on time management to ensure EW is handed in on time."
        } else if rank == 2 {
            contentTemp = "\(self.content) I must work on my presentation to make sure my working is neatly presented."
            
        } else if rank == 3 {
            contentTemp = "\(self.content) I will implement greater concentration and effort to make sure I understand the subject content."
            
        }
        
        self.content = contentTemp
        self.questionCycle += 1
        
        return contentTemp
        
    }
    
    func AddDifficulty(rank: Int) -> String {
        var contentTemp = ""
        if rank == 1 {
            contentTemp = "\(self.content) I find the difficulty of \(self.subject) manageable."
        } else if rank == 2 {
            contentTemp = "\(self.content) I am struggling with \(self.subject)."
            
        } else if rank == 3 {
            contentTemp = "\(self.content) I find \(self.subject) very difficult."
            
        }
        
        self.content = contentTemp
        self.questionCycle += 1
        
        return contentTemp
        
    }
    
    
    
    
    
    
    
}
