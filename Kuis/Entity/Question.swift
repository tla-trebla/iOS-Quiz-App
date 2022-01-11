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
    var incorrectAnswers = Array(repeating: "", count: 3)
    var correctAnswer = ""
    
    mutating func updateQuestion(_ title: String) {
        self.title = title
    }
    
    mutating func addIncorrectAnswers(_ answers: [String]) throws {
        
        guard answers.count < 4 else {
            throw QuestionError.AnswerExceedsTheLimit
        }
        
        for (index, answer) in answers.enumerated() {
            self.incorrectAnswers[index] = answer
        }
    }
    
    mutating func updateCorrectAnswer(_ correctAnswer: String) {
        self.correctAnswer = correctAnswer
    }
}
