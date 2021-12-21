//
//  Question.swift
//  Kuis
//
//  Created by Albert Pangestu on 20/12/21.
//

import Foundation

enum QuestionError: Error {
    case AnswerExceedsTheLimit
    case NoCorrectAnswer
}

struct Question {
    
    var title = ""
    var answers = [String]()
    var correctAnswer = ""
    
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
    
    mutating func updateCorrectAnswer(_ correctAnswer: String) throws {
        
        if self.answers.contains(correctAnswer) {
            self.correctAnswer = correctAnswer
        } else {
            throw QuestionError.NoCorrectAnswer
        }
    }
}
