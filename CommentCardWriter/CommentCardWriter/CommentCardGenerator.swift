//
//  CommentCardGenerator.swift
//  CommentCardWriter
//
//  Created by Rex, Aaron (SPH) on 11/02/2020.
//  Copyright © 2020 Rex, Aaron (SPH). All rights reserved.
//

import Foundation

class CommentCardGenerator {
    static func createCommentCard(student: Student, NoOfSubjects: Int) -> CommentCard {
        let commentCard = CommentCard()
        
        for i in 0...1 {
            let comment = Comment(subject: String, teacher: String, content: Content)
            commentCard.comments.append(comment)
        }
        
    }
}
