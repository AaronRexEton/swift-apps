//
//  Content.swift
//  CommentCardWriter
//
//  Created by Rex, Aaron (SPH) on 11/02/2020.
//  Copyright © 2020 Rex, Aaron (SPH). All rights reserved.
//

import Foundation

class Content {
    
    var content: String = ""
    var enjoymentLevel: [String] =  ["I like", "I really enjoy", "I love"]
    var weaknessLevel: [String] = ["I am struggling with the subject", "I find the subject difficult", "I find the difficulty of the course manageable", "I don't find the subject to be challenging", "I find the course to be quite easy"]
    var improvments: [String] = ["I need to work on time management to ensure EW is handed in on time", "I must work on my presentation to make sure my working is neatly presented", "I will implement greater concentration and effort to make sure I understand the subject content"]
    var enjoymentRank: Int
    var sentimentRank: Int
    var improvementRank: Int

    
    init(enjoymentRank: Int, sentimentRank: Int, improvementRank: Int) {
        self.enjoymentRank = enjoymentRank
        self.sentimentRank = sentimentRank
        self.improvementRank = improvementRank
    }
    
    func AddEnjoyment(rank: Int) {
        var contentTemp = self.content
        
        
    }
    
    
    
    
    
    
    
}
