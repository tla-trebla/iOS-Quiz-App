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
        self.correctAnswer = correctAnswer
    }
}

// MARK: - JSON Initializer

enum SerilizationError: Error {
    case missing(String)
}

extension Question {
    
    init(json: [String: Any]) throws {
        
        // Extract title
        guard let title = json["question"] as? String else {
            throw SerilizationError.missing("title")
        }
        
        // Extract correct_answer
        guard let correctAnswer = json["correct_answer"] as? String else {
            throw SerilizationError.missing("correctAnswer")
        }
        
        // Extract incorrect_answers
        guard let incorrectAnswers = json["incorrect_answers"] as? [String] else {
            throw SerilizationError.missing("incorrectAnswers")
        }
        
        // Initialize properties
        self.title = title
    }
}
