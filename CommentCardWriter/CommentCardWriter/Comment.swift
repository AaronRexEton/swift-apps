//
//  Comment.swift
//  CommentCardWriter
//
//  Created by Rex, Aaron (SPH) on 11/02/2020.
//  Copyright © 2020 Rex, Aaron (SPH). All rights reserved.
//

import Foundation

class Comment {
    var subject: String
    var maxChar: Int = 500
    var content: Content
    
    
    init(subject: String, teacher: String, content: Content) {
        self.subject = subject
        self.content = content
    }
    

}
