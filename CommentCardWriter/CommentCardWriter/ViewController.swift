//
//  ViewController.swift
//  CommentCardWriter
//
//  Created by Rex, Aaron (SPH) on 11/02/2020.
//  Copyright © 2020 Rex, Aaron (SPH). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //button navigation bar.push
    //if let vc =
    //identifier
    

    @IBOutlet var contentBox: UILabel!
    
    @IBOutlet var option2: UILabel!
    @IBOutlet var option1: UILabel!
    @IBOutlet var option3: UILabel!
    
    @IBOutlet var submitCommentButton: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestions()
        
        // Do any additional setup after loading the view.
    }
    
    var commentCard = CommentCard()
    var content = Content(subject: "")
    
   
    @IBAction func backToCommentCard(_ sender: Any) {
         guard let vc = storyboard?.instantiateViewController(identifier: "HomeCommentCardController", creator: { coder in
            return Home(coder: coder, commentCard: self.commentCard)
                      }) else {
                          fatalError("Failed to load Comment Card from Storyboard")
                      }
        navigationController?.pushViewController(vc, animated: true)
    }
    

    @IBAction func Rank1(_ sender: Any) {
        if content.questionCycle == 1 {
            contentBox.text = content.AddEnjoyment(rank: 1)
            updateQuestions()
        } else if content.questionCycle == 2 {
            contentBox.text = content.AddDifficulty(rank: 1)
            updateQuestions()
        } else if content.questionCycle == 3 {
            contentBox.text = content.AddWeakness(rank: 1)
            updateQuestions()
        }
    }
    
    
    @IBAction func Rank2(_ sender: Any) {
        if content.questionCycle == 1 {
            contentBox.text = content.AddEnjoyment(rank: 2)
            updateQuestions()
        } else if content.questionCycle == 2 {
            contentBox.text = content.AddDifficulty(rank: 2)
            updateQuestions()
        } else if content.questionCycle == 3 {
            contentBox.text = content.AddWeakness(rank: 2)
            updateQuestions()
        }
    }
    
    
    @IBAction func Rank3(_ sender: Any) {
        if content.questionCycle == 1 {
            contentBox.text = content.AddEnjoyment(rank: 3)
        } else if content.questionCycle == 2 {
            contentBox.text = content.AddDifficulty(rank: 3)
        } else if content.questionCycle == 3 {
            contentBox.text = content.AddWeakness(rank: 3)
        }
    }
    
    @IBAction func submitCommentCard(_ sender: Any) {
        let comment = Comment(subject: content.subject, content: content)
        commentCard.comments.append(comment)
        
    }
    
    @IBAction func createComment(_ sender: Any) {
        addSubject()
        content.questionCycle = 1
        updateQuestions()

    }
    
    func updateQuestions() {
        submitCommentButton.isEnabled = false
        if content.questionCycle == 1 {
            button1.isEnabled = true
            button2.isEnabled = true
            button3.isEnabled = true
            submitCommentButton.isEnabled = false
            option1.text = "I like \(content.subject) "
            option2.text = "I really like \(content.subject)"
            option3.text = "I love \(content.subject)"
            
        } else if content.questionCycle == 2 {
            button1.isEnabled = true
            button2.isEnabled = true
            button3.isEnabled = true
            submitCommentButton.isEnabled = false
            option1.text = "\(content.subject) is managable"
            option2.text = "I am struggling with \(content.subject)"
            option3.text = "\(content.subject) is very difficult"
        } else if content.questionCycle == 3 {
            button1.isEnabled = true
            button2.isEnabled = true
            button3.isEnabled = true
            submitCommentButton.isEnabled = false
            option1.text = "My weakness is time management"
            option2.text = "My weakness is presentation"
            option3.text = "My weakness is concentration"
        }
        else if content.questionCycle == 4 {
            button1.isEnabled = false
            button2.isEnabled = false
            button3.isEnabled = false
            submitCommentButton.isEnabled = true
            
        }
    }
    
    func addSubject() {
        let ac = UIAlertController(title: "What subject is this?", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let insertAction = UIAlertAction(title: "Add",style: .default) { [unowned ac] _ in
            if let subjectToAdd = ac.textFields![0].text {
                self.content = Content(subject: subjectToAdd)
            }
        }
        ac.addAction(insertAction)
        present(ac, animated: true)
        updateQuestions()
    }

}

