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
    var incorrectAnswers = [String]()
    var correctAnswer = ""
    
    mutating func updateQuestion(_ title: String) {
        self.title = title
    }
    
    mutating func addIncorrectAnswers(_ answer: String) throws {
        
        if self.incorrectAnswers.count < 3 {
            self.incorrectAnswers.append(answer)
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
