//
//  Question.swift
//  Kuis
//
//  Created by Albert Pangestu on 20/12/21.
//

import Foundation

enum QuestionError: Error {
    case AnswerExceedsTheLimit
}

struct Question {
    
    var title = ""
    var answers = [String]()
    
    mutating func updateQuestion(_ title: String) {
        
        self.title = title
    }
    
    mutating func addAnswer(_ answer: String) throws {
        
        if self.answers.count < 4 {
            self.answers.append(answer)
        } else {
            throw QuestionError.AnswerExceedsTheLimit
        }
    }
}
